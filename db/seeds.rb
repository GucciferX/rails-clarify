require 'faker'

CATEGORIES = ['mental_health', 'weight_control', 'diabetes', 'sleep_health',
  'healthy_blood_ pressure', 'therapy']
random_number = (5..65).to_a
puts 'Cleaning both Category and Plan databases'
Category.destroy_all
puts 'Adding new data'

CATEGORIES.each do |category|
  Category.create!(name: category)
  puts "Adding #{category} category"
end
# everything good til here

35.times do
  new_plan = Plan.create!(
      name: (Faker::Hipster.word.capitalize + " " + Faker::Books::CultureSeries.book),
      goal_description: Faker::GreekPhilosophers.quote,
      description: Faker::Marketing.buzzwords,
      category_id: Category.all.sample.id,
      duration: random_number.sample,
      number_of_consultations: random_number.sample
    )

  puts "Adding the #{new_plan.name} plan"
end

puts "Seeded categories & plans database"
