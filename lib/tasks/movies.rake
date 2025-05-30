namespace :movies do
  desc "Seeds genres"
  task seed_genres: :environment do
    Genre.create!([{
      name: "Action"
    },
    {
      name: "Sci-Fi"
    },
    {
      name: "Adventure"
    }])
    
    p "####################################"
    p "Created #{Genre.count} properties"
    p "####################################"

  end
end

############
# PROPERTIES
#
# 10.times do |i|
#   property = Property.create!(
#     name: Faker::Lorem.word, 
#     headline: Faker::Lorem.sentence, 
#     description: Faker::Lorem.paragraph,
#     address_1:Faker::Address.street_address,
#     city:Faker::Address.city,
#     state:Faker::Address.state,
#     country: "United States",
#     price: Money.from_amount((25..100).to_a.sample)
#   )

#   property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property_#{i + 1}.png")), filename: property.name )

#   (1..5).to_a.sample.times do 
#     Review.create(reviewable: property, rating: (1..5).to_a.sample, title: Faker::Lorem.word, body: Faker::Lorem.paragraph )
#   end

# end

