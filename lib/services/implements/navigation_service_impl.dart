import 'package:flutter/material.dart';
import 'package:weather_app/services/navigation_service.dart';

class NavigationServicesImpl implements NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  @override
  bool get canGoBack => _navigationKey.currentState.canPop();

  @override
  Future navigateTo(String routeName, {arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future navigateToAndClearStack(String routeName, {arguments}) {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  @override
  Future navigateToAndPop(String routeName, {arguments}) {
    return _navigationKey.currentState
        .popAndPushNamed(routeName, arguments: arguments);
  }

  @override
  void pop({result}) {
    _navigationKey.currentState.pop(result);
  }
}
