require_relative 'questions_database'
require_relative 'questions'
require_relative 'user'

class QuestionFollow

  attr_accessor :id, :question_id, :user_id
  
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def initialize(question_follow)
    @id = question_follow['id']
    @question_id = question_follow['question_id']
    @user_id = question_follow['user_id']
  end

  def self.followers_for_question_id(question_id)

    result = 
      QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT users.id, users.fname, users.lname
        FROM users
        JOIN question_follows 
        ON question_follows.user_id = users.id
        WHERE question_follows.question_id = ?
      SQL

    raise 'No followers' if result.empty?

    result.map { |user| User.new(user) }
  end

  def self.followed_questions_for_user_id(user_id)
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT questions.id, questions.title, questions.body, questions.author
        FROM questions
        JOIN question_follows 
        ON question_follows.question_id = questions.id
        WHERE question_follows.user_id = ?
      SQL

      raise 'No followed questions' if result.empty?
      result.map { |question| Question.new(question) }
  end

end