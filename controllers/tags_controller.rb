require_relative('../models/transaction.rb')
require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all()
  erb(:"tags/index")
end

get '/tags/new' do
  @tags = Tag.all
  erb(:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to('/tags')
end

post '/tags/:id/delete' do
  tag = Tag.find(params[:id])
  tag.delete
  redirect to '/tags'
end