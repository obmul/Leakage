import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC6YUSN9v5H6_fv1aHENUW1FKKIebeP_2Y",
            authDomain: "maps-53b57.firebaseapp.com",
            projectId: "maps-53b57",
            storageBucket: "maps-53b57.appspot.com",
            messagingSenderId: "650691839014",
            appId: "1:650691839014:web:1f41a5e8d40726156912e7",
            measurementId: "G-ZB54VT7KC6"));
  } else {
    await Firebase.initializeApp();
  }
}
