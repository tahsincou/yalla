import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/screens/auth/register/register.dart';
import 'package:yalla/blocks/screens/common/components/profile_list_item.dart';
import 'package:yalla/blocks/services/auth_services.dart';
import 'package:yalla/blocks/services/firestore_auth.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';
import 'package:yalla/main.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  // String uId= '';
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    final userAuth = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          excludeHeaderSemantics: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: FutureBuilder<UserModel?>(
          future: FireStoreAuth.readSingleUser(userAuth.uid),
          builder: (context, snapshot) {
            getData(userAuth.uid);
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  userAuth.phoneNumber!,
                  style: GoogleFonts.sacramento(
                      color: Theme.of(context).primaryColor),
                ),
              );
            } else if (snapshot.hasData) {
              final user = snapshot.data;
              return user == null
                  ? const Center(
                      child: Text('No user'),
                    )
                  : CommonMyProfileUi(userModel: user);
            } else {
              return Center(
                  child:userModel == null? RegisterScreen(): CircularProgressIndicator(
                      color: Theme.of(context).primaryColor)
              );
            }
          },
        )
    );
  }

  void getData(String uId) async {
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uId).get();
    setState(() {
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
    });
  }
}

class CommonMyProfileUi extends StatefulWidget {
  CommonMyProfileUi({Key? key, required this.userModel}) : super(key: key);
  UserModel userModel;

  @override
  State<CommonMyProfileUi> createState() => _CommonMyProfileUiState();
}

class _CommonMyProfileUiState extends State<CommonMyProfileUi> {
  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 60, bottom: 0),
          child: const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            // FireAuth.updateSingleUser(widget.userModel.id, 'firstName', 'Hasan');
            // setState(() {
            //
            // });
          },
          child: Text('${widget.userModel.firstName} , 28',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Theme.of(context).primaryColor)),
        ),
        // SizedBox(height:10),
        // const Text('tahsincou@gmail.com', style:TextStyle(fontWeight: FontWeight.w400,fontSize: 12)),
        const SizedBox(height: 10),
        Container(
          height: 30,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.yellow.shade500,
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text('Upgrade to PRO',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        Flexible(
          child: ListView(
            padding: EdgeInsets.only(top: 20),
            children : [
              const ProfileListItem(
                  icon: Icons.security,
                  text: 'Edit Info',
                  routeName: '/edit_profile'),
              const ProfileListItem(
                  icon: Icons.history,
                  text: 'Purchase History',
                  routeName: '/edit_profile'),
              // ProfileListItem(icon: Icons.help, text: 'Help & Support'),
            const  ProfileListItem(
                  icon: Icons.settings,
                  text: 'Dating Preferences',
                  routeName: '/edit_profile'),
              // ProfileListItem(
              //       icon: Icons.insert_invitation, text: 'Invite a Friend', routeName: '/edit_profile'),
              //   ProfileListItem(
              //       icon: Icons.logout, text: 'Logout', hasNavigation: false,  routeName: '/edit_profile'),
              Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 0)
                    .copyWith(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  onTap: () async {
                    authservice.signOut();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.logout,
                          size: 25, color: Colors.lightGreen),
                      const SizedBox(width: 10),
                      Text('Log Out',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color:
                                  Theme.of(context).scaffoldBackgroundColor)),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
