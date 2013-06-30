# coding: utf-8

class LatestTweetAccessor
  def initialize(file = "./latest_tweet")
    @file = file
  end

  def read
    id = 0

    if File.exist? @file
      id = File.read @file
    end

    id
  end

  def write(value)
    if 0 < value then
      File.write @file, value
    end
  end
end
