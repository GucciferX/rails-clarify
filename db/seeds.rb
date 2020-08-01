require 'faker'

# Clean db
Review.destroy_all
ConsultationNote.destroy_all
Consultation.destroy_all
PlanCoach.destroy_all
Plan.destroy_all
Category.destroy_all
CoachRecord.destroy_all
PatientRecord.destroy_all
User.destroy_all

20.times {
  user = User.new( kind: "coach", email: Faker::Internet.email)
  user.password = Faker::Blockchain::Bitcoin.address
  user.password_confirmation = user.password
  user.save!
}
puts 'created 5 coach users'

# Seed 5 patient users
20.times {
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

coach_addresses = [
  'Agrarismo 208, Miguel Hidalgo, CDMX, Mexico', 
  'Tlacotalpan 59, Cuauhtémoc, CDMX, Mexico', 
  'Calle Querétaro 58, Cuauhtémoc, CDMX, Mexico',
  'Temístocles 210, Miguel Hidalgo, CDMX, Mexico',
  'Calzada Acoxpa 430, Tlalpan, CDMX, Mexico',
]

User.where(kind: "coach").each do |coach|
  CoachRecord.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Artist.name,
    phone: Faker::PhoneNumber.phone_number,
    certification_number: Faker::DrivingLicence.british_driving_licence,
    specialty: medical_specialties.sample,
    description: Faker::TvShows::BojackHorseman.quote,
    address: coach_addresses.sample,
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
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number,
    description: Faker::GreekPhilosophers.quote,
    gender: Faker::Gender.short_binary_type,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 80),
    weight: random_weight.sample,
    height: Faker::Demographic.height,
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
  'Weight Control', 'Exercise', 'Eating better', 'Sleep health', 
  'Diabetes Management', 'Healthy Blood Pressure', 'Healthy Colesterol',
  'Diabetes Prevention', 'COPD Management', 'Stress Resilience', 
  'Stress Management', 'Therapy' 
]

