require 'pry'
require 'nokogiri'
require 'open-uri'
require 'httparty'
require 'dotenv/load'
require 'colorize'
require 'tty-prompt'



require_relative "../lib/Covid_19/version"
require_relative "../lib/Covid_19/api"
require_relative "../lib/Covid_19/cli"
require_relative "../lib/Covid_19/covid"
require_relative "./seeds"
