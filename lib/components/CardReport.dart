
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:io';
class CardReport extends StatelessWidget {
  final File car_image ;
  final String matricula ;
  final Map<String,dynamic> datos_vehiculo ;
  const CardReport({super.key, required this.car_image, required this.matricula,required this.datos_vehiculo });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(left: 32,right: 32,top: 32),
      child: Container(

        decoration: BoxDecoration(
            color: Color.fromRGBO(1, 26, 82, 1),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            SizedBox(height: 25),
            Container(
              height: 135,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(67.5),
                color: Colors.white54,
                image:  DecorationImage(
                  image: FileImage(car_image),
                  fit: BoxFit.fitWidth,
                ),

                boxShadow:  [
                  BoxShadow(
                    color:  Color(0x3f000000),
                    offset:  Offset(0, 4),
                    blurRadius:  2,
                  ),
                ],

              ),
            ),
            SizedBox(height: 25),
            Text(
              matricula,
              style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 16.0,right: 16.0),
              child: Container(
                height: 2,
                decoration: BoxDecoration(
                    color: Color(0xFFCAC1C1)
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Marca',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53658B)
                    ),
                  ),
                  Spacer(),
                  Text(datos_vehiculo['marca'],
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Color',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53658B)
                    ),
                  ),
                  Spacer(),
                  Text(datos_vehiculo['color'],
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Año',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53658B)
                    ),
                  ),
                  Spacer(),
                  Text(datos_vehiculo['year'],
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Tipo',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53658B)
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(
                      datos_vehiculo['descripcion'],
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25.0,bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text('Servicio',
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF53658B)
                    ),
                  ),
                  Spacer(),
                  Text(datos_vehiculo['servicio'],
                    style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Agregar Imagenes'), // <-- Text
                  SizedBox(
                    width: 5,
                  ),
                  Icon( // <-- Icon
                    Icons.add_a_photo_outlined,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
