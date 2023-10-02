import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CardReports extends StatelessWidget {
  const CardReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 280,
      height: 90,
      decoration: BoxDecoration(
          color:  Color(0xffff6457),
          borderRadius:  BorderRadius.circular(8)
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Activos",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 0.58)
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text("2",
                style: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(255, 255, 255, 1)
                ),
              ),
            ],
          ),
          Container(
            width: 2,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Reportes",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 0.58)
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text("4",
                style: GoogleFonts.inter(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(255, 255, 255, 1)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
