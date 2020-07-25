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

User.create(kind: "coach",
  email: Faker::Internet.email,
  encrypted_password: Faker::Blockchain::Bitcoin.address,
  first_name: Faker::Artist.name,
  last_name: Faker::Name.last_name,
  phone: Faker::PhoneNumber.phone_number,
  rating:)


#Seeds for patients

random_weight = (1...200).to_a

PatientRecord.create(description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  gender: [M,F].sample,
  birth_date: Faker::Date,
  weight: random_weight.sample,
  height: [1.60,1.65,1.70,1.75,1.80].sample
  medical_condition: "Asthma" )

PatientRecord.create(description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  gender: [M,F].sample,
  birth_date: Faker::Date,
  weight: random_weight.sample,
  height: [1.60,1.65,1.70,1.75,1.80].sample
  medical_condition: "Diabetes" )

PatientRecord.create(description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  gender: [M,F].sample,
  birth_date: Faker::Date,
  weight: random_weight.sample,
  height: [1.60,1.65,1.70,1.75,1.80].sample
  medical_condition: "Stress" )

PatientRecord.create(description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  gender: [M,F].sample,
  birth_date: Faker::Date,
  weight: random_weight.sample,
  height: [1.60,1.65,1.70,1.75,1.80].sample
  medical_condition: "Obesity" )

PatientRecord.create(description: "Lorem ipsum dolor sit amet,
    consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  gender: [M,F].sample,
  birth_date: Faker::Date,
  weight: random_weight.sample,
  height: [1.60,1.65,1.70,1.75,1.80].sample
  medical_condition: "Diabetes" )

#Seeds for coaches

CoachRecord.create(certification_number: Faker::DrivingLicence.british_driving_licence,
  specialty: "Weight control" ,
  description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

CoachRecord.create(certification_number: Faker::DrivingLicence.british_driving_licence,
  specialty: "Diabetes" ,
  description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

CoachRecord.create(certification_number: Faker::DrivingLicence.british_driving_licence,
  specialty: "Stress management" ,
  description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

CoachRecord.create(certification_number: Faker::DrivingLicence.british_driving_licence,
  specialty: "Nutrition" ,
  description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")

CoachRecord.create(certification_number: Faker::DrivingLicence.british_driving_licence,
  specialty: "Mental health" ,
  description: "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
    labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
