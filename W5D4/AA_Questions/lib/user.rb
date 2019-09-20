require_relative 'questions_database'
require_relative 'questions'
require_relative 'reply'
require_relative 'question_follow'

class User

  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def initialize(user)
    @id = user['id']
    @fname = user['fname']
    @lname = user['lname']
  end

  def self.find_by_name(fname, lname)
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE users.fname = ? AND users.lname = ?
      SQL

    raise 'User not found' if result.empty?

    User.new(result.first)
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def authored_replies
    Reply.find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

end