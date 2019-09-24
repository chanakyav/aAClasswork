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
        instance_variable_get(inst_var)
      end

      sttr_name = (name.to_s + '=').to_sym
      define_method(sttr_name) do |value|   # Setters
        instance_variable_set(inst_var, value)
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
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes = {} if @attributes.nil?
    return @attributes
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
