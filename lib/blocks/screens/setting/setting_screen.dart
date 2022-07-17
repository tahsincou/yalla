import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
        body: Container(
          padding: const EdgeInsets.only(left: 20, top: 25, right: 16),
          child: ListView(
            children: [
              buildTitleText(context, 'Settings'),
              Divider(height: 15, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Notifications'),
              Divider(height: 20, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Subscriptions' ),
              Divider(height: 20, color: Theme.of(context).highlightColor),
              buildPreferenceItems(context, 'Delete Profile'),
              Divider(height: 20, color: Theme.of(context).highlightColor),

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

  InkWell buildPreferenceItems(BuildContext context, String name) {
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
