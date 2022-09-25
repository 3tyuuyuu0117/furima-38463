require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/pexels-np-12671738.jpg")
    end

    describe '商品出品' do
      context '商品出品ができるとき' do
        it '全ての項目が入力されていれば出品ができる' do
          expect(@item).to be_valid
        end
  
        context '商品出品ができないとき' do
          it 'imageが空では登録されない' do
            @item.image = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Image can't be blank")
          end
          it 'nameが空では登録されない' do
            @item.name = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Name can't be blank")
          end
          it 'discriptionが空では登録されない' do
            @item.discription = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Discription can't be blank")
          end
          it 'category_idが空では登録されない' do
            @item.category_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Category is not a number")
          end
          it 'condition_idが空では登録されない' do
            @item.condition_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
          end
          it 'delivery_cost_idが空では登録されない' do
            @item.delivery_cost_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery cost can't be blank", "Delivery cost is not a number")
          end
          it 'prefecture_idが空では登録されない' do
            @item.prefecture_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
          end
          it 'shipping_date_idが空では登録されない' do
            @item.shipping_date_id = nil
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
          end
          it "カテゴリーの情報が必須であること" do
            @item.category_id = 1
            @item.valid?  
            expect(@item.errors.full_messages).to include("Category must be other than 1")
          end
          it "商品の状態についての情報が必須であること" do
            @item.condition_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition must be other than 1")
          end
          it "配送料の負担についての情報が必須であること" do
            @item.delivery_cost_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
          end
          it "発送元の地域についての情報が必須であること" do
            @item.prefecture_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
          end
          it "発送までの日数についての情報が必須であること" do
            @item.shipping_date_id = 1
            @item.valid?
            expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
          end
          it 'priceが空では登録されない' do
            @item.price = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
          end
          it 'priceが300以下では登録されない' do
            @item.price = 299
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
          end
          it 'priceが9999999より多いと登録できない' do
            @item.price = 1000000000
            @item.valid?
            expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
          end
      end
    end
  end
end