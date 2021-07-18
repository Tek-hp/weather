import 'package:flutter/material.dart';
import 'package:weather_app/base_view.dart';
import 'package:weather_app/screens/dashboard/dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder(
                stream: model.getWeatherData(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 3,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ],
                      ),
                    );
                  }
                  Map<Object, Object> weatherData =
                      snapshot.data.snapshot.value;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Weather Monitoring App",
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      _todaysTempreture(
                        weatherData['temperature'],
                        weatherData['notRaining'],
                        weatherData['currentPusleCount'],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _statusBar(
                        weatherData['humidity'],
                        weatherData['pressure'],
                        weatherData['notRaining'],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _rainFallAmount(weatherData['currentPulseCount'],
                          weatherData['lastPulseCount']),
                      SizedBox(height: 30),
                      _devs(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _todaysTempreture(temperature, notRaining, currentPulseCount) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.orange),
                        ),
                        _rainingStatus(int.parse(notRaining.toString())) ==
                                "Raining"
                            ? Positioned(
                                bottom: 0,
                                left: 0,
                                child: Icon(
                                  Icons.wb_cloudy_sharp,
                                  size: 120,
                                ))
                            : Container()
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${double.parse(temperature.toString()).toStringAsFixed(2)} ℃",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Text(
            "Location: Hatthiban, Lalitpur",
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _statusBar(humidity, pressure, notRaining) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.watch),
            SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Humidity",
                  style: TextStyle(color: Colors.white30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$humidity %",
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.adjust_sharp),
            SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pressure",
                  style: TextStyle(color: Colors.white30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${double.parse(pressure.toString()).toStringAsFixed(2)} inHg",
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.cloud),
            SizedBox(
              width: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rain Status",
                  style: TextStyle(color: Colors.white30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  _rainingStatus(int.parse(notRaining.toString())),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _devs() {
    return Text(
      'Developed by: \nUjjwal Raj Puri,\n Rajendra Khadka \&\nDishant Shrestha\nNepal Engineering College, Changunarayan, Bhaktapur',
      style: TextStyle(
          color: Colors.white24, fontSize: 17, fontStyle: FontStyle.italic),
    );
  }

  Widget _rainFallAmount(currentPulseCount, lastPulseCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          " Rain Status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white30),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Current Rainfall Amount: $currentPulseCount mm",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Total Rainfall Amount: $lastPulseCount mm",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _rainingStatus(int notRaining) {
    if (notRaining == 1) {
      return "Not raining";
    }
    return "Raining";
  }
}
