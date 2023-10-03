import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_plate_detector/components/CardPendiente.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class ReportesPendientes extends StatefulWidget {
  const ReportesPendientes({super.key});

  @override
  State<ReportesPendientes> createState() => _ReportesPendientesState();
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
    // Iniciar el temporizador que aumenta el contador cada segundo
    timer = Timer.periodic(Duration(seconds: 70), (timer) {
      print("este mensaje se actualizara cada 3 segundos");
    });
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
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index];

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
              );
            },
          );
        }
      },
    );
  }

}
