class CovidController < ApplicationController

  def zones
    url = "https://data.nsw.gov.au/data/datastore/dump/21304414-1ff1-4243-a5d2-f52778048b29?format=json"
    response = HTTParty.get url
    result = ActiveSupport::JSON.decode(response)
    all = result["records"]
    @suburb_by_cases = Hash.new
    all.group_by{ |h| h[5] }.each do |loc,cases|
      puts "'#{loc}': #{cases.length} cases#{:s if cases.length!=1}"
      @suburb_by_cases[loc] = cases.length
    end

  end

  def graph
    url = "https://data.nsw.gov.au/data/datastore/dump/21304414-1ff1-4243-a5d2-f52778048b29?format=json"
    response = HTTParty.get url
    result = ActiveSupport::JSON.decode(response)
    all = result["records"]
    @suburb_by_cases = []
    all.group_by{ |h| h[5] }.each do |loc,cases|
      puts "'#{loc}': #{cases.length} cases#{:s if cases.length!=1}"
      suburb = Hash.new
      suburb[loc] = cases.length
      @suburb_by_cases.push(suburb)
    end
  end

  def hospitals
    url = "https://data.nsw.gov.au/data/dataset/21c72b00-0834-464d-80f1-75fec38454ce/resource/85da884f-a9f5-4cb3-95e8-d6b81b0d2e3a/download/nsw-health-covid-19-test-clinics-2021-04-23-v2.csv"
    response = URI.open url
    @records = []

    CSV.parse(response, headers:true) do |row|
      @records.push(row)
    end
    @table_headers =["title","Clinic Address (field_clinic_address:address_line1)","Suburb", "Clinic Facility Instruction"]


  end

end
