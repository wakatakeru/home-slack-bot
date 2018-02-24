require './app/model/application'
require 'active_record'

class Meal < ActiveRecord::Base
  self.table_name = 'meal'
end
