class GoodsController < ApplicationController
  def search
    if params[:keyword]
      @goods = RakutenWebService::Books::Book.search(keyword: params[:keyword], hits: 10)
    end
  end
end