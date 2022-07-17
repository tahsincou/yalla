import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';


class FireStoreAuth {
  FirebaseFirestore cloudStore = FirebaseFirestore.instance;
  FireStoreAuth();
  static DateTime dateTime = DateTime.now();
  final docUser = FirebaseFirestore.instance.collection('users');

  ///For saving a user with uId in fire store
  static Future commonSignUpWithUid(UserModel user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
    final json = user.toJson();
    await docUser.set(json);
  }

  ///For reading users with uId in fire store
  Stream<List<UserModel>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList());

  ///For reading  a single user with uId in fire store
  static Future<UserModel?> readSingleUser(String uId) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uId);
    final snapShot = await docUser.get();
    if (snapShot.exists) {
      return UserModel.fromJson(snapShot.data()!);
    } else {
      print('error to read data ');
    }
  }

  ///For updating a user data with uId in fire store
  static Future<UserModel?> updateSingleUser(
      String uId, String parameterName, var updatedValue) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(uId);
    docUser.update({parameterName: updatedValue});
    final snapShot = await docUser.get();
    if (snapShot.exists) {
      return UserModel.fromJson(snapShot.data()!);
    } else {
      print('error');
    }
  }
}
