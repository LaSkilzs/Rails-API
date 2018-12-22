require 'rails_helper'


describe ArticlesController do
  #Make sure test has a reponse(passes with render: json{})
  describe '#index' do 
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    #Make sure test have a body so (render json:{} wont work alone)
    it 'should return proper json' do
      get :index
      json = JSON.parse(response.body)
      pp json
      # json_data = json[:data]
      # expect(json_data.length).to eq(2)
    end

  end
end