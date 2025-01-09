import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weatherapp_piyush/models/weather_data_model/weather_data_model.dart';

class HomePageController extends GetxController {
  final Dio dio = Dio();
  final String apiKey = "913467902a214d79bf485331240709";
  final _weatherData = Rxn<WeatherDataModel>();

  WeatherDataModel? get weatherData => _weatherData.value;

  getWeatherData() async {
    final response = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?q=Jaipur&days=14&key=$apiKey");
    _weatherData.value = WeatherDataModel.fromJson(response.data);
  }
}
