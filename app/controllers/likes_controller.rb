class LikesController < ApplicationController
  before_action :set_dog
  before_action :confirm_not_owner

  def create
    @dog.likes.create! like_params
    redirect_to @dog
  end

  private
    def confirm_not_owner
      unless @dog.user_id != current_user.id
        flash[:notice] = "Spread the love! Give likes to another dog."
        redirect_to @dog
      end
    end

    def set_dog
      @dog = Dog.find(params[:dog_id])
    end

    def like_params
      params.require(:like).permit(:dog_id, :user_id)
    end
end
