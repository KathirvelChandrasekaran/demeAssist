import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> updateUser(String userName) async {
  try {
    String uid = FirebaseAuth.instance.currentUser.uid;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("User").doc(uid);
    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.get(documentReference);
      transaction.update(documentReference, {"userName": userName});
      return true;
    });
  } catch (e) {
    print(e.toString());
    return null;
  }
}
