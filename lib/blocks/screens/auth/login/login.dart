import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/screens/common/theme/change_theme_button_widget.dart';
import 'package:yalla/blocks/screens/common/theme/my_themes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final image = themeProvider.themeMode == ThemeMode.dark ? 'assets/images/dark_logo.jpg' : 'assets/images/logo.png';
    final scrrenHeight = MediaQuery.of(context).size.height;
    final scrrenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).iconTheme.color,
        // title: const Text('Login'),
        elevation: 0,
        actions:const [
           ChangeThemeButtonWidget(),
        ],
      ),
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          width: scrrenWidth,
          height: scrrenHeight,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:  DecorationImage(
                        image: AssetImage(image)
                    )
                ),
                // child: Lottie.asset(
                //     'assets/animation/date.json')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkWell(
                  //       onTap: (){},
                  //       child: Container(
                  //         height: 40,
                  //         width: 40,
                  //         decoration:const BoxDecoration(
                  //             borderRadius: BorderRadius.all(Radius.circular(50)),
                  //             image: DecorationImage(
                  //                 image: AssetImage('assets/images/google.png')
                  //             )
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 30),
                  //     InkWell(
                  //       onTap: (){},
                  //       child: Container(
                  //         height: 40,
                  //         width: 40,
                  //         decoration:const BoxDecoration(
                  //             borderRadius: BorderRadius.all(Radius.circular(10)),
                  //             image: DecorationImage(
                  //                 image: AssetImage('assets/images/facebook.png')
                  //             )
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login_with_phone', arguments: 'login');
                    },
                    elevation: 0,
                    padding: const EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child:  Text("Login with Phone Number",
                          style:  TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // Center(
                  //   child: Text('Or',
                  //       style: GoogleFonts.abhayaLibre(
                  //           textStyle: Theme.of(context).textTheme.headline1,
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold
                  //       )),
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: Theme.of(context).primaryColorLight,
                  //       borderRadius: const BorderRadius.all(Radius.circular(20))),
                  //   child: const TextField(
                  //     decoration:  InputDecoration(
                  //         enabledBorder:  OutlineInputBorder(
                  //           borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  //         ),
                  //         border: InputBorder.none,
                  //         hintText: "Email"),
                  //   ),
                  // ),
                  // const SizedBox(height: 20),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: Theme.of(context).primaryColorLight,
                  //       borderRadius: const BorderRadius.all(Radius.circular(20))),
                  //   child: const TextField(
                  //
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide:  BorderSide(color: Colors.grey, width: 1.0),
                  //       ),
                  //         border: InputBorder.none, hintText: "Password"),
                  //   ),
                  // ),

                  // Text('Forgot Password',
                  //     style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     RaisedButton(
              //       onPressed: () {
              //         Navigator.pushNamed(context, '/dash_board');
              //       },
              //       elevation: 0,
              //       padding: const EdgeInsets.all(12),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //       child: const Center(
              //         child:  Text("Login",
              //             style:  TextStyle(fontWeight: FontWeight.bold)),
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 15),
              //       child: InkWell(
              //         onTap: (){
              //           Navigator.pushNamed(context, '/phone_auth');
              //         },
              //         child: Text("Create Account",
              //             style: Theme.of(context).textTheme.bodyText1),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
