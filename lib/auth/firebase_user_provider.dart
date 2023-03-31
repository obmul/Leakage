import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LeakageFirebaseUser {
  LeakageFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

LeakageFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LeakageFirebaseUser> leakageFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LeakageFirebaseUser>(
      (user) {
        currentUser = LeakageFirebaseUser(user);
        return currentUser!;
      },
    );
