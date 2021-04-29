class SymptomsController < ApplicationController
  before_action :check_for_login
  def new
    @symptoms = Symptom.all
    removeDuplicates
  end



  def create
    @symptoms = []
    if params[:symptom] != nil
      ##Updating changes
      if @current_user.user_symptoms.count != nil
        temp_symptoms = []
        userSymptoms = @current_user.user_symptoms
        userSymptoms.each do |row|
         temp_symptoms.push(row.symptom_id.to_s)
        end
        ####Difference or removed symptom ids
        removed_symptoms = temp_symptoms - params[:symptom]

        userSymptoms.each do |row|
          if removed_symptoms.include? row.symptom_id.to_s
            row.destroy
          end
        end
      end
      ##Creting new usersymptoms with selected inputs
      crete_symptoms_list = params[:symptom] - temp_symptoms
      crete_symptoms_list.each do |id|
        userSymptom1 = UserSymptom.create :user_id => @current_user.id, :symptom_id => id.to_i
        removeDuplicates
      end

      if @current_user.user_symptoms.count != 0
          userSymptoms = @current_user.user_symptoms
          userSymptoms.each do |row|
            @symptoms.push(row.symptom_id)
          end
      end

      redirect_to new_symptom_path
    else

      redirect_to new_symptom_path
    end
  end

  def removeDuplicates
    userSymptoms = @current_user.user_symptoms
    group = userSymptoms.group_by{ |userSymptom| [userSymptom.symptom_id]}
    group.values.each do |duplicates|
      last_one = duplicates.pop
      duplicates.each{|double| double.destroy}
    end
  end

  def result
    p "this method is called"
    @severity = nil

    case params[:severity]
      when "Normal"
        @severity = 1
      when "Intermediate"
        @severity = 2
        @suburb = @current_user.suburb
        url = "https://data.nsw.gov.au/data/dataset/21c72b00-0834-464d-80f1-75fec38454ce/resource/85da884f-a9f5-4cb3-95e8-d6b81b0d2e3a/download/nsw-health-covid-19-test-clinics-2021-04-23-v2.csv"
        response = URI.open url
        @records = []
        CSV.parse(response, headers:true) do |row|
          @records.push(row)
        end
        @table_headers = ["title", "Clinic Address (field_clinic_address:address_line1)", "Clinic Facility Instruction", "Clinic Monday opening hours","Clinic Tuesday opening hours","Clinic Wednesday opening hours","Clinic Thursday opening hours","Clinic Friday opening hours","Clinic Saturday opening hours","Clinic Sunday opening hours"]
      when "Serious"
        @severity = 3

    end

  end

end
