# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
    Wine.create(
        name: "wine ##{i}",
        image: "wine1.jpg",
        short_description: "my wine one",
        long_description: "my long wine one",
        origin: "france",
        grape: "sauvignon blanc",
        vegitarian: true,
        size: 500,
        price: 6.99
        )
end
