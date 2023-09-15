class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render "new"
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if restaurant.update(restaurant_params)
      redirect_to restaurant_path(restaurant)
    else
      render :edit, status: :unprocessable_entity
    end
  end

    def remove
      @restaurant = Restaurant.find(params[:id])
    end

    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      redirect_to tasks_path, status: :see_other
    end

    def edit
      @restaurant = Restaurant.find(params[:id])
    end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end

# with valid params
#       creates a new Restaurant (FAILED - 4)
#       assigns a newly created restaurant as @restaurant (FAILED - 5)
#       redirects to the created restaurant (FAILED - 6)
#     with invalid params
#       assigns a newly created but unsaved restaurant as @restaurant (FAILED - 7)
#       re-renders the 'new' template (FAILED - 8)
