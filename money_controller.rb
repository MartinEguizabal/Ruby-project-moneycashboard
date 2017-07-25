require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/transaction.rb')
require_relative('./models/tag.rb')

get '/transactions' do
  @transactions = Transaction.find_all_with_type()
  @total = Transaction.total_spend
  erb(:index)
end

get '/transactions/new' do
  @transactions = Transaction.all
  erb(:new)
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to("/transactions/index")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  erb(:edit)
end