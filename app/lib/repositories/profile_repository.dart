import 'package:app/constants/values.dart';
import 'package:app/models/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// [ProfileRepository] is a class that contains the methods to interact with the profile data source.
class ProfileRepository {
  /// [ProfileRepository] constructor.
  ProfileRepository();
  UserData? _user;
  FirebaseFirestore? _db;
  FirebaseAuth? _auth;

  /// [init] initializes the [FirebaseFirestore] and [FirebaseAuth] instances.
  void init() {
    _db ??= FirebaseFirestore.instance;
    _auth ??= FirebaseAuth.instance;
  }

  /// [updateUser] updates the user data.
  Future<void> updateUser(UserData user) async {
    init();
    await _db?.doc('user/${_auth!.currentUser!.uid}').set(user.toJson());
  }

  /// [getUser] returns the user data.
  Future<UserData> getUser() async {
    init();
    await _db?.doc('user/${_auth!.currentUser!.uid}').get().then((DocumentSnapshot<dynamic> documentSnapshot) {
      if (documentSnapshot.exists) {
        _user = UserData.fromJson(documentSnapshot.data()! as Map<String, dynamic>, _auth!.currentUser!.uid);
      }
    });
    return _user ?? UserData(id: _auth!.currentUser!.uid, email: _auth!.currentUser!.email!, avatarUrl: Constants.profilePlaceholderUrl);
  }
}
