## COVID WEB APPLICATION
Covid app is built based on NSW data source.And has a checker to covid symptoms and information.

https://covid-21.herokuapp.com/covid_zones

It is deployed in Heroku. This application has creating account and saving covid symptoms, checking suburb status and zones

Technology stack :

* Ruby on Rails 5x

* HTML 5

* CSS

* Bootstrap

Assosiations:

Developed relation between User and user-symptoms(one to many).

Used Gems :

* JSON

* HTTParty

* CSV

* open-uri

Features :

This application will allow user to search by suburb and check covid status in their suburb.
This is achived by reading JSON on cases datalist using JSON.

Hospitals data was achived by reading CSV file.Manipulations were done on the dataresponse to show desired output.
