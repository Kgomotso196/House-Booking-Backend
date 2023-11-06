
users = []
1.times do |i|
  users << User.create(name: "User #{Faker::Name.unique.first_name} #{Faker::Name.unique.last_name}")
end

# Creating houses and assigning some a reservation class
houses = []
users.each do |user|
  3.times do |i|
    house = House.create(
      house_name: "#{Faker::Address.unique.building_number} #{Faker::Address.unique.street_name}",
      house_image: "https://example.com/house#{i + 1}.jpg",
      location: Faker::Address.unique.city,
      description: "Cozy #{Faker::Hipster.word} retreat in #{Faker::Address.unique.country}",
      user: user
    )

    # Assign a reservation class to some houses
    if i.even?
      Reservation.create(
        checking_date: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
        checkout_date: Faker::Date.between(from: 1.year.from_now, to: 2.years.from_now),
        city: Faker::Address.unique.city,
        house_price: Faker::Commerce.price(range: 50..300, as_string: true),
        user: user,
        house: house
      )
    end

    houses << house
  end
end

puts "Seed data created successfully."
