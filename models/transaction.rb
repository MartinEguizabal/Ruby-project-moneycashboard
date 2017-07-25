require_relative('../db/sql_runner')
require('pry')

class Transaction

  attr_reader :id, :tag_id
  attr_accessor :merchant, :price, :date, :type

  def initialize(options)
    @id = options['id'].to_i
    @merchant = options['merchant']
    @price = options['price']
    @date = options['date']
    @type = options['type'] if options['type']
    @tag_id = options['tag_id']
  end

  def save()
    sql = "INSERT INTO transactions (merchant, price, date, tag_id) VALUES ('#{@merchant}', #{@price}, '#{@date}', #{@tag_id}) RETURNING id;"

    transaction = SqlRunner.run(sql)
    @id = transaction[0]['id'].to_i
  end

  def update()
    sql = "UPDATE transactions SET merchant = '#{@merchant}', price = #{@price}, date = '#{@date}', tag_id = #{@tag_id});"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id=#{@id};"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id};"
    transaction = SqlRunner.run(sql)
    result = Transaction.new(transaction.first)
  end

  def self.all()
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    return transactions.map{|transaction| Transaction.new(transaction)}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.total_spend
    sql = "SELECT SUM(price) FROM transactions;"
    sum = SqlRunner.run(sql)
    @total = sum[0]['sum']
  end

  def self.find_all_with_type
    # sql = "SELECT tags.type, transactions.* FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id"
    sql = "SELECT transactions.*, tags.type FROM tags, transactions WHERE transactions.tag_id = tags.id"
    transactions = SqlRunner.run(sql)
    return transactions.map{|transaction| Transaction.new(transaction)}
  end



  # how does the above return a key value pair? what part creates a hash? because i have not created a columnn called 'sum'.





end