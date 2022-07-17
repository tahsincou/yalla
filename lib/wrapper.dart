import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/model/user_auth_model.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';
import 'package:yalla/blocks/screens/auth/register/onboarding/onboarding.dart';
import 'package:yalla/blocks/screens/auth/register/register.dart';
import 'package:yalla/blocks/screens/common/components/bottom_navigation.dart';
import 'package:yalla/blocks/screens/dating_preferences/dating_prefernces.dart';
import 'package:yalla/blocks/screens/setting/setting_screen.dart';
import 'package:yalla/blocks/services/auth_services.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  UserModel? userModel;
  void getData(String uId) async {
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uId).get();
    try {
      userModel = UserModel(
          id: userDoc.get('id'),
          lastName: userDoc.get('lastName'),
          firstName: userDoc.get('firstName'),
          age: userDoc.get('age'),
          imageUrls: List.from(userDoc.get('imageUrls')),
          interests: List.from(userDoc.get('interests')),
          height: userDoc.get('height'),
          nationality: userDoc.get('nationality'),
          location: userDoc.get('location'),
          religion: userDoc.get('religion'),
          bio: userDoc.get('bio'),
          profession: userDoc.get('profession'),
          email: userDoc.get('email'),
          password: userDoc.get('password'),
          birthDate: userDoc.get('birthDate').toDate());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    return StreamBuilder<UserAuthModel?>(
        stream: authservice.user,
        builder: (_, AsyncSnapshot<UserAuthModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            final UserAuthModel? userAuthModel = snapshot.data;
            if (userAuthModel == null) {
              return  const SettingsScreen();
            }
            return userModel == null
                ?  const NavigationBarCommon()
            :const RegisterScreen();

          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
