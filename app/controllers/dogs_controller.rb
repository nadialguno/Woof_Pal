class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    if @dog.save
      redirect_to dog_path(@dog)
    else
      render :new
    end

    def show
      @dog = Dog.find(params[:id])
    end


  end

  private

  def dog_params
    params.require(:dog).permit(:name, :born_on, :photo)
  end
end
