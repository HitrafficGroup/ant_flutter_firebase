import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginBtn extends StatelessWidget {
  final VoidCallback onPressed;
  const LoginBtn({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(   // <-- ElevatedButton
      onPressed: onPressed,
      child: Text(
        "Login",
        style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(255, 255, 255, 1)
        ),
      ),


      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(52, 60, 101, 1),
        shape: RoundedRectangleBorder( //to set border radius to button
            borderRadius: BorderRadius.circular(25)
        ),
        minimumSize: Size(100, 50),
      ),
    );
  }
}
