
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:yalla/blocks/model/User_location.dart';
import 'package:yalla/blocks/screens/auth/login/login.dart';
import 'package:yalla/blocks/screens/auth/login/login_with_phone.dart';
import 'package:yalla/blocks/screens/auth/register/register_phone_auth.dart';
import 'package:yalla/blocks/screens/initial_page.dart';
import 'package:yalla/blocks/screens/auth/register/register.dart';
import 'package:yalla/blocks/screens/common/components/bottom_navigation.dart';
import 'package:yalla/blocks/screens/common/theme/my_themes.dart';
import 'package:yalla/blocks/screens/profile/edit_profile.dart';
import 'package:yalla/blocks/screens/profile/user_profile.dart';
import 'package:yalla/blocks/services/auth_services.dart';
import 'package:yalla/blocks/services/location_services.dart';
import 'package:yalla/wrapper.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
final navigatorKey  = GlobalKey<NavigatorState>();
class _MyAppState extends State<MyApp> {
  // final prefs =  SharedPreferences.getInstance();
  // void setUId()async {
  //   final prefs = await SharedPreferences.getInstance();
  //   userId = prefs.getString('userId')!;
  // }
  @override
  Widget build(BuildContext context)  {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        // Provider<UserLocation>(create: (context)=> LocationService().locationStream),
        // StreamProvider(create: (context) => context<FireAuth>.read())
      ],
      child: ChangeNotifierProvider(
        create: (context)=> ThemeProvider(),
        builder: (context, _){
          final themeProvider= Provider.of<ThemeProvider>(context);
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            // themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: SplashScreenView(
              // navigateRoute: userId =='' ? const InitialPageScreen():const NavigationBarCommon(),
              navigateRoute: const Wrapper(),
              duration: 6000,
              imageSize: 140,
              colors: [ Colors.grey.shade300, Colors.black],
              imageSrc:'assets/images/splash.jpg',
              // text: "Let's Date",
              // textType: TextType.ColorizeAnimationText,
              textStyle: const TextStyle(
                fontSize: 30.0,
              ),
              backgroundColor: Colors.white,

            ),
            routes: {
              '/login': (context)=> const LoginScreen(),
              '/login_with_phone': (context)=> const LoginWithPhoneScreen(),
              '/dash_board': (context)=> const NavigationBarCommon(),
              '/register': (context)=> const RegisterScreen(),
              '/register_phone_auth': (context)=> const RegisterAuthenticationScreen(),
              '/initial_page': (context)=> const InitialPageScreen(),
              '/user_profile': (context)=> const UserProfile(),
              '/edit_profile': (context)=> const EditProfile(),
              '/bottom_navigation': (context)=> const NavigationBarCommon(),
            },
          );
        },
      ),
    );
  }
}

