require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'Juan Pablo', email: 'juanpa@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create(name: 'Trips', icon: 'dog.png', user: @user)
    @movement = Movement.create(user: @user, name: 'tickets', amount: 90)
    visit categories_path
  end

  it 'displays App name' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'displays user name' do
    expect(page).to have_content(@category.name)
  end

  it 'displays sign in as' do
    expect(page).to have_content(@category.updated_at.strftime('%d %b %Y'))
  end

  it 'displays a sign out button' do
    expect(page).to have_link('ADD CATEGORY', href: new_category_path)
  end
end
