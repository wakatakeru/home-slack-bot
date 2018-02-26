require './app/model/application'
require 'active_record'

class ShoppingList < ActiveRecord::Base
  self.table_name = 'shopping_list'
end
