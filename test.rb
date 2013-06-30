# coding: utf-8

require './twitter_api_wrappter.rb'
require 'yaml'
CONFIG_FILE = "./config.yml"

c = YAML.load_file CONFIG_FILE


t = TwitterApiWrappter.new c['twitter']

t.update 'こんにちはー'
