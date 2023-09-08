import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth/base_auth_user_provider.dart';
import '../auth/firebase_auth/auth_util.dart';

class JobAdminFunctions{
  static Future<bool> isCompanyDetailsPresent() async {
    if (loggedIn) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .collection('companyDetails')
          .get();

      return snapshot.size == 1 ? true : false;
    } else {
      return false;
    }
  }


  static Future isPendingJob() async {
    if (loggedIn) {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserUid)
          .collection('incompleteJob')
          .get();

      return snapshot.size == 1 ? true : false;
    } else {
      return false;
    }
  }
}