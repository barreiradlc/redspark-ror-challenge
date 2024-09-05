require 'rails_helper'

RSpec.describe "Proponents", type: :request do
  let(:create_proponent_payload) { { 
    data: {
      name: Faker::Name.name_with_middle,
      cpf: Faker::Number.number(digits: 11), 
      birth_date: Faker::Date.between(from: '2014-09-23', to: '1955-09-25'),
      wage: Faker::Number.number(digits: 4),
      inss_discount: Faker::Number.between(from: 87, to: 450),
      adress: {
        street: Faker::Address.street_name,
        number: Faker::Address.building_number,
        neighborhood: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code
      },
      phones: [
        {
          contact_type: ["personal", "reference"].sample,
          country_code: Faker::PhoneNumber.country_code,
          state_code: Faker::Number.number(digits: 2),
          number: Faker::Number.between(from: 900000000, to: 999999999)
        },
        {
          contact_type: ["personal", "reference"].sample,
          country_code: Faker::PhoneNumber.country_code,
          state_code: Faker::Number.number(digits: 2),
          number: Faker::Number.between(from: 900000000, to: 999999999)
        },
      ],            
    }
   } }
  headers = nil
    
  before(:all) do
    user = create(:user)
    valid_credentials = { email: user.email, password: user.password }
    
    post '/login', params: valid_credentials

    token = JSON.parse(response.body)['token']    
    headers = { "Authorization" => "Bearer #{token}" }    
  end

  describe "GET /index" do
    after(:all) do
      Proponent.all.destroy_all
    end

    before(:all) do
      10.times do
        FactoryBot.create(:proponent)
      end
    end

    it "returns http success" do
      get "/proponents", :headers => headers      
        
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to  have_key('proponents')
    end    
    
    it "returns the second page with success" do
      get "/proponents", :params => { :page => 2  },  :headers => headers      
        
      @first_record = JSON.parse(response.body)['proponents'][0]

      expect(@first_record['id']).to  eq(6)
    end
    
    context "validate per page works" do
      it "validate per page as 5" do
        get "/proponents", :params => { :page => 1, :per_page => 5  },  :headers => headers      
          
        @records = JSON.parse(response.body)['proponents'].count

        expect(@records).to  eq(5)
      end
      
      it "validate per page as 10" do
        get "/proponents", :params => { :page => 1, :per_page => 10  },  :headers => headers      
          
        @records = JSON.parse(response.body)['proponents'].count

        expect(@records).to  eq(10)
      end
    end
  end

  describe "GET /report" do
    after(:all) do
      Proponent.all.destroy_all
    end

    before(:all) do
      60.times do
        FactoryBot.create(:proponent)
      end
    end

    it "returns http success" do
      get "/proponents/report", :headers => headers      
        
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to  have_key('proponents_report')
      expect(JSON.parse(response.body)['proponents_report'].count).to  eq(4)
    end
  end

  describe "POST /create" do    
    it "returns http success" do
      post "/proponents", params: create_proponent_payload , :headers => headers      
        
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to  have_key('proponent')
    end
    
    it "returns http success" do
      post "/proponents", params: create_proponent_payload , :headers => headers      
        
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to  have_key('proponent')
    end
  end
      
end
