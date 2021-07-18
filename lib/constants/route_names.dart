// Route Names are to be specified here...

import 'package:flutter/material.dart';
import 'package:weather_app/screens/dashboard/dashboard_view.dart';
import 'package:weather_app/screens/startup_page/startup_page_view.dart';

const StartUpViewRoute = "StartUpViewRoute";
const LoginViewRoute = "LoginViewRoute";
const SignUPViewRoute = "SignUPViewRoute";
const DashBoardViewRoute = "DashBoardViewRoute";
const AddProductViewRoute = "AddProductViewRoute";
const AllChatsViewRoute = "AllChatsViewRoute";
const ChatViewRoute = "ChatViewRoute";

Map<String, Widget> routesAndViews(RouteSettings settings) => {
      StartUpViewRoute: StartupView(),
      DashBoardViewRoute: DashboardView(),
    };
