require 'faker'

# Clean db
Review.destroy_all
ConsultationNote.destroy_all
Consultation.destroy_all
Plan.destroy_all
Category.destroy_all
CoachRecord.destroy_all
PatientRecord.destroy_all
User.where.not(email: ["berveco@gmail.com", "main_coach@gmail.com"]).destroy_all

# Code for the user of the coach example
# super_coach = User.new(
#   kind: "coach", 
#   email: "main_coach@gmail.com",
# )
# super_coach.password = "Alibaba10"
# super_coach.password_confirmation = "Alibaba10"
# super_coach.save!

# Seed 5 coach users
5.times {
  user = User.new( kind: "coach", email: Faker::Internet.email)
  user.password = Faker::Blockchain::Bitcoin.address
  user.password_confirmation = user.password
  user.save!
}
puts 'created 5 coach users'

# Seed 5 patient users
5.times {
  user = User.new(email: Faker::Internet.email)
  user.password = Faker::Blockchain::Bitcoin.address
  user.password_confirmation = user.password
  user.save!
}
puts 'created 5 patient users'

# Seed coach records for every coach
medical_specialties = [
  'Cardiology', 'Psycology', 'Orthopedics', 'Neurology', 'Internal Medicine',
  'Geriatrics', 'Endocrinology', 'Psychiatry', 'General Medicine'
]

User.where(kind: "coach").each do |coach|
  CoachRecord.create(
    first_name: Faker::Artist.name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    certification_number: Faker::DrivingLicence.british_driving_licence,
    specialty: medical_specialties.sample,
    description: Faker::Lorem.sentences(number: 4),
    user_id: coach.id
  )
end

puts 'seeded coach_records to coaches'

# Seed patient record for every patient
random_weight = (1...200).to_a
medical_conditions = ['Diabetes', 'Hypertension', 'Ischemic Heart Disease', 
  'Piscosis',  'Depression', 'Obesity', 'Sleep Apnea', 'COPD',
  'Arthritis', 'Asthma', 'Ostheoporosis', 'Lung Cancer']

User.where(kind: "patient").each do |patient|
  PatientRecord.create(
    first_name: Faker::Artist.name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.sentences(number: 4),
    gender: ['M','F'].sample,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 80),
    weight: random_weight.sample,
    height: [1.60,1.65,1.70,1.75,1.80].sample,
    medical_condition: medical_conditions.sample,
    user_id: patient.id
  )
end
puts 'seeded patient_records to patients'

# Create array of plan categories
categories = ['Lifestyle', 'Condition', 'Mental Health']

categories.each do |category|
  Category.create!(name: category)
end
puts "seeded categories"

# Create array of plan names
plan_names = [
  'Weight Control', 'Excercise', 'Eating better', 'Sleep health', 
  'Diabetes Management', 'Healthy Blood Pressure', 'Healthy Colesterol',
  'Diabetes Prevention', 'COPD Management', 'Stress Resilience', 
  'Stress Management', 'Therapy' 
]
# Create random number to use in plans seed
random_number = (5..65).to_a

# Seed plans
# User.where(kind: "patient").each do |patient|
#   new_plan = Plan.new(
#       name: plan_names.sample,
#       goal_description: Faker::Marketing.buzzwords,
#       description: Faker::GreekPhilosophers.quote,
#       category_id: Category.all.sample.id,
#       duration: random_number.sample,
#       number_of_consultations: random_number.sample
#   )
#   new_plan.patient = patient
#   new_plan.save!
# end

# puts "seeded plans for every patient"