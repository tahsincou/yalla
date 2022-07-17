import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';
import 'package:yalla/blocks/screens/dashboard/dashboard.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    UserModel? user;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      user = ModalRoute.of(context)!.settings.arguments as UserModel;
    }
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_left, size: 40),
        excludeHeaderSemantics: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).iconTheme.color,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body:
          user != null?
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.7,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          image: DecorationImage(
                              image: AssetImage(user.imageUrls[0]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          ChoiceButton(icon: Icons.clear, color: Colors.red),
                          ChoiceButton(icon: Icons.star, color: Colors.blue),
                          ChoiceButton(icon: Icons.favorite, color: Colors.green),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${user.firstName}, ${user.age}',
                  style: GoogleFonts.macondoSwashCaps(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )),
                  Text(user.profession,
                    style: GoogleFonts.abel(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,

                    )),
                  const SizedBox(height: 10),
                  Text(user.bio,
                      style: GoogleFonts.abel(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      )),
                  const SizedBox(height: 10),
                  Text('Interests',
                      style: GoogleFonts.abel(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                  const SizedBox(height: 5),
                  Row(
                    children: user.interests.map((interest) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 5,
                        right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              Colors.lightGreen,
                            ]
                          )
                        ),
                        child: Text(interest,
                            style: GoogleFonts.abel(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            )),
                      )).toList()
                  )
                ],
              ),
            )
          ],
        ),
      ):
      Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
