require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'Juan pablo', email: 'juanpa@gmail.com', password: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create!(name: 'Home', icon: 'dog.png', user: @user)
  end

  describe 'GET /index' do
    it 'responds successfully' do
      get categories_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get categories_path
      expect(response).to render_template(:index)
    end

    it 'displays the correct heading' do
      get categories_path
      expect(response.body).to include('CATEGORIES')
    end
  end

  describe 'GET /show' do
    before do
      get category_path(id: @category.id)
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'displays the correct heading' do
      expect(response.body).to include('TRANSACTIONS')
    end
  end

  describe 'GET /new' do
    before do
      get new_category_path
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'should displays the new template' do
      expect(response).to render_template(:new)
    end

    it 'should displays the correct heading' do
      expect(response.body).to include('ADD CATEGORY')
    end
  end
end
