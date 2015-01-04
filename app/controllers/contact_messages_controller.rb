class ContactMessagesController < ApplicationController
  before_action :set_contact_message, only: [:show, :edit, :update, :destroy, :unread, :readed]

  # GET /contact_messages
  # GET /contact_messages.json
  def index
    @contact_message = ContactMessage.new
  end

  # POST /contact_messages
  # POST /contact_messages.json
  def create
    @contact_message = ContactMessage.new(contact_message_params)
    if user_signed_in?
      @contact_message.user = current_user
    end
    @contact_message.unread = true
    to_address = Info.first.contact_email
    respond_to do |format|
      if @contact_message.save
        UserMailer.contact_message(@contact_message, to_address).deliver 
        format.html { redirect_to contact_messages_path, notice: (t 'contact.delivered') }
        format.json { render action: 'show', status: :created, location: @contact_message }
      else
        format.html { redirect_to contact_path, alert: (t 'contact.not_delivered') }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @contact_message.unread = false
    @contact_message.save
  end
  
  def readed
    @contact_message.unread = false
    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to admin_contact_messages_path, notice: 'Contact message marked as readed.' }
        format.json { render action: 'show', status: :created, location: @contact_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def unread
    @contact_message.unread = true
    respond_to do |format|
      if @contact_message.save
        format.html { redirect_to admin_contact_messages_path, notice: 'Contact message marked as unread.' }
        format.json { render action: 'show', status: :created, location: @contact_message }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_messages/1
  # PATCH/PUT /contact_messages/1.json
  def update
    respond_to do |format|
      if @contact_message.update(contact_message_params)
        format.html { redirect_to @contact_message, notice: 'Contact message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_messages/1
  # DELETE /contact_messages/1.json
  def destroy
    @contact_message.destroy
    respond_to do |format|
      format.html { redirect_to contact_messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_message
      @contact_message = ContactMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_message_params
      params.require(:contact_message).permit(:title, :email, :content, :unread, :user_id)
    end
end
