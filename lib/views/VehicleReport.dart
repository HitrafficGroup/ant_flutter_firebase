import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_plate_detector/views/ReportesPendientes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_plate_detector/firebase_service.dart';
class VehicleReport extends StatefulWidget {
  const VehicleReport({super.key});
  @override
  State<VehicleReport> createState() => _VehicleReportState();
}
class _VehicleReportState extends State<VehicleReport> {
  final tipo = TextEditingController();
  final observaciones = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final  args = ModalRoute.of(context)!.settings.arguments as MyVehicle;
    return Scaffold(
        appBar: AppBar(
          title: Text("Reportar al Vehiculo"),
        ),
        body: ListView(
          children: [
            SizedBox( height: 20, width: double.infinity),
            CardReport(datos_vehiculo: args.carData),
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32,top: 16),
              child: TextField(
                controller: tipo,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tipo de Multa',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32,top: 16),
              child: TextField(
                controller: observaciones,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Observaciones',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32),
              child: ElevatedButton(onPressed: () async{
                showDialog(context: context, builder: (context){
                  return Center(child: CircularProgressIndicator());
                });
                final  Map<String, dynamic> aux_data = args.carData.data() as Map<String, dynamic>;
                  aux_data['tipo'] = tipo.text;
                  aux_data['observaciones'] = observaciones.text;
                  aux_data['status'] = false;
                  await db.collection("reportes").doc(aux_data['id']).update({"status": false});
                  await agregarMulta(aux_data);
                  aux_data.forEach((clave, valor) {
                    print('$clave: $valor');
                  });

                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              }, child: Text("Cargar Reporte")),
            ),
            SizedBox(height: 10)

          ],
        ),
    );
  }
}



class CardReport extends StatelessWidget {
  final DocumentSnapshot datos_vehiculo ;
  const CardReport({super.key,required this.datos_vehiculo });

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
                image: DecorationImage(
                    image: NetworkImage(datos_vehiculo['url_imagen']),
                    fit: BoxFit.cover),
                color: Colors.white54,
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
              datos_vehiculo['placa'],
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
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
