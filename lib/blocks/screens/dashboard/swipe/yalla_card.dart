import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';

class YallaCard extends StatelessWidget {
  const YallaCard({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Swipable(
      // verticalSwipe: false,
      onSwipeStart: (details) {

      },
      onSwipeCancel: (position, details) {},
      onSwipeEnd: (position, details) {
      },
      onPositionChanged: (details) {
        CircularProgressIndicator();
      },
      onSwipeUp: (finalPosition) {
        // // print("Swipe Up");
        Navigator.pushNamed(context, '/user_profile',arguments: user);
      },
      onSwipeDown: (finalPosition) {
        // print("Swipe Down");
      },
      onSwipeLeft: (finalPosition) {
        // print("Swipe Left");
      },
      onSwipeRight: (finalPosition) {
        // print("Swipe Right");
      },
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 75, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              SizedBox(
                  height: screenSize.height / 1.3,
                  width: screenSize.width,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: ()

                        { Navigator.pushNamed(context, '/user_profile',arguments: user);
                        print('Clicked');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                user.imageUrls[0],
                              ),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 4,
                                  blurRadius: 4,
                                  offset: Offset(4, 4))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(180, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      Positioned(
                        bottom: 80,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${user.firstName},  ${user.age.toString()}',
                              style: GoogleFonts.sacramento(
                                  textStyle:
                                      Theme.of(context).textTheme.headline1,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor),
                            ),
                            Text(
                              '${user.profession},   ${user.location},  1 km away',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor),
                            ),
                            // Row(
                            //   children: [
                            //     userImageSmall(user.imageUrls[0]),
                            //     userImageSmall(user.imageUrls[1]),
                            //     userImageSmall(user.imageUrls[2]),
                            //     userImageSmall(user.imageUrls[1]),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.info_outline,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor)),
                      ),


                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }

  Container userImageSmall(String imageUrl) {
    return Container(
      height: 50,
      width: 40,
      margin: const EdgeInsets.only(top: 10, right: 8),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
