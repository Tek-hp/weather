import 'package:flutter/cupertino.dart';

abstract class NavigationService {
  bool get canGoBack;

  GlobalKey<NavigatorState> get navigationKey;

  void pop({dynamic result});

  Future<dynamic> navigateTo(String routeName, {dynamic arguments});

  Future<dynamic> navigateToAndPop(String routeName, {dynamic arguments});

  Future<dynamic> navigateToAndClearStack(String routeName,
      {dynamic arguments});
}
