import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_plate_detector/components/CardPendiente.dart';
import 'package:flutter/material.dart';
import 'package:firebase_plate_detector/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';


class ReportesPendientes extends StatefulWidget {
  const ReportesPendientes({super.key});

  @override
  State<ReportesPendientes> createState() => _ReportesPendientesState();
}

class _ReportesPendientesState extends State<ReportesPendientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportes Pendientes"),
      ),
      body: FirestoreListView()
    );
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
              // Aquí puedes acceder a los campos de tu documento y mostrarlos en un Text.
              final texto = "data";
              return CardPendiente();
            },
          );
        }
      },
    );
  }
}
