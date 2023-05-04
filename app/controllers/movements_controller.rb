class MovementsController < ApplicationController
    before_action :set_category
    before_action :authenticate_user!

  def new
    @current_user = current_user
    @movement = Movement.new
    @categories = current_user.categories
  end

  def create
    @current_user = current_user
    @movement = Movement.new(name: params[:movement][:name], amount: params[:movement][:amount])
    @movement.user = @current_user
    @categories_id = params[:movement][:category_id]
    @categories_id.each do |category_id|
      category = Category.find(category_id)
      @movement.categories << category
    end
    if @movement.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def destroy
    @movement = Movement.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to category_path(@category), notice: 'movement deleted successfully' }
    end
  end
  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def entity_params
    params.require(:movement).permit(:name, :amount, category_id: [])
  end


end
