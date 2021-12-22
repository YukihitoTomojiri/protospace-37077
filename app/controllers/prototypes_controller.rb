class PrototypesController < ApplicationController
  def index
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create!(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      @prototypes = @prototype.includes(:user)
      render :new_prototype
    end 
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end