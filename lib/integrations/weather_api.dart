import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/integrations/models/weather_api_object.dart';

class WeatherApiIntegration {
  static Future<WeatherApiObject> getWeatherInfo() async{
      http.Response response = await http.get(Uri.parse("http://api.weatherapi.com/v1/forecast.json?key=99357ca35ab04fe7bcd121450213110&q=Tallinn&days=1&aqi=no&alerts=no"));
      if(response.statusCode==200){
        WeatherApiObject object = WeatherApiObject.fromJson(jsonDecode(response.body));
        return object;
      }
      else {
        throw Exception("Failed to load weather object");
      }
  }
}