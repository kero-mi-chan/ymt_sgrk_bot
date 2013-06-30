# encoding: utf-8

require 'mysql2'

class MysqlWrapper
  def initialize(config = {})
    @con = Mysql2::Client.new config
  end

  def station_exist?(station)
  end

  def create_new_game(master, station_id)
  end

  def sugoroku(player)
  end
end
