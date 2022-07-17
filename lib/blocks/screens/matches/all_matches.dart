import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';

class AllMatchesScreen extends StatefulWidget {
  const AllMatchesScreen({Key? key}) : super(key: key);

  @override
  State<AllMatchesScreen> createState() => _AllMatchesScreenState();
}

class _AllMatchesScreenState extends State<AllMatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:50, left: 20, right: 20, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Matches',
                style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: UserModel.users[0].imageUrls.length,
                    itemBuilder: (context, index) {
                  return Column(

                    children: [
                      userImageSmall(UserModel.users[0].imageUrls[index]),
                      Text(UserModel.users[index].firstName)
                    ],
                  );
                }),
              ),
              SizedBox(height: 5),
              Text(
                'Your Chats',
                style: GoogleFonts.abel(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: UserModel.users[0].imageUrls.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userImageSmall(UserModel.users[0].imageUrls[index]),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(UserModel.users[index].firstName),
                              SizedBox(height: 5),
                              Text(UserModel.users[index].nationality),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
  Container userImageSmall(String imageUrl) {
    return Container(
      height: 80,
      width: 75,
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
