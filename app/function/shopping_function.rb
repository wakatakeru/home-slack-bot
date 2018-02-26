require './app/model/shopping'

module ShoppingFunction
  class << self
    def insert(text)
      item = Shopping.new
      item.content = text
      
      if item.save
        return "買い物 #{text} を追加しました！"
      else
        return "この買物は登録できませんでした"
      end
    end
    
    def get_all
      text = ""
      Shopping.all.each do |item|
        text += "#{item.content}\n"
      end
      
      text
    end

    def delete
      if Shopping.count != 0
        Shopping.all.each do |item|
          item.delete
        end
        
        return "買い物完了！ 買い物リストを削除しました！\n"
      end

      return "買い物リストはありません\n"
    end
  end
end
