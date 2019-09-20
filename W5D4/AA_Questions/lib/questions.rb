require_relative 'questions_database'
require_relative 'reply'
require_relative 'question_follow'

class Question

  attr_accessor :id, :title, :body, :author

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def initialize(question)
    @id = question['id']
    @title = question['title']
    @body = question['body']
    @author = question['author']
  end

  def self.find_by_id(id)
    result = 
      QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT * 
        FROM questions 
        WHERE questions.id = ?
      SQL

    raise 'Could not find Id' if result.empty?

    Question.new(result.first)
  end

  def self.find_by_author_id(author_id)
    result =
      QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        WHERE questions.author = ?
      SQL

    raise 'Could not find author' if result.empty?

    result.map { |row| Question.new(row) }
  end

  def replies
    Reply.find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

end