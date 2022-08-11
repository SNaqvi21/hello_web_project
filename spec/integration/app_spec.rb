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

  context "GET method to /names" do
    it "returns the response 200 with a list of names " do
    response = get("/names", banana: "Julia, Mary, Karim, Benzema")
    expect(response.status).to eq(200)
    expect(response.body).to eq("Julia, Mary, Karim, Benzema")
    end
  end
end