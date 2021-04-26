User.destroy_all
user1 = User.create :email => 'test@test.com', :password => 'test', :suburb => 'Parramatta'
user2 = User.create :email => 'test1@test1.com', :password => 'test1', :suburb => 'Westmead'
puts "#{User.count} users created"

Symptom.destroy_all
fever = Symptom.create :symptom => 'fever'
cough = Symptom.create :symptom => 'cough'
breathing_problem = Symptom.create :symptom => 'breathing problem'
puts "#{Symptom.count} symptoms created"

user_symptom1 = user1.user_symptoms.create

#####Assosiations######

user_symptom1.symptoms << fever
# user2.user_symptoms.symptoms << cough
