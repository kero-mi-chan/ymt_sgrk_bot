# coding: utf-8

# 必要なライブラリの読み込み
require 'pp'
require 'twitter'
require 'yaml'
require './twitter_api_wrappter.rb'
require './latest_tweet_accessor.rb'

# 定数
CONFIG_FILE = "./config.yml"

# 設定ファイルの読み込み
c = YAML.load_file CONFIG_FILE

twitter = TwitterApiWrappter.new(c['twitter'])
latest_tweet = LatestTweetAccessor.new
tweet_id = latest_tweet.read
options = {}
options[:since_id] = tweet_id if tweet_id > 0
tweets = twitter.mentions options
tweets.reverse.each do |tweet|
  pp tweet
  tweet_id = tweet.id
end
latest_tweet.write tweet_id

