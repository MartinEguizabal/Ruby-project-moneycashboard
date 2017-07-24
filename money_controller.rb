require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')

get '/transactions' do
  @transactions = Transaction.all()
  erb(:index)
end