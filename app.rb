require 'sinatra'
require 'sinatra/reloader'
$p_types = {Rationalist: [[0,0,0], [1,0,0], "You are both logical and creative. You are full of ideas.
You are so rational that you analyze everything. This drives people a little crazy!<br><br>

Intelligence is important to you. You always like to be around smart people.
In fact, you're often a little short with people who don't impress you mentally.<br><br>

You seem distant to some - but it's usually because you're deep in thought.
Those who understand you best are fellow Rationals.<br><br>

In love, you tend to approach things with logic. You seek a compatible mate - who is also very intelligent.<br><br>

At work, you tend to gravitate toward idea building careers - like programming, medicine, or academia.<br><br>

With others, you are very honest and direct. People often can't take your criticism well.<br><br>

As far as your looks go, you're coasting on what you were born with. You think fashion is silly.<br><br><br>

On weekends, you spend most of your time thinking, experimenting with new ideas, or learning new things. "],
            Guardian: [[0,0,1], [0,1,1],"You are sensible, down to earth, and goal oriented.
Bottom line, you are good at playing by the rules.<br><br>

You tend to be dominant - and you are a natural leader.
You are interested in rules and order. Morals are important to you.<br><br>

A hard worker, you give your all at whatever you do.
You're very serious, and people often tell you to lighten up.<br><br>

In love, you tend to take things carefully and slowly.<br><br>

At work, you are suited to almost any career - but you excel in leadership positions.<br><br>

With others, you tend to be polite and formal.<br><br>

As far as looks go, you are traditionally attractive. You take good care of yourself.<br><br>

On weekends, you tend to like to do organized activities. In fact, you often organize them! "],
            Artisan:  [[1,0,1], [1,1,1],"You are both grounded and flexible. You adapt well to new situations.
You are playful and free spirited - but you are also dependable and never flaky.<br><br>

You don't do well in conservative, stuffy situations.
It's probably very hard for you to keep a normal job or stay in school.<br><br>

You are always up for fun and adventure. Most people are too boring for you.
You take risks and bend the rules. And if things don't work out, you chock it up to life experience.<br><br>

In love, you tend to take things quickly - but you have a huge problem with commitment.<br><br>

At work, you need to make your own rules. You're best suited to be an entrepreneur.<br><br>

With others, you are animated and physical. You prefer doing something with friends to just hanging out.<br><br>

As far as your looks go, you tend to be buff and in good shape. Your spend more time on your body than your clothes.<br><br>

On weekends, you need to keep active. From cooking up a storm to running a 5K, you wear yourself out. "],
            Idealist: [[0,1,0], [1,1,0], "You are a passionate, caring, and unique person.
You are good at expressing yourself and sharing your ideals.<br><br>

You are the most compassionate of all types and connect with others easily.
Your heart tends to rule you. You can't make decisions without considering feelings.<br><br>

You seek out other empathetic people to befriend.
Truth and authenticity matters in your friendships.<br><br>

In love, you give everything you have to relationships. You fall in love easily.<br><br>

At work, you crave personal expression and meaning in your career.<br><br>

With others, you communicate well. You can spend all night talking with someone.<br><br>

As far as your looks go, you've likely taken the time to develop your own personal style.<br><br>

On weekends, you like to be with others. Charity work is also a favorite pastime of yours. "]}

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
