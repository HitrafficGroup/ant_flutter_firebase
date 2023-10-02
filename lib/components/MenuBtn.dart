import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBtn extends StatelessWidget {
  final String title;
  final IconData customIcon;
  final VoidCallback onPress;
  const MenuBtn({super.key, required this.title,required this.customIcon,required this.onPress });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(   // <-- ElevatedButton
      onPressed: onPress,
      label: Text(
          title,
        style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(255, 255, 255, 1)
        ),
      ),
      icon: Icon(
        (customIcon),
        size: 24.0,
        color: Colors.white,
      ),

      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(52, 60, 101, 1),
        shape: RoundedRectangleBorder( //to set border radius to button
            borderRadius: BorderRadius.circular(25)
        ),
        minimumSize: Size(240, 50),
      ),
    );
  }
}
