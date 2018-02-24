require './app/model/todo'

module TodoFunction
  class << self
    def insert(text)
      todo = Todo.new
      todo.content = text

      if todo.save
        return "ToDo #{text} を追加しました！"
      else
        return "ToDOが登録できませんでした"
      end
    end
    
    def get_all
      text = ""
      Todo.all.each do |t|
        text += "#{t.id}: #{t.content}\n"
      end
      
      text
    end

    def delete(id)
      if Todo.exists?(id: id)
        todo = Todo.find(id)
        text = todo.content
        todo.delete
        return "#{text} 完了！ ToDo から削除しました！\n"
      end

      return "#{id}番目の予定は見つからないです\n"
    end
  end
end
