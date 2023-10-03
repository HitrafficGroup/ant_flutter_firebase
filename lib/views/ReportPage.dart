import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_plate_detector/components/CardReport.dart';
import 'package:firebase_plate_detector/firebase_service.dart';
import 'package:firebase_plate_detector/views/HomePage.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final  args = ModalRoute.of(context)!.settings.arguments as MyArguments;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
      ),
      body: ListView(
        children:<Widget> [
          CardReport(car_image: args.imagen!,matricula: args.placa ,datos_vehiculo: args.car_data ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0,right: 32.0,top: 16.0),
            child: SizedBox(
              child: TextField(
                controller: myController,
                keyboardType: TextInputType.multiline,
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
                    hintText: "Observaciones",
                    suffixIconColor: Colors.grey,

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: ElevatedButton(   // <-- ElevatedButton
              onPressed: ()async {
                showDialog(context: context, builder: (context){
                  return Center(child: CircularProgressIndicator());
                });
                final data2 =  args.car_data;
                final reportData = <String, dynamic>{
                  "marca": data2['marca'],
                  "color": data2['color'],
                  "year":  data2['year'],
                  "tipo":  data2['tipo'],
                  "descripcion":data2['descripcion'],
                  "servicio":data2['servicio'],
                  "timer": DateTime.now(),
                  "status":true,
                  "note":0,
                  "placa":args.placa,
                  "observaciones": myController.text,
                };
                await agregarReporte(reportData,args.imagen!);
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
              child: Text(
                "Cargar Reporte",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(255, 255, 255, 1)
                ),
              ),

              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(52, 60, 101, 1),
                shape: RoundedRectangleBorder( //to set border radius to button
                    borderRadius: BorderRadius.circular(25)
                ),
                minimumSize: Size(100, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    print("entramos a esta funcion");
    super.initState();
  }
}
