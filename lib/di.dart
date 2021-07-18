import 'package:get_it/get_it.dart';
import 'package:weather_app/screens/dashboard/dashboard_viewmodel.dart';
import 'package:weather_app/screens/startup_page/startup_page_viewmodel.dart';
import 'package:weather_app/services/database_service.dart';
import 'package:weather_app/services/implements/navigation_service_impl.dart';
import 'package:weather_app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpInjector() async {
  locator
      .registerLazySingleton<NavigationService>(() => NavigationServicesImpl());
  locator.registerLazySingleton(() => FetchDataService());

  locator.registerFactory(() => StartUpViewModel());
  locator.registerFactory(() => DashboardViewModel());
}
