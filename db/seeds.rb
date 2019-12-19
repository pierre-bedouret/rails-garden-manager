puts "Cleaning database"
Garden.destroy_all if Rails.env.development?
puts "All gardens destroy"
Plant.destroy_all if Rails.env.development?
puts "All plants destroy"

garden_names = [
  "French garden",
  "My Cute Balcony",
  "English garden",
  "Flowered patio",
  "Garden in Japan",
  "Walk among flowers"
]
plant_area = [
  "Europe",
  "America",
  "Africa",
  "Asia",
  "Oceania"
]
colors = [
  "Red",
  "Bleu",
  "Green",
  "Yellow",
  "Orange",
  "Violet",
  "Purple"
]

puts "Create 6 gardens"
g = 1
6.times do
  p = 1
  garden_request = RestClient.get("https://source.unsplash.com/1200x700/?garden")
  garden = Garden.new(
      name: garden_names.pop,
      banner_url: garden_request.request.url
    )
  garden.save!
  puts "create garden #{g}"
  g += 1
  3.times do
    plant_request = RestClient.get("https://source.unsplash.com/400x300/?flower")
    plant = Plant.new(
      name: Faker::FunnyName.name,
      image_url: plant_request.request.url,
      category: Faker::FunnyName.four_word_name,
      area: plant_area.sample,
      fruit: [true, false].sample,
      flower_color: colors.sample,
      max_size: rand(1..25),
      lifetime: rand(5..100)
    )
    plant.garden = garden
    plant.save!
    puts "create plant #{p}"
    p += 1
  end
end

puts "Database Ready !"
