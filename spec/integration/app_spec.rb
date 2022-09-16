require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "POST method to /sort-names" do
    it "returns the response 200 OK with a sorted string list of names" do
    response = post("/sort-names", names: 'Joe,Alice,Zoe,Julia,Kieran')
    expect(response.status).to eq(200)
    expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context "GET to /names" do
    it "returns the response 200 OK with a list of names " do
    response = get("/names", names: "Julia, Mary, Karim")
    expect(response.status).to eq(200)
    expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "GET /hello" do
    it "should return 'Helllo Syed'" do
      response = get("/hello?name=Syed")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Syed")
    end

    it "should return 'Helllo Ali'" do
      response = get("/hello?name=Ali")
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Ali")
    end
  end
end