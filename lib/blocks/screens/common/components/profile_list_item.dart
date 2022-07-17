import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({Key? key,
    required this.icon,
    required this.text,
    required this.routeName,
    this.hasNavigation= true
  }) : super(key: key);
  final IconData icon;
  final String text;
  final String routeName;
  final bool hasNavigation;

  @override
  Widget build(BuildContext context) {
var kSpacingUnit = MediaQuery.of(context).size;
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 0).copyWith(
          bottom: 10
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, routeName);
        },
        child: Row(
          children: [
            Icon(this.icon,
                size:25,
                color:Colors.lightBlue),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,
            color: Theme.of(context).scaffoldBackgroundColor)) ,
            const Spacer(),
            if(hasNavigation)
              Icon(Icons.arrow_right,size: kSpacingUnit.height *.05,color: Colors.white)
          ],
        ),
      ),
    );
  }
}
