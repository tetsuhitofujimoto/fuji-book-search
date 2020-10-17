class BooksController < ApplicationController
  def search
    @books = []
    @title = params[:title]
    
    
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        hits: 15
      })
      
      results.each do |result|
        book = Book.find_or_create_by(read(result))
        @books << book
      end
    end
  end

  private

    def read(result)
      title = result['title']
      author = result["author"]
      publisher_name = result["publisherName"]
      item_caption = result["itemCaption"]
      item_url = result['itemUrl']
      image_url = result['mediumImageUrl']
      
      {
        title: title,
        author: author,
        publisher_name: publisher_name,
        item_caption: item_caption,
        item_url: item_url,
        image_url: image_url
      }
    end
end