User.destroy_all
user1 = User.create :email => 'test@test.com', :password => 'test', :suburb => 'Parramatta'
user2 = User.create :email => 'test1@test1.com', :password => 'test1', :suburb => 'Westmead'
user3 = User.create :email => 'test2@test2.com', :password => 'test3', :suburb => 'Burwood'
puts "#{User.count} users created"

Symptom.destroy_all
fever = Symptom.create :symptom => 'Fever'
cough = Symptom.create :symptom => 'Cough'
breathing_problem = Symptom.create :symptom => 'breathing problem'
sore_throat = Symptom.create :symptom => 'Sore Throat'
conjunctivitis = Symptom.create :symptom => 'Conjunctivitis'
other = Symptom.create :symptom => 'loss of speech or movement'
smell = Symptom.create :symptom => 'loss of taste or smell'
puts "#{Symptom.count} symptoms created"

UserSymptom.destroy_all
user_symptom1 = UserSymptom.create :user_id => user1.id, :symptom_id => fever.id
user_symptom2 = UserSymptom.create :user_id => user1.id, :symptom_id => cough.id
user_symptom3 = UserSymptom.create :user_id => user2.id, :symptom_id => cough.id
user_symptom4 = UserSymptom.create :user_id => user2.id, :symptom_id => breathing_problem.id

puts "#{UserSymptom.count} UserSymptom created"

# puts "user_symptom1 << fever"
# user1.symptoms << fever
# user_symptom2.symptoms << cough
#
# puts "user1.user_symptoms << user_symptom1 << user_symptom2"
# user1.user_symptoms << user_symptom1 << user_symptom2
# UserSymptom.destroy_all
#
# user_symptom1 = user1.user_symptoms.create
# user_symptom2 = user2.user_symptoms.create
# puts "#{UserSymptom.count} UserSymptom created"
#####Assosiations######

# puts "symptoms to userSymptom"
# user1.symptoms << fever << cough << breathing_problem
# user2.symptoms << cough << breathing_problem
# user2.user_symptoms.symptoms << cough
