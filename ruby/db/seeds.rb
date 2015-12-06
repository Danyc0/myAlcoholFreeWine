# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
    Wine.create(
        id: i,
        name: "awine ##{i}",
        image: "wine1.jpg",
        short_description: "my wine one",
        long_description: "my long wine one",
        origin: "france",
        grape: "sauvignon blanc",
        vegitarian: true,
        size: 512,
        price: 6.99,
        supplier: "ALCOHOL FREE WINES 'R US"
        )
end

30.times do |i|
    Wine.create(
        id: (i+5),
        name: "wine ##{i+5}",
        image: "wine1.jpg",
        short_description: "my wine one",
        long_description: "my long wine one",
        origin: "france",
        grape: "sauvignon blanc",
        vegitarian: true,
        size: 256,
        price: 3.99,
        supplier: "Free - As in 'Wine'"
        )
end

5.times do |i|
    Wine.create(
        id: (i+35),
        name: "zwine ##{i+35}",
        image: "wine1.jpg",
        short_description: "my wine one",
        long_description: "my long wine one",
        origin: "france",
        grape: "sauvignon blanc",
        vegitarian: false,
        size: 500,
        price: 6.99,
        supplier: "ALCOHOL FREE WINES 'R US"
        )
end
