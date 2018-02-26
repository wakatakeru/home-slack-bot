require './app/function/fortune_function'
require './app/function/meal_function'
require './app/function/todo_function'
require './app/function/weather_function'

require 'slack-ruby-client'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

client = Slack::RealTime::Client.new

client.on :hello do
  puts '[Successfully] Connection Establish'
end

client.on :message do |data|
  case data.text
  when 'hi'
    client.web_client.chat_postMessage channel: data.channel, text: 'ウェイ'
  when 'sc'
    client.web_client.chat_postMessage channel: data.channel, text: '今日の予定は<未実装>'
  when 'wt'
    client.web_client.chat_postMessage channel: data.channel, text: "#{WeatherFunction.get_description}"
  when 'todo'
    client.web_client.chat_postMessage channel: data.channel, text: "予定の一覧だよ！\n #{TodoFunction.get_all}"
  when /^todo add/
    client.web_client.chat_postMessage channel: data.channel, text: "#{TodoFunction.insert(data.text.split(' ')[2])}"
  when /^todo rm/
    client.web_client.chat_postMessage channel: data.channel, text: "#{TodoFunction.delete(data.text.split(' ')[2].to_i)}"
  when /^bl add/
    client.web_client.chat_postMessage channel: data.channel, text: "<未実装>"
  when 'おみくじ'
    client.web_client.chat_postMessage channel: data.channel, text: "#{FortuneFunction.get_fortune}"
  when '今日のご飯'
    client.web_client.chat_postMessage channel: data.channel, text: "#{MealFunction.get_random}"
  when /^今日のご飯 add/
    client.web_client.chat_postMessage channel: data.channel, text: "#{MealFunction.insert(data.text.split(' ')[2])}"
  end
end

client.start!
