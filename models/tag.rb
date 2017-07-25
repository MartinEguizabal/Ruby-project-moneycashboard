require_relative('../db/sql_runner')
require('pry')

class Tag

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING id;"
    tag = SqlRunner.run(sql)
    @id = tag[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id};"
    tag = SqlRunner.run(sql)
    result = Tag.new(tag.first)
  end

  def self.all()
    sql = "SELECT * FROM tags;"
    tags = SqlRunner.run(sql)
    return tags.map{|tag| Tag.new(tag)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end

  def total_amount_spent_per_type
    sql = "SELECT SUM(price) FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id WHERE tags.id = #{@id};"
    sum = SqlRunner.run(sql)
    return sum[0]['sum']

    # sql = "SELECT SUM(price) FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id WHERE tags.type = #{@type};"
    # why doesn't the above work?
  end

  # def self.select_by_type
  #   sql = "SELECT * FROM transactions WHERE "
  # end
  # binding.pry

end