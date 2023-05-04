require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(id: 1, name: 'Juan Pablo', email: 'juanpa@gmail.com', encrypted_password: '123456')
  end


  context 'Testing validations' do
     it 'User should have a name' do
      expect(@user.name).to be_present
    end

    it 'User should have an email' do
      expect(@user.email).to be_present
    end

    it 'User should have a password' do
      expect(@user.encrypted_password).to be_present
    end
  end

  context 'Testing associations' do
    it 'User should have many categories' do
      @user = User.reflect_on_association(:categories)
      expect(@user.macro).to eq(:has_many)
    end

    it 'User should have many movements' do
      subject = User.reflect_on_association(:movements)
      expect(subject.macro).to eq(:has_many)
    end
  end
end
