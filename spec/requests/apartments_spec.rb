require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) {User.create(
    email: "test1@example.com",
    password: "password",
    password_confirmation: "password"
  )}

  describe "GET /index" do
    it 'gets a list of apartments' do 
      apartment = user.apartments.create(
        street: "Walaby Way",
        unit: "42",
        city: "Sydney",
        state: "Australia",
        square_footage: 1500,
        price: 3000,
        bedrooms: 3,
        bathrooms: 2,
        pets: "fish only",
        image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq "Walaby Way"
    end
  end

  describe "POST /create" do 
    it 'creates an apartment' do 
      apartment_params = {
        apartment: {
          street: "Walaby Way",
          unit: "42",
          city: "Sydney",
          state: "Australia",
          square_footage: 1500,
          price: 3000,
          bedrooms: 3,
          bathrooms: 2,
          pets: "fish only",
          image: "https://images.unsplash.com/photo-1540448051910-09cfadd5df61?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          user_id: user.id
        }
      }

      post '/apartments', params: apartment_params

      apartment = Apartment.first
      expect(response).to have_http_status(200)
      expect(apartment.street).to eq "Walaby Way"
      expect(apartment.unit).to eq "42"
    end
  end
end
