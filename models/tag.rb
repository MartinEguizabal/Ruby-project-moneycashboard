require_relative('../db/sql_runner')
require('pry')

class Tag

  attr_reader :id, :type

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
  end

  def save()
    sql = "INSERT INTO tags (type) VALUES ('#{@type}') RETURNING id;"
    tag = SqlRunner.run(sql)
    @id = tag[0]['id'].to_i
  end

  def update()
    sql = "UPDATE tags SET type ='#{@type}';"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = '#{@id}"
    SqlRunner.run(sql)
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

  def self.total_amount_spent_per_type(id)
    sql = "SELECT SUM(price) FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id WHERE tags.id = #{id};"
    sum = SqlRunner.run(sql)
    @type_total = sum[0]['sum']

    # sql = "SELECT SUM(price) FROM transactions INNER JOIN tags ON tags.id = transactions.tag_id WHERE tags.type = #{@type};"
    # why doesn't the above work?
  end
  # binding.pry

end