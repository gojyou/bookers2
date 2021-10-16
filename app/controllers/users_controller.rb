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
       @user = current_user

  end

  def edit
     @user =  current_user


  end

  def update
   @user = current_user
    if @user.update(user_params)
        flash[:notice] = "successfull"
    redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
