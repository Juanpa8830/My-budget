require 'rails_helper'

RSpec.describe MovementsController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'Juan pablo', email: 'juanpa@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create(name: 'Home', icon: 'dog.png', user: @user)
  end

  describe 'GET #new' do
    before do
      get new_category_movement_path(category_id: @category.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the index template' do
      expect(response).to render_template(:new)
    end

    it 'should displays the correct page name' do
      expect(response.body).to include('ADD')
    end
  end
end
