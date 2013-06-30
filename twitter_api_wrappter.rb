# coding: utf-8

require 'twitter'

class TwitterApiWrappter
  def initialize(config = {}) 
    @core = Twitter::Client.new(
      :consumer_key => config['consumer_key'],
      :consumer_secret => config['consumer_secret'],
      :oauth_token => config['oauth_token'],
      :oauth_token_secret => config['oauth_token_secret'])
  end

  def mentions(options = {})
    tweets = @core.mentions options
  end

  def update(message)
    @core.update message
  end
end
