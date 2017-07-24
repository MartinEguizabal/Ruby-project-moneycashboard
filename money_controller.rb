require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/transaction.rb')
require_relative('./models/tag.rb')

get '/transactions' do
  @transactions = Transaction.find_all_with_type()
  erb(:index)
end

get '/transactions/new' do
  erb(:new)
end