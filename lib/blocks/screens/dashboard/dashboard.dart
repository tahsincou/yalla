import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';
import 'package:yalla/blocks/screens/dashboard/swipe/yalla_card.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       ClipRRect(
      //         borderRadius: BorderRadius.circular(70),
      //         child: Image.asset(
      //           'assets/images/splash.jpg',
      //           scale: 12,
      //           // color: Colors.transparent,
      //         ),
      //       ),
      //
      //       // Text(
      //       //   'Yalla',
      //       //   style: GoogleFonts.sacramento(
      //       //     textStyle: Theme.of(context).textTheme.headline4,
      //       //     fontSize: 22,
      //       //     fontWeight: FontWeight.bold
      //       //   ),
      //       // )
      //     ],
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: IconButton(
      //           onPressed: () {},
      //           icon:
      //               Icon(Icons.message, color: Theme.of(context).primaryColor)),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: IconButton(
      //           onPressed: () {},
      //           icon: Icon(Icons.info_outline,
      //               color: Theme.of(context).primaryColor)),
      //     ),
      //   ],
      // ),
      extendBodyBehindAppBar: true,
      body: Center(
          child: UserModel.users.isNotEmpty
              ? Stack(
                  children: [
                    for (int i = 0; i <= UserModel.users.length - 1; i++)
                      YallaCard(user: UserModel.users[i]),
                    Positioned(
                      bottom: 30,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          ChoiceButton(icon: Icons.clear, color: Colors.red),
                          ChoiceButton(icon: Icons.star, color: Colors.blue),
                          ChoiceButton(icon: Icons.favorite, color: Colors.green),
                        ],
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator(
                  color: Theme.of(context).primaryColor)),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only( left: 20, right: 20, bottom: 10),
      child: Column(
        children: [
          SizedBox(
              height: screenSize.height / 1.3,
              width: screenSize.width,
              child: Stack(
                children: [
                  Container(
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
                    bottom: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.firstName},  ${user.age.toString()}',
                          style: GoogleFonts.sacramento(
                              textStyle: Theme.of(context).textTheme.headline1,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Text(
                          '${user.profession},   ${user.location},  1 km away',
                          style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        Row(
                          children: [
                            userImageSmall(user.imageUrls[0]),
                            userImageSmall(user.imageUrls[1]),
                            userImageSmall(user.imageUrls[2]),
                            userImageSmall(user.imageUrls[1]),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   left: 100,
                  //   child: Row(
                  //     children: [
                  //       userImageSmall(user.imageUrls[0]),
                  //       userImageSmall(user.imageUrls[1]),
                  //       userImageSmall(user.imageUrls[0]),
                  //     ],
                  //   ),
                  // )
                  Positioned(
                    right: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info_outline,
                            color: Theme.of(context).scaffoldBackgroundColor)),
                  )
                ],
              )),
        ],
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

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({Key? key, required this.color, required this.icon})
      : super(key: key);
  final Color color;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withAlpha(60),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(3, 3))
            ]),
        child: Icon(icon, color: color),
      ),
    );
  }
}
