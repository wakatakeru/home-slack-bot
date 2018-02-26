require './app/model/application'
require 'active_record'

class Shopping < ActiveRecord::Base
  self.table_name = 'shopping'
end
