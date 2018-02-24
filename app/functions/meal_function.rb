require './app/model/meal'

module MealFunction
  class << self
    def insert(text)
      meal = Meal.new
      meal.name = text

      if meal.save
        return "ご飯 #{text} を追加しました！"
      else
        return "このご飯は登録できませんでした"
      end
    end
    
    def get_random
      return "登録されてないです" if Meal.all.count == 0
      text = "今日のご飯は" + Meal.all.sample.name + "です！\n"
      
      return text
    end
  end
end
