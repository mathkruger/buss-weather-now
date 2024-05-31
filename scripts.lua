local api_key = "7bcb6ff422da4b1e97a171154243105"
local api_url = "https://api.weatherapi.com/v1/current.json"

local searchInput = get("search-input")
local searchButton = get("search-button")

local resultLocation = get("result-location")
local resultTemperature = get("result-temperature")
local resultCondition = get("result-condition")
local resultWind = get("result-wind")
local resultHumidity = get("result-humidity")

searchButton.on_click(function(content)
    local query = searchInput.get_content()
    local res = fetch({
        url = api_url .. "?q=" .. query .. "&key=" .. api_key,
        method = "GET",
        headers = {
            ["Content-Type"] = "application/json"
        }
    })

    resultLocation.set_content(res.location.name .. " - " .. res.location.region .. " - " .. res.location.country)
    
    resultCondition.set_content("Condition: " .. res.current.condition.text)
    resultTemperature.set_content(res.current.temp_c .. " C" .. " (" .. res.current.temp_f .. " F)")
    resultWind.set_content("Wind: " .. res.current.wind_kph .. " Km/h" .. " (" .. res.current.wind_mph .. " MPH)")
    resultHumidity.set_content("Humidity: " .. res.current.humidity)
end)
