class BooksController < ApplicationController
  before_action :ensure_current_user
  before_action :set_search_title, only: %i[search google_search]
  before_action :set_book, only: %i[add_to_favorites add_to_wishlist add_to_reads show]

  def google_search
    search_service = BooksSearchService.new(max_results: 10)
    @results = search_service.call(@title)
    render :google_search_results
  end

  def google_search_results
  end

  def import
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      flash[:alert] = "Failed to import #{book_params[:title]}"
      render :google_search_results, status: :unprocessable_entity
    end
  end

  #Search bar by book title
  def search
    @results = Book.search_by_title(@title)
    render action: :search_results
  end

  #Render search result in views
  def search_results
  end

  def show
  end

  def add_to_favorites
    unless already_favorite? @book
      ProfileFavoriteBook.create!(
        profile: current_user.profile,
        book: @book
      )
    end
    redirect_to main_path
  end

  #If book is not in the wishlist yet, add it (login needed)
  def add_to_wishlist
    unless already_wishlist? @book
      ProfileWishlistedBook.create!(
        profile: current_user.profile,
        book: @book
      )
    end
    redirect_to main_path
  end

  def add_to_reads
    unless already_reads? @book
      ProfileReadBook.create!(
        profile: current_user.profile,
        book: @book
      )
    end
    redirect_to main_path
  end

  #Remove books from sections
  def remove_from_favorites
    current_user.profile.profile_favorite_books.find(params[:favorite_id]).destroy
    redirect_to main_path
  end

  def remove_from_wishlist
    current_user.profile.profile_wishlisted_books.find(params[:wishlist_id]).destroy
    redirect_to main_path
  end

  def remove_from_reads
    current_user.profile.profile_read_books.find(params[:read_id]).destroy
    redirect_to main_path
  end


  #generate meth
  private

  def book_params
    params.require(:book).permit(:title, :cover)
  end

  def already_favorite?(book)
    current_user.profile.favorite_book_ids.include? book.id
  end

  def already_wishlist? book
    current_user.profile.wishlist_book_ids.include? book.id
  end

  def already_reads? book
    current_user.profile.read_book_ids.include? book.id
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_search_title
    @title = params[:title]
  end
end
