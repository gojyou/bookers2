class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
     @books=@user.books

  end
  def index

      @book = Book.new
     @users=User.all
      @user = current_user
      @books=Book.all

  end

  def edit
     @user =  User.find(params[:id])
     if @user==current_user
         render :edit
     else
         redirect_to user_path(current_user)
         end


  end

  def update
   @user = current_user
    if @user.update(user_params)
        flash[:notice] = "successfully"
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
