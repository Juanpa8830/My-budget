require 'rails_helper'

RSpec.describe 'categories/show', type: :feature do
  include Warden::Test::Helpers

  before do
    @user = User.create(name: 'Juan Pablo', email: 'juanpa@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @user.skip_confirmation!
    @user.save
    login_as(@user, scope: :user)
    @category = Category.create(name: 'Trips', icon: 'dog.png', user: @user)
    @movement = Movement.create(name: 'Tickets', amount: 90.0, user: @user)
    visit category_path(@category)
  end

  it 'displays App name' do
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'displays category name' do
    expect(page).to have_content('Trips')
  end

  it 'displays category name' do
    expect(page).to have_content(@category.name)
  end
end
