class CovidController < ApplicationController

  def zones
  end

  def centres
  end

  def hospitals
    url = "https://data.nsw.gov.au/data/dataset/21c72b00-0834-464d-80f1-75fec38454ce/resource/85da884f-a9f5-4cb3-95e8-d6b81b0d2e3a/download/nsw-health-covid-19-test-clinics-2021-04-23-v2.csv"
    response = URI.open url
    @records = []

    CSV.parse(response, headers:true) do |row|
      @records.push(row)
    end
    @table_headers = @records[0].headers
    








  end

end