plan_descriptions = [
  'Lose Weight By Making Small Changes That Work.
  
  Want to drop those persistent pounds, put an end to yo-yo dieting, or achieve a head-to-toe health transformation? Other programs focus on what to eat. We focus on what and why you eat, to help you make small changes that stick. 
  
  You’ll set up for success with the guidance and support of your own personal health coach. The average graduate of this program loses 7% of their body weight—that’s impressive!',
  'Get Your Body In Gear To Feel Fit And Strong.
  
  Regular exercise boosts energy, reduces stress, builds strong bones, and lowers your risk of heart attack or injury. Plus it helps you look and feel your best.
  
  If you want to be active and stay active, this program is for you. Your health coach will help you get moving more often and fit scheduled activity into your busy days, ramping up at a rate that’s right for you.',
  'You Are What You Eat, So Eat Well And Optimize Your Nutrition.
  
  Whether you’re looking to boost your energy, invest in your long-term health, or manage your weight, eating well is key.
  
  In this program, you’ll select one of five nutrition pathways: Lower Carb, Mediterranean-Style, Healthy Fats, Plant-Based, or Lower Sodium. Together with your coach, you’ll explore science-based approaches to better nutrition. You’ll design a personalized eating plan—and build skills to stick with it.',
  'Develop A Routine That Helps You Rest Well And Longer.
  
  Sleep—it helps you feel and be your best. It’s essential for your body and your mind.
  
  In this program, you’ll partner with a Vida health coach on a personalized plan to help you sleep better, and longer. With an improved sleep routine in place, you’ll gain the physical and mental energy you need to get the most from your days.',
  'Overcome Diabetes For A Long And Healthy Life.
  
  Whether you’re recently diagnosed with type 2 diabetes or have lived with it for years, this program can help you manage your diabetes and take charge of your health. Your diabetes coach will help you craft a plan to get where you want to be—one step at a time.',
  'Protect Your Heart And Brain With Healthy Habits.
  
  Designed by doctors and healthy living experts, this program helps you to manage high blood pressure and take charge of your health.
  
  Small changes add up over time. A personal health coach will partner with you to identify changes you can make to build healthy habits. Three out of four Vida members looking to manage their high blood pressure have lowered it by at least one stage. How’s that for taking the pressure off?',
  'Improve Your Cholesterol, One Small Change At A Time.
  
  Better cholesterol—and improved health—is within your reach. We’re here to help you take charge.
  
  With this program, you and your personal coach will develop an actionable plan that’s a perfect fit for you. Then, partner with your coach to put the plan into action, and start on your journey to improved habits—and improved numbers.',
  'Stop Diabetes Before It Starts, With Weight Loss, Good Food, And Exercise.
  
  Vida’s Diabetes Prevention program is part of a nationwide effort to prevent type 2 diabetes, based on research into what really works.
  
  Programs like this one, designed to help you develop healthier habits, have been shown to reduce diabetes risk by half. What’s more, your risk stays lower over the long-term. Whether you have prediabetes or simply want to build healthy habits for life, this program can help.',
  'Catch More Breath, Tame Flare-Ups, And Boost Your Energy.
  
  In this program, you’ll work with a personal health coach to learn and apply skills that can help you manage COPD. Make healthy changes to reduce your risk of other complications and prolong your health, with a partner by your side.',
  'Grow Your Grit! Bounce Back Better From Challenges And Seize Each Moment As An Opportunity.
  
  Life is full of everyday ups and downs. Learn to adapt and cope in ways that make you feel less stressed and bring more satisfaction in all that you do.
    
    This program will help you tap into your strengths. You’ll practice mindfulness and stress management with world-renowned expert Shauna Shapiro, PhD. You’ll flex your adapting “muscles” so you can truly thrive.',
  'Gain Proven Skills For Coping With Everyday Stress And Big Life Changes.
  
  Stress is common and often constant in life. Fortunately, you can gain skills to better cope with stress, whatever life brings your way.
  
  In this program, you’ll learn research-based mindfulness methods to cope with stress. Participants reduced their stress by an average of 30% after a month in the program.',
  'Learn Strategies To Lift Your Mood And Cope With Life’s Challenges.
  
  Are your thoughts getting in the way of you living life to its fullest? You’re not alone. Nearly 1 in 10 people are depressed, and most everyone feels anxious from time to time.
  
  In this program, you’ll work with a licensed therapist to cope with life’s challenges and improve your outlook. The methods and skills you’ll learn are based on proven cognitive behavioral therapy techniques.'
]


# Seed plans
3.times{
  plan_names.each do |plan|
    plan_name = plan_names.sample
    new_plan = Plan.new(
        name: plan_name,
        description: plan_descriptions[plan_names.index(plan_name)],
        duration: [6,8,12,18,24,52].sample,
        goal_description: Faker::Marketing.buzzwords,
        category_id: Category.all.sample.id,
        number_of_consultations: [1,2,5].sample
    )
    new_plan.coaches << User.where(kind: "coach").sample(5)
    new_plan.save!
  end
}
puts "seeded plans"

# Seed consultations
3.times {
  User.where(kind: "patient").each do |patient|
    new_time = Faker::Time.between(from: DateTime.now - 360, to: DateTime.now, format: :default)
    new_consultation = Consultation.new(
      start_time: new_time,
      end_time: (new_time.to_time + 1.hours).to_datetime
    )
    new_consultation.patient = patient
    consultation_plan = Plan.all.sample
    new_consultation.plan = consultation_plan
    new_consultation.coach = consultation_plan.coaches.sample
    new_consultation.save!
  end
}
puts "seeded consultations for every patient"

# Seed reviews
Consultation.all.each do |consultation|
  new_review = Review.new(
    comment: Faker::TvShows::SouthPark.quote,
    coach_rating: [1,2,3,4,5].sample
  )
  new_review.consultation = consultation
  new_review.save!
end
puts "seeded reviews"

# Seed consultation_notes
Consultation.all.each do |consultation|
  new_note = ConsultationNote.new(
    comment: Faker::TvShows::SouthPark.quote,
    patient_rating: [1,2,3,4,5].sample
  )
  new_note.consultation = consultation
  new_note.save!
end
puts "seeded consultation notes"