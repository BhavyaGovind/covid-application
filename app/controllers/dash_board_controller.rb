class DashBoardController < ApplicationController

  def home
  end

  def search
    url = "https://data.nsw.gov.au/data/datastore/dump/21304414-1ff1-4243-a5d2-f52778048b29?format=json"
    response = HTTParty.get url
    result = ActiveSupport::JSON.decode(response)
    @fields = result["fields"]
    @records = result["records"]
    @suburb = params[:suburb]
  render :home
  end

end
