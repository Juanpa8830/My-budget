require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'Juan Pablo', email: 'juanpa@gmail.com', encrypted_password: '123456')
    @movement = Movement.create(name: 'tickets', amount: 5.0, user_id: @user.id)
  end

  context 'Testing validations' do
    it 'Should have a name' do
      expect(@movement.name).to be_present
    end

    it 'Should have an amount' do
      expect(@movement.amount).to be_present
    end

    it 'Should have a valid amount' do
      expect(@movement.amount).to be >= 0
    end

    it 'movement amount should be decimal' do
      expect(@movement.amount).to be_a_kind_of(BigDecimal)
    end

    it 'Should have a user' do
      expect(@movement.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Should have and many and belongs to movements' do
      @movement = Movement.reflect_on_association(:categories)
      expect(@movement.macro).to eq(:has_and_belongs_to_many)
    end
  end
end
