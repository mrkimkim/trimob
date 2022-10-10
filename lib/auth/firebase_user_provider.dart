import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class IonicsFirebaseUser {
  IonicsFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

IonicsFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IonicsFirebaseUser> ionicsFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<IonicsFirebaseUser>(
      (user) {
        currentUser = IonicsFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
