class WishesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    book = Book.find(params[:book_id])
    current_user.wish(book)
    flash[:success] = "欲しい本リストに追加しました。"
    redirect_to request.referer
  end

  def destroy
    book =Book.find(params[:book_id])
    current_user.unwish(book)
    flash[:success] = "欲しい本リストから削除しました。"
    redirect_to request.referer
  end
end
