import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhoLikedMeScreen extends StatefulWidget {
  const WhoLikedMeScreen({Key? key}) : super(key: key);

  @override
  State<WhoLikedMeScreen> createState() => _WhoLikedMeScreenState();
}

class _WhoLikedMeScreenState extends State<WhoLikedMeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Text('See who likes you?',
          style: GoogleFonts.abel(
              textStyle: Theme.of(context).textTheme.headline1,
              fontSize: 20,
              fontWeight: FontWeight.bold)),

    );
  }
}
