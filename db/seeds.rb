require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
# require('pry')

Transaction.delete_all
Tag.delete_all

tag1 = Tag.new({
  'name' => 'food'
  })

tag2 = Tag.new({
  'name' => 'clothing'
  })

tag3 = Tag.new({
  'name' => 'bling'
  })

tag4 = Tag.new({
  'name' => 'furniture'
  })

tag5 = Tag.new({
  'name' => 'vehicle'
  })

tag1.save
tag2.save
tag3.save
tag4.save
tag5.save

transaction1 = Transaction.new({
  'merchant' => 'Tesco',
  'price' => 2,
  'date' => '2017-06-20',
  'tag_id' => tag1.id
  })

transaction2 = Transaction.new({
  'merchant' => 'Freaky fried chicken',
  'price' => 20,
  'date' => '2017-06-20',
  'tag_id' => tag1.id
  })

transaction3 = Transaction.new({
  'merchant' => 'Cribs 4U',
  'price' => 200,
  'date' => '2017-07-21',
  'tag_id' => tag4.id
  })

transaction4 = Transaction.new({
  'merchant' => 'Gangsta threads',
  'price' => 400,
  'date' => '2017-07-05',
  'tag_id' => tag2.id
  })

transaction5 = Transaction.new({
  'merchant' => '67 Cadillac',
  'price' => 20000,
  'date' => '2017-07-05',
  'tag_id' => tag5.id
  })

transaction6 = Transaction.new({
  'merchant' => 'Diamond grill',
  'price' => 1500,
  'date' => '2017-07-05',
  'tag_id' => tag3.id
  })

transaction1.save
transaction2.save
transaction3.save
transaction4.save
transaction5.save
transaction6.save

binding.pry
nil
