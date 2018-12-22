require 'rails_helper'


describe ArticlesController do
  #Make sure test has a reponse(passes with render: json{})
  describe '#index' do 
    subject { get :index }
    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    #Make sure test have a body so (render json:{} wont work alone)
    it 'should return proper json' do
      articles = create_list :article, 2
      subject
      json = JSON.parse(response.body)
      # pp json
      json_data = json['data']
      expect(json_data.length).to eq(2)
      expect(json_data[0]['attributes']).to eq({
        "title" => "My awesome article 1",
        "content" => "The content of my awesome article 1",
        "slug" => "my-awesome-article-1"
        })
        expect(json_data[1]['attributes']).to eq({
        "title" => "My awesome article 2",
        "content" => "The content of my awesome article 2",
        "slug" => "my-awesome-article-2"
        })
    end
  end
end



# #### Alterative Way to Shorten Code  -- includes support folder ### 
# describe '#index' do
#   it 'should return success response' do
#     get :index
#     expect(response).to have_http_status(:ok)
#   end

#   it 'should return proper json' do
#     articles = create_list :article, 2
#     get :index
#     articles.each_with_index do |article, index|
#       expect(json_data[index]['attributes']).to eq({
#         'title' => article.title,
#         'content' => article.content,
#         'slug' => article.slug
#       })
#     end
#   end
# end



######### the use of subject ##########
# describe '#index' do
#   subject { get :index }

#   it 'should return success response' do
#     subject
#     expect(response).to have_http_status(:ok)
#   end

#   it 'should return proper json' do
#     articles = create_list :article, 2
#     subject
#     articles.each_with_index do |article, index|
#       expect(json_data[index]['attributes']).to eq({
#         'title' => article.title,
#         'content' => article.content,
#         'slug' => article.slug
#       })
#     end
#   end
# end