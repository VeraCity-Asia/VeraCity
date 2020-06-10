class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @messages = Message.all
  end

  def by_product
  end

  def new
    @message = Message.new
    @product = Product.find(params[:product_id])
  end

  def create
    @message = Message.new(message_params)
    @product = Product.find(params[:message][:product_id])
    @message.product_id = @product.id
    @message.sender_id = current_user.id
    @message.receiver_id = @product.supplier.user_id
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:title, :content)
  end
end
