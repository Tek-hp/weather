import 'package:firebase_database/firebase_database.dart';

class FetchDataService {
  final _db = FirebaseDatabase.instance.reference();

  Stream<Event> getTempData() {
    return _db.child('weatherData').onValue.asBroadcastStream();
  }
}
