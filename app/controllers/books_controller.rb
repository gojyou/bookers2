class BooksController < ApplicationController


  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
      flash[:notice] =  "successfully"
     redirect_to book_path(@book)
      else
         @user = current_user
          @books=Book.all
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
    redirect_to books_path,notice:'successfully'
   end
  end

  def edit
    @user=current_user
    @book=Book.find(params[:id])
    if @book.user==current_user
      render :edit
    else
      redirect_to books_path
    end


  end
   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
  else
     @user=current_user
    render :edit
  end
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


