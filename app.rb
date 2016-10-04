require 'sinatra'
require 'sinatra/reloader'
$p_types = {Rational: [[0,0,0], [1,0,0]],
            Guardian: [[0,0,1], [0,1,1]],
            Artisan:  [[1,0,1], [1,1,1]],
            Idealist: [[0,1,0], [1,1,0]]}

get '/' do
  erb(:index, {layout: :template})
end

post '/' do
  @personality = ""
  answers = [params[:q1].to_i, params[:q2].to_i, params[:q3].to_i]
  # p $p_types[:Rational][1]
  $p_types.each do |key, value|
    if value[0] == answers || value[1] == answers
      @personality = key.to_s
    end
  end
  # puts @personality
  erb(:personality, {layout: :template})
end
