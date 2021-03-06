class SubscriptionController < ApplicationController
  
  def create
    @subscription = Subscription.new(subscription_params)
    respond_to do |format|
      if Subscription.find_by_email(@subscription.email) == nil 
        if @subscription.save
          format.html { redirect_to root_path, notice: 'Thanks for subscribing to our newsletter' }
          format.json { render action: 'show', status: :created, location: @subscription }
        else
          format.html { redirect_to root_path, alert: 'An error ocured. Please try gain.' }
          format.json { render json: @subscription.errors, status: :unprocessable_entity }
        end     
      else
        format.html { redirect_to root_path, alert: 'You have already registered to our newsletter' }
        format.json { render action: 'show', status: :created, location: @subscription }
      end      
    end
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(:first_name, :last_name, :email)
  end
  
end
