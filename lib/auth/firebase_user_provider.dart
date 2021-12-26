import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AltitudeFirebaseUser {
  AltitudeFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

AltitudeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AltitudeFirebaseUser> altitudeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AltitudeFirebaseUser>(
            (user) => currentUser = AltitudeFirebaseUser(user));
