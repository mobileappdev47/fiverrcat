import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import '../../../../imports.dart';

mixin UserRepository {
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static String? get _uid => auth.currentUser?.uid;

  static final usersCol =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (e, _) => User.fromMap(e.data()!),
            toFirestore: (m, _) => m.toMap(),
          );
  static DocumentReference<User> userDoc([String? id]) =>
      usersCol.doc(id ?? _uid);

  static Future<User?> fetchUser([String? id]) async {
    final doc = await userDoc(id ?? _uid).get();
    return doc.data();
  }

  static Stream<User>? userStream([String? id]) {
    final uid = id ?? _uid ?? '';
    if (uid.isEmpty) return null;
    return userDoc(uid)
        .snapshots()
        .map((s) => s.data()!)
        .handleError((e) => logError(e));
  }


  static Future<void> saveMyInfo() async {
    if (_uid == null) return;
    await userDoc().set(
      authProvider.user!,
      SetOptions(merge: true),
    );
  }

  static Future<void> updateActiveAt(bool isActive) async {
    userDoc().update(
      {
        "isActive": isActive,
        "activeAt": FieldValue.serverTimestamp(),
      },
    ).catchError((e) => logError(e));
  }


  static Future<void> banUser(String userID) async {
    FirebaseFunctions.instance
        .httpsCallable('banUser')
        .call({'userID': userID});
  }
}
