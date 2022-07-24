import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.label,
    required this.onPress,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: sixthColor,
            // boxShadow: const [
            //   BoxShadow(
            //       color: Colors.grey,
            //       offset: Offset(1, 1),
            //       spreadRadius: 1,
            //       blurRadius: 1)
            // ],
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(icon, color: secondColor),
          trailing: Icon(Icons.chevron_right, color: secondColor),
          title: Text(
            label,
            style: TextStyle(color: secondColor),
          ),
        ),
      ),
    );
  }
}
