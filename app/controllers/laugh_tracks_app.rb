class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @specials = Special.all.includes(:comedian)
    @average_age = Comedian.average_age
    erb :'comedians'
  end

end
