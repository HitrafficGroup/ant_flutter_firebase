import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CardPendiente extends StatelessWidget {
  final String matricula;
  final String url_image;
  final String marca;
  final String tipo;
  final String timer;
  final int note;
  final VoidCallback onPress;
  const CardPendiente({super.key, required this.url_image, required this.matricula,required this.marca,required this.tipo,required this.timer, required this.note , required this.onPress });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 20.0),
      child: Container(
        height: 110,
        child: Card(
          child: InkWell(
            onTap: onPress,
            child: Row(
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.grey,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  NoteText(note: note),
                                  Container(
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
                                  marca,
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
                                  Expanded(
                                    child: Text(
                                       tipo,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.inter(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                      )
                                    ),
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
                                  Expanded(child: Text(timer, textAlign: TextAlign.right )),
                                ],
                              ),
                            )
                          ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
class NoteText extends StatelessWidget {
  final int note;
  const NoteText({super.key,required this.note});
  @override
  Widget build(BuildContext context) {
    if(note == 0){
      return const Text("+7 min",
      style: TextStyle(
        color: Colors.lightGreen,
      ),);
    }else if( note ==1){
      return const Text("+5 min",
        style: TextStyle(
          color: Colors.amber,
        ),);
    }else if( note ==2){
      return const Text("+2 min",
        style: TextStyle(
          color: Colors.red,
        ),);
    } else{
      return const Text("PROCESAR",
        style: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),);
    }

  }
}

