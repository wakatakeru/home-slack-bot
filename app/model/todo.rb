require './app/model/application'
require 'active_record'

class Todo < ActiveRecord::Base
  self.table_name = 'todo'
end
