import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDumsgruewmrHdWr_evuQOxCQd5xxNyxZI",
            authDomain: "log-in-for-coaches-and-th0sta.firebaseapp.com",
            projectId: "log-in-for-coaches-and-th0sta",
            storageBucket: "log-in-for-coaches-and-th0sta.appspot.com",
            messagingSenderId: "1062935928036",
            appId: "1:1062935928036:web:c1f896ec90a5896fb820f1"));
  } else {
    await Firebase.initializeApp();
  }
}
