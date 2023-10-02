import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_plate_detector/components/LoginBtn.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool seePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(215, 218, 240, 1.0),
      body: ListView(
        children: [
          SizedBox(
            height: 5,
            width: double.infinity,
          ),
          Container(
            height: 155,
            width: 155,
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: ExactAssetImage('assets/logo3.png'),
              fit: BoxFit.fitHeight,
            ),
          )
          ),
          Text(
            'Iniciar Sesion',
            style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color.fromRGBO(60, 75, 113, 1),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Text(
            'Digita tu usuario y contraseña',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(112, 114, 115, 1.0),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'en los campos indicados',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Color.fromRGBO(112, 114, 115, 1.0),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  border:  OutlineInputBorder(
                    borderSide: const BorderSide(width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  suffixIconColor: Colors.grey,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  suffixIcon: Icon(Icons.person)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 0.0,bottom: 16),
            child: TextField(
                obscureText: seePass,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  suffixIconColor: Colors.grey,
                  suffixIcon: GestureDetector(
                    onTap:seePassword,
                    child: Icon(
                         seePass? Icons.visibility_off :Icons.remove_red_eye
                    ),
                  )
              ),
            ),
          ),
          SizedBox(
            height: 8,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 64.0,right: 64.0),
            child: LoginBtn(onPressed: (){Navigator.pushNamed(context, "/home");},),
          )
        ],
      ),
    );
  }
  void seePassword(){
    setState(() {
      seePass = !seePass;
    });
  }
}
