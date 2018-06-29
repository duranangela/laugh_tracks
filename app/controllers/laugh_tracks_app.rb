class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @specials = Special.all.includes(:comedian)
    erb :'comedians'
  end
end
