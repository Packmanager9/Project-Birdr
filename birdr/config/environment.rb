require 'bundler'

require 'colorize'
require 'chroma'
require 'rainbow'

Bundler.require
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/dev.db')
require_all 'lib'