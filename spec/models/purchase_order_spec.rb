require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入情報の保存' do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end
    context '内容に問題ないとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
      @purchase_order.building_name = ''
      expect(@purchase_order).to be_valid
      end
    end

  context '内容に問題がある場合' do
    it "user_id が空では登録できないこと" do
      @purchase_order.user_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("User can't be blank")
    end
    it "item_id が空では登録できないこと" do
      @purchase_order.item_id = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @purchase_order.token = nil
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できないこと' do
      @purchase_order.post_code = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_order.post_code = '1234567'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @purchase_order.prefecture_id = 1
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では保存できないこと' do
      @purchase_order.city = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では保存できないこと' do
      @purchase_order.address = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では保存できないこと' do
      @purchase_order.phone_number = ''
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numbeが9桁以下だと購入できないこと' do
      @purchase_order.phone_number = '090123456'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁以内の数値のみでなければ保存できないこと' do
      @purchase_order.phone_number = '090123456789'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは大文字が含まれている場合は登録できないこと' do
      @purchase_order.phone_number = '０９０１２３４５６７８'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは半角数位以外が含まれている場合は登録できない' do
      @purchase_order.phone_number = '090-1234-5678'
      @purchase_order.valid?
      expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
    end
  end
  end
end