class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age: params[:age])
    else
      @comedians = Comedian.all
      @specials = Special.all.includes(:comedian)
      @average_age = Comedian.average_age
    end
    erb :'comedians'
  end
end
