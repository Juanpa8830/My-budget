require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'Juan Pablo', email: 'juanpa@gmail.com', encrypted_password: '123456')
    @category = Category.create(name: 'trips', icon: 'icon.png', user_id: @user.id)
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@category.name).to be_present
    end

    it 'Should have an icon' do
      expect(@category.icon).to be_present
    end

    it 'Should have a user' do
      expect(@category.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Should belong to a user' do
      @category = Category.reflect_on_association(:user)
      expect(@category.macro).to eq(:belongs_to)
    end

    it 'Should have and many and belongs to movements' do
      @category = Category.reflect_on_association(:movements)
      expect(@category.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
