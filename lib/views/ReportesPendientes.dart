import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_plate_detector/components/CardPendiente.dart';
import 'package:firebase_plate_detector/firebase_service.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ReportesPendientes extends StatefulWidget {
  const ReportesPendientes({super.key});

  @override
  State<ReportesPendientes> createState() => _ReportesPendientesState();
}
class MyVehicle {
  DocumentSnapshot carData;
  MyVehicle(this.carData);
}

class _ReportesPendientesState extends State<ReportesPendientes> {
  late Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportes Pendientes"),
      ),
      body: FirestoreListView()
    );
  }
  @override
  void initState() {
    super.initState();
    procesarReportes();
    // Iniciar el temporizador que ejecuta la funcion que se encuentre dentro
    timer = Timer.periodic(Duration(seconds: 70), (timer) {
      procesarReportes();
    });
  }
  void procesarReportes() async{
    final  List<Map<String,dynamic>> dataReports = await leerReportesPendientes() as List<Map<String, dynamic>>;
    Timestamp timestamp = Timestamp.fromDate(DateTime.now());
    DateTime currentDate = timestamp.toDate();
      for (int i = 0; i < dataReports.length; i++) {
        Map<String, dynamic> _data = dataReports[i];
        final DateTime fecha = _data['timer'].toDate();
        if(fecha.day == currentDate.day ){
            if(fecha.hour == currentDate.hour){

                final delta_time = currentDate.minute - fecha.minute;
                if(delta_time <= 3){
                  print("note = 0");
                  db.collection("reportes").doc(_data['id']).update({"note": 0});
                }else if(delta_time > 3 && delta_time <=5){
                  print("note = 1");
                  db.collection("reportes").doc(_data['id']).update({"note": 1});
                }else if(delta_time > 5 && delta_time <=7){
                  db.collection("reportes").doc(_data['id']).update({"note": 2});
                }else {
                  print("note = 4");
                  db.collection("reportes").doc(_data['id']).update({"note": 4});
                }
            }else{
              db.collection("reportes").doc(_data['id']).update({"note": 4});
            }
        }else{
          db.collection("reportes").doc(_data['id']).update({"note": 4});
        }

      }
  }
  @override
  void dispose() {
    // Detener el temporizador cuando se deshaga del widget
    timer.cancel();
    super.dispose();
  }
}

class FirestoreListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('reportes').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          final List<DocumentSnapshot> documentosFiltrados = documents.where((documento) {
            // Accede al campo 'estado' en cada documento
            final bool estado = documento['status'] ?? false; // Si el campo no existe, se asume como false

            // Filtra los documentos con estado true
            return estado == true;
          }).toList();
          return ListView.builder(
            itemCount: documentosFiltrados.length,
            itemBuilder: (context, index) {
              final document = documentosFiltrados[index];

              DateTime dateTime = document['timer'].toDate();
              int hour = dateTime.hour;
              int minute = dateTime.minute;
              int second = dateTime.second;
              final custom_time = '$hour:$minute:$second';
              // Aquí puedes acceder a los campos de tu documento y mostrarlos en un Text.

              return CardPendiente(
                url_image: document['url_imagen'],
                matricula: document['placa'],
                marca:document['marca'] ,
                timer: custom_time,
                tipo: document['tipo'],
                note: document['note'],
                onPress: (){
                  //Navigator.pushNamed(context, "/vehicle_report");
                 Navigator.pushNamed(context, "/vehicle_report", arguments: MyVehicle(document));
                },
              );
            },
          );
        }
      },
    );
  }

}
