class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_policy_scoped

  def index
    authorize current_user, policy_class: MessagePolicy
    @messages = Message.latest_messages_by_product(current_user)
    # @latest =  messages.first ?
  end

  def by_product
    @product = Product.find(params[:product_id])
    @messages = Message.conversation(params[:interlocutors], @product)
    authorize @messages
    @message = Message.new
  end

  def new
    @message = Message.new
    @receiver = User.find(params[:receiver_id])
    # policy_class: app/policies/message_policy#create
    authorize @message
    @product = Product.find(params[:product_id])
  end

  def create
    @message = Message.new(message_params)
    @product = Product.find(params[:message][:product_id])
    @message.product_id = @product.id
    @message.sender_id = current_user.id

    # policy_class: app/policies/message_policy#create
    authorize @message

    if @message.save
      flash[:alert] = "Your message submitted successfully!"
      redirect_to messages_path
    else
      # TODO: add alert describing error message
      render :new
    end
  end


  private

  def message_params
    params.require(:message).permit(:title, :content, :product_id, :receiver_id)
  end
end
