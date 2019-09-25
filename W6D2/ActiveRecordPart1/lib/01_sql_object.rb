require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    if @columns.nil?
      columns = DBConnection.execute2(<<-SQL).first
        SELECT *
        FROM #{self.table_name}
        LIMIT 1
      SQL
      @columns = columns.map(&:to_sym)
    end
    return @columns
  end

  def self.finalize!
    self.columns.each do |name|
      inst_var = '@'+name.to_s

      define_method(name) do                # Getters
        attributes[name]
      end

      sttr_name = (name.to_s + '=').to_sym
      define_method(sttr_name) do |value|   # Setters
        attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    return self.name.tableize if @table_name.nil?
    @table_name
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT *
      FROM #{self.table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |row| self.new(row) }
  end

  def self.find(id)
    table = self.table_name
    results = DBConnection.execute(<<-SQL, id)
      SELECT *
      FROM #{table}
      WHERE #{table}.id = ?
    SQL
    self.parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      unless self.class.columns.include?(attr_name.to_sym)
        raise "unknown attribute '#{attr_name}'"
      end
      sttr_name = (attr_name.to_s + '=').to_sym
      send(sttr_name, value)
    end
  end

  def attributes
    @attributes = {} if @attributes.nil?
    return @attributes
  end

  def attribute_values
    attributes.values
  end

  def insert
    col_names = self.class.columns.drop(1).map(&:to_s).join(', ')
    question_marks = (['?'] * (self.class.columns.length - 1)).join(', ')

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    col_names = self.class.columns.drop(1).map(&:to_s).join(' = ?, ') + (' = ?')

    DBConnection.execute(<<-SQL, *attribute_values.drop(1), self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{col_names}
      WHERE
        id = ?
    SQL
  end

  def save
    self.id.nil? ? self.insert : self.update
  end
end
