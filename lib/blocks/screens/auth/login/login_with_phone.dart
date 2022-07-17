import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/screens/common/theme/change_theme_button_widget.dart';
import 'package:yalla/blocks/screens/common/theme/my_themes.dart';
import 'package:yalla/blocks/services/auth_services.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  var _firstOtpController = TextEditingController();
  var _secondOtpController = TextEditingController();
  var _thirdOtpController = TextEditingController();
  var _fourthOtpController = TextEditingController();
  var _fifthOtpController = TextEditingController();
  var _sixthOtpController = TextEditingController();
  var otpText;
  String phoneNumber = '';
  String phoneIsoCode = '';
  void onPhoneNumberChange(
      String number, String internationalizedNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String _verificationID = '';
  bool phoneNumberVisible = true;
  bool otpCodeVisible = false;
  PhoneNumber number = PhoneNumber(isoCode: 'US');
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final image = themeProvider.themeMode == ThemeMode.dark
        ? 'assets/images/dark_logo.jpg'
        : 'assets/images/logo.png';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: AssetImage(image))),
                // child: Lottie.asset(
                //     'assets/animation/date.json')
              ),
              Visibility(
                visible: phoneNumberVisible,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      InternationalPhoneNumberInput(
                          textAlign: TextAlign.start,
                          autoFocus: false,
                          textStyle: const TextStyle(color: Colors.black),
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          inputDecoration: const InputDecoration(
                              fillColor: Colors.black,
                              hintText: 'Phone number',
                              hintStyle: TextStyle(color: Colors.black)),
                          countrySelectorScrollControlled: true,
                          initialValue: number,
                          selectorConfig: const SelectorConfig(
                              setSelectorButtonAsPrefixIcon: true,
                              showFlags: false,
                              selectorType: PhoneInputSelectorType.DIALOG,
                              useEmoji: true,
                              trailingSpace: true),
                          onInputChanged: (value) {
                            setState(() {
                              phoneNumber = value.toString();
                            });
                          })
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: otpCodeVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('Enter your otp',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * .02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildOtpBox(context, _firstOtpController),
                            buildOtpBox(context, _secondOtpController),
                            buildOtpBox(context, _thirdOtpController),
                            buildOtpBox(context, _fourthOtpController),
                            buildOtpBox(context, _fifthOtpController),
                            SizedBox(
                              height: 60,
                              width: 54,
                              child: TextFormField(
                                autofocus: true,
                                controller: _sixthOtpController,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    setState(() {
                                      otpText = (_firstOtpController.text +
                                          _secondOtpController.text +
                                          _thirdOtpController.text +
                                          _fourthOtpController.text +
                                          _fifthOtpController.text +
                                          _sixthOtpController.text);
                                      print(otpText);
                                    });
                                  }
                                  FocusScope.of(context).nextFocus();
                                },
                                style: Theme.of(context).textTheme.bodyText1,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1),
                                )),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: MediaQuery.of(context).size.height * .12),
              RaisedButton(
                onPressed: () {
                  if (otpCodeVisible) {
                    authService.verifyOTP(context, _verificationID, otpText);
                  } else {
                    auth.verifyPhoneNumber(
                        phoneNumber: phoneNumber,
                        verificationCompleted:
                            (PhoneAuthCredential credential) async {
                          await auth
                              .signInWithCredential(credential)
                              .then((value) {});
                        },
                        verificationFailed: (FirebaseException e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(e.code)));
                          if (e.code == 'invalid-phone-number') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'The provided phone number is not valid.')));
                          }
                        },
                        codeSent: (String verificationID, int? resendToken) {
                          setState(() {
                            _verificationID = verificationID;
                            otpCodeVisible = true;
                            phoneNumberVisible = false;
                          });
                        },
                        codeAutoRetrievalTimeout: (String verificationID) {});
                  }
                },
                elevation: 0,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                      otpCodeVisible == false ? 'Send OTP' : 'Verify OTP',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  SizedBox buildOtpBox(
      BuildContext context, TextEditingController textEditingController) {
    return SizedBox(
      height: 60,
      width: 54,
      child: TextFormField(
        autofocus: true,
        controller: textEditingController,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        )),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
