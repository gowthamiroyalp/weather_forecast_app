# whether_forecast
Whether Forecast ROR application

# Problem statement/requirement
1. Crate a ROR web application which accepts an address as input and retrieve forecast data for the given address.
2. The retrieved forecast data include, at minimum, the current temperature (Bonus points - Retrieve high/low and/or extended forecast).
3. Display the requested forecast details to the user.
4. Cache the forecasPrerequisitest details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.

# Features Overview
1. Input form on the homepage (to enter address).
2. Fetch forecast using an API using OpenWeatherMap.
3. Geocode address to zip code using an API OpenCage.
4. Cache by zip code for 30 minutes (show "from cache" flag).
5. Display weather results below the form.
6. Reset button to clear the form.

# Prerequisites
1. Ruby
2. Rails
3. PostgreSQL

# Getting started

1. Clone the repository:
	git clone https://github.com/gowthamiroyalp/weather_forecast_app.git
	cd weather_forecast_app

2. Install Dependencies:
	bundle install

3. Create postgresql db
	rails db:create
	rails db:migrate	

3. Run the server:
	rails server

4. Verify app in the browser
	localhost:3000	

5. Run the Specs
	bundle rspec	

# Public GitHub repository url/link with specific feature branch:
https://github.com/gowthamiroyalp/weather_forecast_app





