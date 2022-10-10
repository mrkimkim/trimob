import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class TrimobFirebaseUser {
  TrimobFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TrimobFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TrimobFirebaseUser> trimobFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TrimobFirebaseUser>(
      (user) {
        currentUser = TrimobFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
