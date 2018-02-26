require 'active_record'

ADAPTER = 'postgresql'
DB_NAME = 'home_slack_bot'

puts '[Setup]'

ActiveRecord::Base.establish_connection(
  adapter: ADAPTER,
  host: ENV['DB_ADDRESS'],
  user: ENV['DB_USERNAME'],
  database: DB_NAME
)

if ActiveRecord::Base.connection.table_exists?('todo') == false
  ActiveRecord::Migration.create_table :todo do |t|
    t.string  :content
    t.timestamp :created_at, :null => false
  end
end

if ActiveRecord::Base.connection.table_exists?('meal') == false
  ActiveRecord::Migration.create_table :meal do |t|
    t.string  :name
    t.timestamp :created_at, :null => false
  end
end

if ActiveRecord::Base.connection.table_exists?('shoppoing_list') == false
  ActiveRecord::Migration.create_table :shoppoing_list do |t|
    t.string  :content
    t.timestamp :created_at, :null => false
  end
end

