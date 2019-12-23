require 'rails_helper'
require 'pry'
#! The goal is to write 3 tests to check user validations



RSpec.describe User, type: :model do
  context "Validation Tests" do

    it 'ensures email presence' do
      user = User.new(password: "password").save
      expect(user).to eq(false)
    end

    it 'ensures first name presence' do
      user = User.new(password: "password", email: "Annalisa@email.com", last_name: "Graziano").save
      expect(user).to eq(false)
    end
    
    it 'ensures last name presence' do
      user = User.new(password: "password", email: "Annalisa@email.com", first_name: "Paul").save
      expect(user).to eq(false)
    end
  end

  context "Scope Tests" do
    let(:params) {{
      first_name: Faker::Name.unique.name,
      last_name: Faker::Name.unique.last_name,
      password: "password"
    }}

    before(:each) do
      User.new(params.merge(email: Faker::Internet.unique.free_email)).save
      User.new(params.merge(admin: true, email: Faker::Internet.unique.free_email)).save
      User.new(params.merge(admin: false, email: Faker::Internet.unique.free_email)).save
      User.new(params.merge(admin: false, email: Faker::Internet.unique.free_email)).save
    end

    it "should return admin users" do
      expect(User.administrators.count).to eq(1)
    end

    it "should return non admin users" do
      expect(User.normies.count).to eq(3)
    end

  end
end
