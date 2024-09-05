# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Poster.create("name": "REGRET", "description": "Hard work rarely pays off.", "price": 89.0, "year": 2018, "vintage": true, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "FAILURE", "description": "Why bother trying? It's probably not worth it.", "price": 68.00, "year": 2019, "vintage": true, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "MEDIOCRITY", "description": "Dreams are just that—dreams.", "price": 127.00, "year": 2021, "vintage": false, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "FUTILITY", "description": "You're not good enough.", "price": 150.00, "year": 2016, "vintage": false, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "DEFEAT", "description": "It's too late to start now.", "price": 35.00, "year": 2023, "vintage": false, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "HOPELESSNESS", "description": "Stay in your comfort zone; it's safer.", "price": 112.00, "year": 2020, "vintage": true, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")
Poster.create("name": "PROCRASTINATION", "description": "Better to avoid failure by not trying at all.", "price": 48.00, "year": 2017, "vintage": true, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d")