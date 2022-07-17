import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yalla/blocks/screens/common/theme/my_themes.dart';
import 'package:yalla/blocks/services/firestore_auth.dart';
import 'package:yalla/blocks/model/user_firestore_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> convert(List<String> list) {
    for (var i = 150; i <= 200; i++) {
      setState(() {
        list.add(i.toString() + ' cm');
      });
    }
    return list;
  }

  var ageList = List<int>.generate(100, (i) => i + 18);
  var heightList = List<int>.generate(200, (i) => i + 150);
  //  List<String> _heightItem = [];
  // String selectedHeight = '150 cm';
  DateTime dateTime = DateTime(2000, 12, 24);
  int finalHeight = 0;
  int selectedAge = 0;
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
  String selectedNationality = 'EGYPTIAN';
  final List<String> _religionItems = [
    'CHRISTIAN - ORTHODOX',
    'CHRISTIAN - CATHOLIC',
    'CHRISTIAN – OTHER',
    'MUSLIM – SHIA',
    'MUSLIM – SUNNI',
    'OTHERS',
  ];
  String selectedReligion = 'MUSLIM – SUNNI';
  @override
  Widget build(BuildContext context) {
    final userAuth = FirebaseAuth.instance.currentUser!;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final text = themeProvider.themeMode == ThemeMode.dark ? 'Dark' : 'Light';
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          // width: scrrenWidth,
          // height: scrrenHeight,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Text('Update Your Profile',
                    style: GoogleFonts.abel(
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const SizedBox(height: 20),
                  buildTextField(
                      context, "First Name", false, _firstNameController),
                  buildTextField(
                      context, "Last Name", false, _lastNameController),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .79,
                      child: TextField(
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2004));
                          if (newDate == null) return;
                          setState(() {
                            dateTime = newDate;
                            _birthDateController.text =
                                '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                          });
                        },
                        readOnly: true,
                        controller: _birthDateController,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.arrow_drop_down,
                              size: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: .5),
                            ),
                            // border: InputBorder.none,
                            hintText: 'Date of Birth'),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 3),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: DropdownButtonFormField<int>(
                        decoration: const InputDecoration(
                            hintText: 'Height (cm)',
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: .5),
                            )),
                        items: heightList.map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (item) => setState(() {
                          finalHeight = item!;
                          print(finalHeight);
                        }),
                      )),
                  // builDropDown(context, 'Height', convert(_heightItem), selectedHeight),
                  builDropDown(context, 'Nationality', _nationalityItems,
                      selectedNationality),
                  buildTextField(context, "Location", false, _locationController),
                  // builDropDown(context, 'Religion', _religionItems, selectedReligion),
                  // buildTextField(
                  //     context, 'Password', true, _passwordController),
                  // buildTextField(context, 'Confirm Password', true,
                  //     _confirmPasswordController),
                ],
              ),
              const SizedBox(height: 10),

              //Action to register
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RaisedButton(
                    onPressed: () {
                      print(_firstNameController.text +
                          _lastNameController.text +
                          _locationController.text +
                          _birthDateController.text +
                          finalHeight.toString() +
                          _passwordController.text);
                      final user = UserModel(id: userAuth.uid,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          age: 20,
                          imageUrls: [],
                          interests: [],
                          height: finalHeight.toString(),
                          nationality: selectedNationality,
                          location: 'string',
                          religion: 'string',
                          bio: 'string',
                          profession: 'string',
                          email: 'string',
                          password: 'string',
                          birthDate: dateTime);
                      // DateTime.parse(_birthDateController.text);
                      showDialog(context: context, builder:(context){
                        return  Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));}
                      );
                        FireStoreAuth.commonSignUpWithUid(user);
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                          content: Text('Successfully updated for the ID: ${userAuth.uid}')));
                      Navigator.pushNamed(context, '/bottom_navigation');
                    },
                    elevation: 0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text("Update",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildTextField(BuildContext context, String labelText,
      bool obsCureValue, TextEditingController textEditingController) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextField(
        textInputAction: TextInputAction.next,
        controller: textEditingController,
        obscureText: obsCureValue,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.3),
            ),
            // border: InputBorder.none,
            hintText: labelText),
      ),
    );
  }

  Container builDropDown(BuildContext context, String hintText,
      List<String> list, String selectedItem) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: .5),
              )),
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (height) => setState(() {
            selectedItem = height!;
            print(selectedItem);
          }),
        ));
  }
}
