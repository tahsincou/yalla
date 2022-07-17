import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatingPreferencesScreen extends StatefulWidget {
  const DatingPreferencesScreen({Key? key}) : super(key: key);

  @override
  State<DatingPreferencesScreen> createState() =>
      _DatingPreferencesScreenState();
}

class _DatingPreferencesScreenState extends State<DatingPreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text('Dating Prefernces',
              style: TextStyle(color: Theme.of(context).primaryColor)),
          leading: IconButton(
            icon: Icon(Icons.close, color: Theme.of(context).primaryColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, top: 25, right: 16),
          child: ListView(
            children: [
              buildTitleText(context, 'Basic Preferences'),
              Divider(height: 5, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'My neighborhood', 'South Plainfield'),
              const SizedBox(height: 25),
              buildTitleText(context, 'Member Preferences'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Age Range', '23-34'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Maximum Distance', '57mi'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Ethnicity', 'Middle Eastern'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Religion', 'Christian, Catholic, Other'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Height', '5\'0\" - 7\'0\"'),
              Divider(height: 10, color: Theme.of(context).highlightColor),
            ],
          ),
        )
    );
  }

  Text buildTitleText(BuildContext context, String titleName) {
    return Text(titleName,
        style: GoogleFonts.abel(
            color: Theme.of(context).highlightColor,
            fontSize: 20,
            fontWeight: FontWeight.bold));
  }

  InkWell buildPreferenceItems(BuildContext context, String name, String subName) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: GoogleFonts.actor(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                Text(subName,
                    style: GoogleFonts.actor(
                        fontSize: 14, fontWeight: FontWeight.w500, color: Theme.of(context).highlightColor)),
              ],
            ),
            Icon(Icons.arrow_forward_ios,
                size: 18, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
