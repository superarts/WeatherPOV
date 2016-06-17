//	MARK: general

class WPErrorModel: LFModel {
	var type: String?
	//var description: String?
}

class WPFeatureModel: LFModel {
	var geolookup:	Int = 0
	var forecast:	Int = 0
}

class WPResponseModel: LFModel {
	var version:		String?
	var termsofService:	String?
	var features:		WPFeatureModel?
	var error:			WPErrorModel?
}

class WPResultModel: LFModel {
	var response:	WPResponseModel?
}

//	MARK: geolookup

class WPGeolocationModel: LFModel {
	var city: String?
	var country: String?
	var lat: Float = 0
	var lon: Float = 0
}

class WPStationModel: WPGeolocationModel {
	var state:	String?
	var icao:	String?
	var neighborhood:	String?
	//	in data feed distances appear as int
	var distance_km:	Float = 0		
	var distance_mi:	Float = 0
}

class WPAirportModel: LFModel {
	var station: [WPStationModel]?
}

class WPPwsModel: WPAirportModel {
}

class WPWeatherStationModel: LFModel {
	var airport: WPAirportModel?
	var pws: WPAirportModel?
}

class WPLocationModel: WPGeolocationModel {
	var type:				String?
	var country_iso3166:	String?
	var country_name:		String?
	var state:		String?
	var tz_short:	String?
	var tz_long:	String?
	var zip:		String?
	var magic:		String?
	var wmo:		String?
	var l:			String?
	var requesturl:	String?
	var wuiurl:		String?
	var nearby_weather_stations: WPWeatherStationModel?
}

class WPGeolookupResultModel: WPResultModel {
	var location: WPLocationModel?
}

//	MARK: forecast

class WPDateModel: LFModel {
	var epoch:	String?
	var pretty:	String?
	var day:	Int = 0
	var month:	Int = 0
	var year:	Int = 0
	var yday:	Int = 0
	var hour:	Int = 0
	var min:	String?
	var sec:	Int = 0
	var isdst:	String?
	var monthname:			String?
	var monthname_short:	String?
	var weekday_short:		String?
	var weekday:	String?
	var ampm:		String?
	var tz_short:	String?
	var tz_long:	String?
}

class WPTemperatureModel: LFModel {
	//	appear as int
	var fahrenheit:	Float = 0
	var celsius:	Float = 0
	var str: String {
		if WP.isF {
			return String(format: "%.0fºF", fahrenheit)
		}
		return String(format: "%.0fºC", celsius)
	}
}

class WPQPFModel: LFModel {
	//	appear as int
	//var in: Float = 0
	var mm: Float = 0
	var cm: Float = 0
}

class WPWindModel: LFModel {
	//	appear as int
	var mph:		Float = 0
	var kph:		Float = 0
	var dir:		String?
	var degrees:	Float = 0
}

class WPForecastdayModel: LFModel {
	var period:			Int = 0
	var icon:			String?
	var icon_url:		String?
	var pop:			Float = 0
	var popPercentage:	String {
		return String(format: "%.0f%%", pop)
	}

	//	text forecast
	var title:			String?
	var fcttext:		String?
	var fcttext_metric:	String?

	//	simple forecast
	var date:			WPDateModel?
	var high:			WPTemperatureModel?
	var low:			WPTemperatureModel?
	var conditions:		String?
	var skyicon:		String?
	var qpf_allday:		WPTemperatureModel?
	var qpf_day:		WPTemperatureModel?
	var qpf_night:		WPTemperatureModel?
	var snow_allday:	WPTemperatureModel?
	var snow_day:		WPTemperatureModel?
	var snow_night:		WPTemperatureModel?
	var maxwind:		WPWindModel?
	var avewind:		WPWindModel?
	//	appear as int
	var avehumidity:	Float = 0
	var maxhumidity:	Float = 0
	var minhumidity:	Float = 0
}

class WPTxtForecastModel: LFModel {
	var date: String?
	var forecastday: [WPForecastdayModel]?
}

//	Although named as "simple forecast", WPForecastdayModel in
//	WPSimpleForecastModel actually contains more information than
//	the ones in WPTxtForecast (text forecast).
class WPSimpleForecastModel: LFModel {
	var forecastday: [WPForecastdayModel]?
}

class WPForecastModel: LFModel {
	var txt_forecast:	WPTxtForecastModel?
	var simpleforecast:	WPSimpleForecastModel?
}

class WPForecastResultModel: WPResultModel {
	var forecast: WPForecastModel?
}