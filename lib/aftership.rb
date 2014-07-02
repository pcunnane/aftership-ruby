$:.unshift File.dirname(__FILE__)

require "aftership/courier"
require "aftership/tracking"
require "aftership/last_checkpoint"

module AfterShip
  class << self;
    attr_accessor :api_key

    ##
    # Define a block to alter a request before sending.
    #
    # AfterShip.before_send do |request|
    #   request.request.open_timeout = 5
    #   request.read_timeout = 5
    #   request.auth.ssl.verify_mode = :none
    # end
    #
    def before_send(request = nil, &blk)
      @before_send ||= ->(request){}
      if block_given?
        @before_send = blk
      else
        @before_send.call(request)
      end
    end
  end

  URL = "https://api.aftership.com"
end