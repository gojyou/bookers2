class BooksController < ApplicationController


  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
      flash[:notice] =  "successful"
    redirect_to book_path(@book)
    else
      render :index
      end
  end

  def index
    @books=Book.all
    @book = Book.new
    @user = current_user


  end

  def show
      @book = Book.find(params[:id])
      @user=@book.user


  end

  def destroy
   @book = Book.find(params[:id])
   if @book.destroy
    redirect_to books_path,notice:'successful'
   end
  end

  def edit
    @user=current_user

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end


