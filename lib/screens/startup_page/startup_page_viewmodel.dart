import 'package:weather_app/baseview_model.dart';
import 'package:weather_app/constants/route_names.dart';

class StartUpViewModel extends BaseViewModel {
  splashLoader() async {
    await Future.delayed(Duration(milliseconds: 1500));
    gotoAndClear(DashBoardViewRoute);
  }
}
