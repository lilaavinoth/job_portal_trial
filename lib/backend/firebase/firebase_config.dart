import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDvURpYCTBx5m1mxgJFgLa5I6qV-ozIDa8",
            authDomain: "jobportalmain-4429e.firebaseapp.com",
            projectId: "jobportalmain-4429e",
            storageBucket: "jobportalmain-4429e.appspot.com",
            messagingSenderId: "162005355502",
            appId: "1:162005355502:web:63496c7b0ee2ebf1c95cff",
            measurementId: "G-STT8CBQJQ3"));
  } else {
    await Firebase.initializeApp();
  }
}
