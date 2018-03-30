class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @subscribers = Subscriber.count
    @regions = Region.all
  end
end
