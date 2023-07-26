import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmCr-J9jsk1y0TqHavRr9ouE3BAbJy5mU",
            authDomain: "jobx-global.firebaseapp.com",
            // authDomain: "jobx.global",
            projectId: "jobx-global",
            storageBucket: "jobx-global.appspot.com",
            messagingSenderId: "897781012043",
            appId: "1:897781012043:web:8cbe08b431aa82b96d9fce",
            measurementId: "G-NVTX90XTZD"));
  } else {
    await Firebase.initializeApp();
  }
}
