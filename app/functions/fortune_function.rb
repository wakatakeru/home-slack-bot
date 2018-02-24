module FortuneFunction
  class << self
    FORTUNES = ["大吉", "中吉", "小吉", "凶", "大凶", "ぴょん吉"]
    def get_fortune
      return "今日の運勢は、#{FORTUNES.sample} です！\n"
    end
  end
end
