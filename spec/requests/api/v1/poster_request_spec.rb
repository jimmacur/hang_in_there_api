require 'rails_helper'

RSpec.describe "Posters" do
  it "sends a list of posters" do
    Poster.create!(name: "REGRET", description: "Hard work rarely pays off.", price: 89.0, year: 2018, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    Poster.create!(name: "FAILURE", description: "Why bother trying? It's probably not worth it.", price: 68.00, year: 2019, vintage: true, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    Poster.create!(name: "MEDIOCRITY", description: "Dreams are just that—dreams.", price: 127.00, year: 2021, vintage: false, img_url: "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")

    get "/api/v1/posters"

    expect(response).to be_successful

    posters = JSON.parse(response.body, symbolize_names: true)
    expect(posters[:data].count).to eq(3)

    posters[:data].each do |poster|

      expect(poster).to have_key(:id)
      expect(poster[:id]).to be_an(Integer)

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
      expect(poster[:id]).to be_an(Integer)

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