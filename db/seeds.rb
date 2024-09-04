# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Poster.create("id": 1, "name": "REGRET", "description": "Hard work rarely pays off.", "price": 89.0, "year": 2018, "vintage": "t", "boolean": null, "img_url": "https://plus.unsplash.com/premium_photo-1661293818249-fddbddf07a5d", "created_at": "2024-09-04T02:15:32.505Z", "updated_at": "2024-09-04T02:15:32.505Z")
Poster.create("id": 2, "name": "FAILURE", "description": "Why bother trying? It's probably not worth it.", "price": 68.00, "year": 2019, "vintage": "t", "boolean": null, "img_url": "./assets/failure.jpg", "created_at": "2024-08-04T02:15:32.505Z", "updated_at": "2024-09-04T02:16:32.505Z")
Poster.create("id": 3, "name": "MEDIOCRITY", "description": "Dreams are just that—dreams.", "price": 127.00, "year": 2021, "vintage": "f", "boolean": null, "img_url": "./assets/mediocrity.jpg", "created_at": "2024-07-04T02:15:32.505Z", "updated_at": "2024-09-04T02:18:32.505Z")
Poster.create("id": 4, "name": "FUTILITY", "description": "You're not good enough.", "price": 150.00, "year": 2016, "vintage": "f", "boolean": null, "img_url": "./assets/futility.jpg", "created_at": "2023-07-04T02:15:32.505Z", "updated_at": "2023-09-04T02:18:32.505Z")
Poster.create("id": 5, "name": "DEFEAT", "description": "It's too late to start now.", "price": 35.00, "year": 2023, "vintage": "f", "boolean": null, "img_url": "./assets/defeat.jpg", "created_at": "2023-07-04T02:18:32.505Z", "updated_at": "2023-09-04T02:20:32.505Z")
Poster.create("id": 6, "name": "HOPELESSNESS", "description": "Stay in your comfort zone; it's safer.", "price": 112.00, "year": 2020, "vintage": "t", "boolean": null, "img_url": "./assets/hopelessness.jpg", "created_at": "2024-10-04T02:18:32.505Z", "updated_at": "2024-11-04T02:20:32.505Z")
Poster.create("id": 7, "name": "PROCRASTINATION", "description": "Better to avoid failure by not trying at all.", "price": 48.00, "year": 2017, "vintage": "t", "boolean": null, "img_url": "./assets/procrastination.jpg", "created_at": "2023-12-04T02:15:32.505Z", "updated_at": "2024-02-04T02:18:32.505Z")