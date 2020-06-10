class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @messages = Message.all
  end

  def by_product
  end

  def new
    @message = Message.new
    # @product = Product.find(params[:product_id])
  end

  def create
    @message = Message.new(message_params)
    # @product = Product.find(params[:product_id])
    @user = current_user
    @message.sender_id = user.id
    @message.receiver_id = @product.supplier.id
    raise
  end


  private

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
