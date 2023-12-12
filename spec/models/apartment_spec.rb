require 'rails_helper'

RSpec.describe Apartment, type: :model do
  let(:user) {User.create(
    email: "test1@example.com",
    password: "password",
    password_confirmation: "password"
  )}

  it 'should validate street is not blank' do 
    apartment = user.apartments.create(
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
    expect(apartment.errors[:street]).to include("can't be blank")
  end
end
