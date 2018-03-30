class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @subscribers = Subscriber.count
    @regions = Region.all
  end

  def create_subscription
    @subscriber = Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to root_path, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { redirect_to root_path, alert: 'Failed.' }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:name, :email, :region_id)
    end
end
