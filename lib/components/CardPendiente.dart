import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CardPendiente extends StatelessWidget {
  final String matricula;
  final String url_image;
  const CardPendiente({super.key, required this.url_image, required this.matricula });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
      child: Container(
        height: 110,
        child: Row(
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(url_image), fit: BoxFit.cover,
                )
                ),
            ),
            Expanded(
                child: Container(
                  height: 110,
                  child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.bus_alert,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16)
                              ),
                            ),]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                          child: Row(
                            children: <Widget>[Text(
                              'Hyundai',
                              style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF9853)
                              ),
                              textAlign: TextAlign.left,
                            ),
                      ]
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Doble Cabina 4x4',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                )
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only( left: 8.0, right: 8.0),
                          child: Row(
                            children: [
                              Expanded(child: Text(matricula)),
                              Container(
                                width: 2,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.black
                                ),
                              ),
                              Expanded(child: Text("10:32am", textAlign: TextAlign.right )),
                            ],
                          ),
                        )
                      ],
                  ),
                )
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 10
              )
            ]
        ),
      ),
    );
  }
}
