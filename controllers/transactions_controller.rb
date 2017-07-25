require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total_spend
  erb(:"transactions/index")
end

get '/transactions/new' do
  @tags = Tag.all
  erb(:"transactions/new")
end


post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to('/transactions')
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @tags = Tag.all
  erb(:"transactions/edit")
end

post '/transactions/:id' do
  Transaction.new(params).update
  redirect to '/transactions'
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete
  redirect to '/transactions'
end