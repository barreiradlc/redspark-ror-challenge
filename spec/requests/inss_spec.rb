require 'rails_helper'

RSpec.describe "Insses", type: :request do  
  let(:wage_first_range) { { wage: 1045 } }
  let(:wage_second_range) { { wage: 2089.60 } }
  let(:wage_third_range) { { wage: 3134.40 } }
  let(:wage_fourth_range) { { wage: 6101.06 } }
  headers = nil
  
  describe "POST inss/discount" do
    
    before(:all) do
      user = create(:user)
      valid_credentials = { email: user.email, password: user.password }
      
      post '/login', params: valid_credentials
  
      token = JSON.parse(response.body)['token']    
      headers = { "Authorization" => "Bearer #{token}" }
    end
    
    it "returns http success" do
      post "/inss/discount", params: wage_first_range, :headers => headers      
      
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to  have_key('total_discount')
    end
    

    it "returns correct value for the first wage range" do
      post "/inss/discount", params: wage_first_range, :headers => headers      

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['total_discount']).to  eq(78.37)
    end
    
    it "returns correct value for the second wage range" do
      post "/inss/discount", params: wage_second_range, :headers => headers      

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['total_discount']).to  eq(172.38)
    end

    it "returns correct value for the third wage range" do
      post "/inss/discount", params: wage_third_range, :headers => headers      

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['total_discount']).to  eq(297.76)
    end
    
    it "returns correct value for the fourth wage range" do
      post "/inss/discount", params: wage_fourth_range, :headers => headers      

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['total_discount']).to  eq(713.09)
    end
  end

end
