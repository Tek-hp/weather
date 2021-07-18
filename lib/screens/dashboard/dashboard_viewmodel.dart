import 'dart:async';

import 'package:weather_app/baseview_model.dart';
import 'package:weather_app/di.dart';
import 'package:weather_app/services/database_service.dart';

class DashboardViewModel extends BaseViewModel {
  FetchDataService dataService = locator<FetchDataService>();
  List<double> temperature = [];
  Stream getWeatherData() {
    Stream data = dataService.getTempData();
    return data;
  }
}
