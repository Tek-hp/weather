import 'package:flutter/material.dart';
import 'package:weather_app/di.dart';
import 'package:weather_app/enum/app_state.dart';
import 'package:weather_app/services/navigation_service.dart';


class BaseViewModel extends ChangeNotifier {
  //   [...SERVICES BEING PULLED FROM LOCATOR WITH ARE PREVIOUSLY REGISTERED...]
  NavigationService _navigationService = locator<NavigationService>();
  
  //                                   [...STATE MANAGEMENT PART STARTS HERE...]

  //Setting app state initially as idle
  AppState _appState = AppState.idle;

  //Getter for app states
  AppState get appState => _appState;

  //Function for setting State of app
  setAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  // String _errorMessage;
  // String get errorMessage => _errorMessage;

  // String _warningMessage;
  // String get warningMessage => _warningMessage;

  // setAlert({
  //   @required AppState appState,
  //   @required String message,
  // }) {
  //   if (appState == AppState.error) {
  //     _errorMessage = message;
  //   } else if (appState == AppState.warning) {
  //     _warningMessage = message;
  //   }

  //   this.setAppState(appState);
  // }

  //Call this function to set the state of app as busy
  setBusy() {
    this.setAppState(AppState.busy);
  }

  setSucess() {
    this.setAppState(AppState.sucess);
  }

  //Call this function to set the state of app as idle.
  setIdle() {
    this.setAppState(AppState.idle);
  }

  //This returns true if the app state is busy
  bool get isBusy => _appState == AppState.busy;

  //                                     [...STATE MANAGEMENT PART ENDS HERE...]

  //                               [...MODEL DISPOSE/REUSE LOGIC STARTS HERE...]

  //Initially the model called is false
  bool _onModelReadyCalled = false;
  bool get onModelReadyCalled => _onModelReadyCalled;

  //This function changes the model ready called state
  setOnModelReadyCalled(bool value) {
    _onModelReadyCalled = value;
  }

  //                                 [...MODEL DISPOSE/REUSE LOGIC ENDS HERE...]

  //                               [...GLOBAL NAVIGATION METHOD STARTS HERE... ]

  Future goto(String routeName, {dynamic arguments}) async {
    return await _navigationService.navigateTo(routeName, arguments: arguments);
  }

  Future gotoAndPop(String routeName, {dynamic arguments}) async {
    return await _navigationService.navigateToAndPop(routeName,
        arguments: arguments);
  }

  Future gotoAndClear(String routeName, {dynamic arguments}) async {
    return await _navigationService.navigateToAndClearStack(routeName,
        arguments: arguments);
  }

  void goBack({dynamic result}) {
    _navigationService.pop(result: result);
  }

  bool get canGoBack => _navigationService.canGoBack;
  //                                 [...GLOBAL NAVIGATION METHOD ENDS HERE... ]
}
