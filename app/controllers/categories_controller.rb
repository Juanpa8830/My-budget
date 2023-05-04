class CategoriesController < ApplicationController
  before_action :authenticate_user!
   
def index
@categories = current_user.categories
end

def new
@current_user = current_user
@category = Category.new
end

def create
    @current_user = current_user
    @category = Category.new(category_params)
    @category.user = @current_user
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

def show
    @category = Category.find(request.params['id'])
    @current_user = current_user
    @movements = Movement.includes(:categories_movements).where(categories_movements: {category_id: @category.id},
                                                                 user_id: @current_user.id).order(created_at: :desc)
end
private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end