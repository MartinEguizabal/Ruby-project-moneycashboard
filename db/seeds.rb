require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
# require('pry')

Transaction.delete_all
Tag.delete_all

tag1 = Tag.new({
  'type' => 'food'
  })

tag2 = Tag.new({
  'type' => 'clothing'
  })

tag3 = Tag.new({
  'type' => 'furniture'
  })

tag1.save
tag2.save
tag3.save

transaction1 = Transaction.new({
  'merchant' => 'Tesco',
  'price' => 1.99,
  'date' => '2017-06-20',
  'tag_id' => tag1.id
  })

transaction2 = Transaction.new({
  'merchant' => 'Aldi',
  'price' => 0.99,
  'date' => '2017-06-20',
  'tag_id' => tag1.id
  })

transaction1.save
transaction2.save

binding.pry
nil
