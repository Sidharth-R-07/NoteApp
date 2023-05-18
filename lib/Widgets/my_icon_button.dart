import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/Theme/my_theme.dart';

class MyIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;

  final String? lable;
  const MyIconButton({
    super.key,
    this.lable,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: MyTheme.backgroundColor.withOpacity(.10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: MyTheme.iconColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(lable ?? '',
              style: GoogleFonts.lato(fontSize: 22, color: Colors.white))
        ]),
      ),
    );
  }
}
