require_relative 'questions_database'
require_relative 'questions'

class Reply

  attr_accessor :id, :parent_reply_id, :question_id, :user_id, :body
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(reply)
    @id = reply['id']
    @parent_reply_id = reply['parent_reply_id']
    @question_id = reply ['question_id']
    @user_id = reply['user_id']
    @body = reply['body']
  end

  def self.find_by_user_id(user_id)
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT * 
        FROM replies
        WHERE replies.user_id = ?
      SQL

    raise 'No replies for this user id' if result.empty?

    result.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT * 
        FROM replies
        WHERE replies.question_id = ?
      SQL

    raise 'No such question' if result.empty?

    result.map { |reply| Reply.new(reply) }
  end

  def question
    Question.find_by_id(question_id).body
  end

  def parent_reply
    raise 'No parent reply' unless parent_reply_id

    result = 
      QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        SELECT *
        FROM replies
        WHERE replies.id = ?
      SQL
    
    Reply.new(result.first)
  end

  def child_replies
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE replies.parent_reply_id = ?
      SQL

    raise 'No children' if result.empty?  
    
    result.map {|reply| Reply.new(reply)}   
  end

end