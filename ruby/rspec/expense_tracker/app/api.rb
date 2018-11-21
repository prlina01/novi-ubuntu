require 'sinatra/base'
require 'json'

module ExpenseTracker
  class Api < Sinatra::Base
    post '/expenses' do
      JSON.generate(expense_id: 42)
    end
    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
