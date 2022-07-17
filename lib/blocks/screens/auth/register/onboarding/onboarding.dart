import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:location/location.dart';
import 'package:yalla/blocks/screens/initial_page.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const InitialPageScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/splash.jpg',
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName,) {
    return Image.asset('assets/$assetName', scale: 1,);
  }

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _bioNameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _age = 'When is your birthday?';
  String _height = 'Whats your height?';
  String _nationality = 'What\'s  your nationality?';
  String _religion = 'What\'s  your Religion?';
  String _gender = 'How do you define yourself?';
  final List<String> _heightItems = [
    '3\'0\"',
    '3\'1\"',
    '3\'2\"',
    '3\'3\"',
    '3\'4\"',
    '3\'5\"',
    '3\'6\"',
    '3\'7\"',
    '3\'8\"',
    '3\'9\"',
    '3\'10\"',
    '3\'11\"',
    '4\'0\"',
    '4\'1\"',
    '4\'2\"',
    '4\'3\"',
    '4\'4\"',
    '4\'5\"',
    '4\'6\"',
    '4\'7\"',
    '4\'8\"',
    '4\'9\"',
    '4\'10\"',
    '4\'11\"',
    '5\'0\"',
    '5\'1\"',
    '5\'2\"',
    '5\'3\"',
    '5\'4\"',
    '5\'5\"',
    '5\'6\"',
    '5\'7\"',
    '5\'8\"',
    '5\'9\"',
    '5\'10\"',
    '5\'11\"',
    '6\'0\"',
    '6\'1\"',
    '6\'2\"',
    '6\'3\"',
    '6\'4\"',
    '6\'5\"',
    '6\'6\"',
    '6\'7\"',
    '6\'8\"',
    '6\'9\"',
    '6\'10\"',
    '6\'11\"',
    '7\'0\"'
  ];

  final List<String> _nationalityItems = [
    'EGYPTIAN',
    'SYRIAN',
    'LEBANESE',
    'IRAQI',
    'SAUDI ARABIAN',
    'JORDANIAN',
    'YEMENI',
    'PALESTINIAN',
    'OTHER'
  ];
  final List<String> _religionItems = [
    'CHRISTIAN - ORTHODOX',
    'CHRISTIAN - CATHOLIC',
    'CHRISTIAN – OTHER',
    'MUSLIM – SHIA',
    'MUSLIM – SUNNI',
    'OTHERS',
  ];
  final List<String> _genderItems = [
    'Male',
    'Female',
    'Prefer not say',
  ];
  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  String _currentAddress = 'Enable your location';

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    var pageDecoration = PageDecoration(
      titleTextStyle: const TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(20.0, 100.0, 16.0, 16.0),
      pageColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      imagePadding: EdgeInsets.all(50),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      // globalHeader: Align(
      //   alignment: Alignment.topRight,
      //   child: SafeArea(
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 16, right: 16),
      //       child: _buildImage('images/logo.png', 100),
      //     ),
      //   ),
      // ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [

        ///Welcome
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash.jpg')
                    )
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: Text('Welcome to Yalla! \n Let\'s set up your profile!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abel(
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(1);
                },
                child: Text('Next'),
              ),
            ],
          ),
          // image: _buildImage('images/splash.jpg'),
          decoration: pageDecoration.copyWith(

          ),
        ),

        ///Name field
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              buildTextField(
                  context, 'What\'s your first name?', _firstNameController),
              buildTextField(
                  context, 'What\'s your last name?', _lastNameController),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(2);
                },
                child: Text('Next'),
              ),
            ],
          ),
          // image: _buildImage('images/splash.jpg'),
          decoration: pageDecoration,
        ),

        ///Birthday & Height
        PageViewModel(
          title: '',
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              ///Birthday
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_age,
                        style: GoogleFonts.abel(
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .headline1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            showPickerDate(context);
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),
              SizedBox(height: 20),

              ///Height
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_height,
                        style: GoogleFonts.abel(
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .headline1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _showHeight(context);
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(3);
                },
                child: Text('Next'),
              ),
            ],
          ),
          // image: _buildImage('images/splash.jpg'),
          decoration: pageDecoration,
        ),

        ///Nationality & Religion
        PageViewModel(
          title: '',
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ///Nationality
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_nationality,
                        style: GoogleFonts.abel(
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .headline1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _showNationality(context);
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),

              ///Religion
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(_religion,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.abel(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .headline1,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _showReligion(context);
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  introKey.currentState?.animateScroll(4);
                },
                child: const Text('Next'),
              ),

            ],
          ),
          // image: _buildImage('images/splash.jpg'),
          decoration: pageDecoration,
        ),

        ///Gender & Location
        PageViewModel(
          title: '',
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Gender
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(_gender,
                        style: GoogleFonts.abel(
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .headline1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                           _showGender(context);
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),
              const Divider(height: 32),
              ///location
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Text(_currentAddress,
                          style: GoogleFonts.abel(
                              textStyle: Theme
                                  .of(context)
                                  .textTheme
                                  .headline1,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                        onPressed: ()  {
                          setState(() async {
                            _serviceEnabled = await location.serviceEnabled();
                            if (!_serviceEnabled) {
                              _serviceEnabled = await location.requestService();
                              if (!_serviceEnabled) {
                                return;
                              }
                            }
                            _permissionGranted = await location.hasPermission();
                            if (_permissionGranted == PermissionStatus.denied) {
                              _permissionGranted = await location.requestPermission();
                              if (_permissionGranted != PermissionStatus.granted) {
                                return;
                              }
                            }
                            _locationData = await location.getLocation();
                            print(_locationData.longitude);
                            setState(() {
                              _currentAddress ='Your present location is ${_locationData.latitude} & ${_locationData.longitude} ';
                            });
                          });
                        },
                        child:
                        Padding(padding: const EdgeInsets.all(5),
                          child: Icon(Icons.arrow_drop_down_circle_outlined,
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),

                        )
                    ),
                  ]
              ),
              RaisedButton(
                onPressed: () async {
                  introKey.currentState?.animateScroll(5);
                },
                child: const Text('Next'),
              ),
            ],
          ),
          // image: _buildImage('images/splash.jpg'),
          decoration: pageDecoration,
        ),

        ///Add some pictures and description
        PageViewModel(
          title: "",
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(10),
                child: Text('Let\'s add  some pictures a!',
                    style: GoogleFonts.abel(
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  imageBox(context),
                  imageBox(context),
                  imageBox(context),
                  imageBox(context),
                  imageBox(context),
                  imageBox(context),
                  imageBox(context),
                ],
              ),
              const Divider(height: 32),
              Padding(padding: const EdgeInsets.all(10),
                child: Text('Tell us about yourself',
                    style: GoogleFonts.abel(
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColorLight,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  textInputAction: TextInputAction.next,
                  controller: _bioNameController,
                  decoration:const  InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.3),
                      ),
                      // border: InputBorder.none,
                      hintText: 'Write here...'),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  // introKey.currentState?.animateScroll();
                },
                child: const Text('Next'),
              ),

            ],
          ),
          // decoration: pageDecoration.copyWith(
          //   bodyAlignment: Alignment.topCenter,
          // ),
          // image: _buildImage('images/splash.jpg'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: Icon(Icons.arrow_left,
          color: Theme
              .of(context)
              .primaryColor, size: 40),
      // skip:  Text('Skip', style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor)),
      next: Icon(Icons.arrow_right,
          color: Theme
              .of(context)
              .primaryColor, size: 40),
      done: Text('Done',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme
                  .of(context)
                  .primaryColor)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: Theme
            .of(context)
            .primaryColor,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      // dotsContainerDecorator: ShapeDecoration(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //   ),
      // ),
    );
  }

  Padding imageBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border(
              bottom: BorderSide(color: Theme
                  .of(context)
                  .primaryColor, width: 1),
              top: BorderSide(color: Theme
                  .of(context)
                  .primaryColor, width: 1),
              left: BorderSide(color: Theme
                  .of(context)
                  .primaryColor, width: 1),
              right: BorderSide(color: Theme
                  .of(context)
                  .primaryColor, width: 1),
            )
        ),
        child: IconButton(icon: Icon(Icons.add_circle, color: Theme
            .of(context)
            .primaryColor), onPressed: () {}),
      ),
    );
  }

  Container buildTextField(BuildContext context, String labelText,
      TextEditingController textEditingController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextField(
        textInputAction: TextInputAction.next,
        controller: textEditingController,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.3),
            ),
            // border: InputBorder.none,
            hintText: labelText),
      ),
    );
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: const Text(
          "Select Birth Date",
          textAlign: TextAlign.center,
        ),
        selectedTextStyle: TextStyle(color: Theme
            .of(context)
            .primaryColor),
        onConfirm: (Picker picker, List value) {
          final time = (picker.adapter as DateTimePickerAdapter).value!;
          final totalAge = _selectedDate
              .difference(time)
              .inDays / 365;
          setState(() {
            // _selectedDate =time;
            _age = 'Your are ${totalAge.truncate()} years old!';
          });
          print(totalAge.truncate());
        }).showDialog(context);
  }

  _showHeight(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .4,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 25),
                children: [
                  for (String name in _heightItems) Text(name),
                ],
                onSelectedItemChanged: (value) {
                  String tempHeight = 'Your height is  ${_heightItems[value]
                      .toString()}';
                  setState(() {
                    _height = tempHeight;
                    // _selectedValue = value;
                  });
                },
              ),
            ));
  }

  _showNationality(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .4,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  for (String name in _nationalityItems) Text(name),
                ],
                onSelectedItemChanged: (value) {
                  String tempNationality = 'Your are  ${_nationalityItems[value]
                      .toString()}';
                  setState(() {
                    _nationality = tempNationality;
                    // _selectedValue = value;
                  });
                },
              ),
            ));
  }

  _showReligion(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .4,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  for (String name in _religionItems) Text(name),
                ],
                onSelectedItemChanged: (value) {
                  String tempReligion = 'Great! you are  ${_religionItems[value]
                      .toString()}';
                  setState(() {
                    _religion = tempReligion;
                    // _selectedValue = value;
                  });
                },
              ),
            ));
  }

  _showGender(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) =>
            Container(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .4,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                children: [
                  for (String name in _genderItems) Text(name),
                ],
                onSelectedItemChanged: (value) {
                  String tempReligion = 'You are a ${_genderItems[value]
                      .toString()}';
                  setState(() {
                    _gender = tempReligion;
                    // _selectedValue = value;
                  });
                },
              ),
            ));
  }
}