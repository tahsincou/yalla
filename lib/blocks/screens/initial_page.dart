import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/screens/common/theme/change_theme_button_widget.dart';
import 'package:yalla/blocks/screens/common/theme/my_themes.dart';

class InitialPageScreen extends StatefulWidget {
  const InitialPageScreen({Key? key}) : super(key: key);

  @override
  State<InitialPageScreen> createState() => _InitialPageScreenState();
}

class _InitialPageScreenState extends State<InitialPageScreen> {

  Container buildContainer(){
    setState(() {

    });
   return Container(
     height: 250,
       width: 250,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(50),
         image:  DecorationImage(
           image: AssetImage('assets/images/logo.png')
         )
       ),
       // child: Lottie.asset(
       //     'assets/animation/date.json')
   );

  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final image = themeProvider.themeMode == ThemeMode.dark ? 'assets/images/dark_logo.jpg' : 'assets/images/logo.png';
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        // title: const Text('Sign Up'),
        elevation: 0,
        actions:const [
          ChangeThemeButtonWidget(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: screenSize.height * .02),
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: Container(
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
            )
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0)),
                  color: Theme.of(context).primaryColor),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: screenSize.width * .7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:Theme.of(context).scaffoldBackgroundColor,
                            onPrimary: Theme.of(context).primaryColor,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register_phone_auth');
                        },
                        child: const Text('I\'m new here'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      width: screenSize.width * .7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.white,
                            shape: const StadiumBorder()),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('I\'ve been here already'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'By continuing you agree to our \n Terms of services and Privacy policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 9),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
