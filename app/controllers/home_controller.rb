class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]


  def index
    @spaces = Space.limit(6)
    @images = [
      "https://picture.liquidspace.com/Index/539968b5-74d2-44b9-9539-9b6b2c973be4?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg",
      "https://picture.liquidspace.com/Index/f2da6102-6440-4f31-802c-691cef1111d8?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg",
      "https://picture.liquidspace.com/Index/17ae153d-1741-4ba8-849a-6222911e53e2?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg",
      "https://picture.liquidspace.com/Index/6f83369b-091a-45ba-813a-8396c5e9ceaf?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg",
      "https://picture.liquidspace.com/Index/be752e91-2764-43c9-8984-b853ced3b617?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg",
      "https://picture.liquidspace.com/Index/5b8d7793-9ab8-4029-99b0-e34510aa4712?emptyImageUrl=https:%2f%2fliquidspace.com%2fContent%2fImages%2fliquid-holder.jpg"
    
    ]
  end
end
