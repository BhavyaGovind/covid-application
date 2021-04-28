class SymptomsController < ApplicationController
  before_action :check_for_login
  def new
    @symptoms = Symptom.all
  end
  def create
    @symptoms = []
    if params[:symptom] != nil
      params[:symptom].each do |id|

        userSymptom1 = UserSymptom.create :user_id => @current_user.id, :symptom_id => id.to_i
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
        @table_headers = @records[0].headers
      when "Serious"
        @severity = 3

    end

  end

end
