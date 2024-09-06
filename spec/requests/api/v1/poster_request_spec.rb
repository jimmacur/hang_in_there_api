require 'rails_helper'
require 'simplecov'
SimpleCov.start 'rails'

RSpec.describe "Posters" do
  it "sends a list of posters" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    get "/api/v1/posters"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)#[:data]
    expect(posters[:data].count).to eq(3)

    posters[:data].each do |poster|

      expect(poster).to have_key(:id)
      expect((poster[:id])).to be_an(String)

      expect(poster).to have_key(:attributes)
      attributes = poster[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to be_a(String)

      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_a(Float)

      expect(attributes).to have_key(:year)
      expect(attributes[:year]).to be_an(Integer)

      expect(attributes).to have_key(:vintage)
      expect(attributes[:vintage]).to be_in([true, false])

      expect(attributes).to have_key(:img_url)
      expect(attributes[:img_url]).to be_a(String)
    end
  end

  it "sends data for one poster" do
    poster_1 = Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    get "/api/v1/posters/#{poster_1.id}"

    expect(response).to be_successful

    poster_response = JSON.parse(response.body, symbolize_names: true)

      expect(poster_response).to have_key(:data)
      poster = poster_response[:data]

      expect(poster).to have_key(:id)
      expect((poster[:id])).to be_an(String)

      expect(poster).to have_key(:attributes)
      attributes = poster[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to be_a(String)

      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_a(Float)

      expect(attributes).to have_key(:year)
      expect(attributes[:year]).to be_an(Integer)

      expect(attributes).to have_key(:vintage)
      expect(attributes[:vintage]).to be_in([true, false])

      expect(attributes).to have_key(:img_url)
      expect(attributes[:img_url]).to be_a(String)
  end

  it 'can create a new poster' do
    poster_params = {
      name: "REGRET", 
      description: "Hard work rarely pays off.", 
      price: 89.0, 
      year: 2018, 
      vintage: true, 
      img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d"
    }

    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/posters", headers: headers, params: JSON.generate(poster: poster_params)
    created_poster = Poster.last

    expect(response).to be_successful
    expect(created_poster.name).to eq(poster_params[:name])
    expect(created_poster.description).to eq(poster_params[:description])
    expect(created_poster.price).to eq(poster_params[:price])
    expect(created_poster.year).to eq(poster_params[:year])
    expect(created_poster.vintage).to eq(poster_params[:vintage])
    expect(created_poster.img_url).to eq(poster_params[:img_url])
  end

  it "can update an existing poster" do
    id = Poster.create(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d").id
    
    previous_name = Poster.last.name
    previous_price = Poster.last.price

    poster_params = { name: "REGRats", price: 75.5 }
    

    headers = {"CONTENT_TYPE" => "application/json"}
    # We include this header to make sure that these params are passed as JSON rather than as plain text

    patch "/api/v1/posters/#{id}", headers: headers, params: JSON.generate({poster: poster_params})
    poster = Poster.find_by(id: id)

    expect(response).to be_successful
    
    expect(poster.name).to_not eq(previous_name)
    expect(poster.name).to eq("REGRats")
    expect(poster.price).to_not eq(previous_price)
    expect(poster.price).to eq(75.5)
  end

  it "can destroy a poster" do
    poster = Poster.create(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    expect(Poster.count).to eq(1)

    delete "/api/v1/posters/#{poster.id}"

    expect(response).to be_successful
    expect(Poster.count).to eq(0)
    expect{ Poster.find(poster.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "sends returning count of posters" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
  
    expect(Poster.count).to eq(3)  

    get "/api/v1/posters"

    expect(response).to be_successful
    
    posters = JSON.parse(response.body, symbolize_names: true)
    
    expect(posters[:meta][:count]).to eq(3)
  end

  it "sends an ascending list of posters" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
  
    expect(Poster.count).to eq(3)  

    get "/api/v1/posters?sort=asc"

    expect(response).to be_successful
    
    posters = JSON.parse(response.body, symbolize_names: true)
    
    expect(posters[:data].first[:attributes][:name]).to eq("REGRET")
    expect(posters[:data].last[:attributes][:name]).to eq("MEDIOCRITY")
  end

  it "sends a descending list of posters" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
  
    expect(Poster.count).to eq(3)  

    get "/api/v1/posters?sort=desc"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)
    
    expect(posters[:data].first[:attributes][:name]).to eq("MEDIOCRITY")
    expect(posters[:data].last[:attributes][:name]).to eq("REGRET")
  end

  it "sends a filter list by name selection" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
  
    expect(Poster.count).to eq(3)  

    get "/api/v1/posters?name=re"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)
  
    expect(posters[:data].first[:attributes][:name]).to eq("FAILURE")
  end
  
end