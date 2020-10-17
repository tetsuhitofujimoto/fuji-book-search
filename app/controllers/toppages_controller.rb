class ToppagesController < ApplicationController
  def index
    @all_ranks = Book.find(Wish.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
  end
end
