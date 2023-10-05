import 'package:firebase_plate_detector/components/CardRealizados.dart';
import 'package:flutter/material.dart';
import 'package:firebase_plate_detector/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ReportesRealizados extends StatefulWidget {
  const ReportesRealizados({super.key});

  @override
  State<ReportesRealizados> createState() => _ReportesRealizadosState();
}

class _ReportesRealizadosState extends State<ReportesRealizados> {
  final Map<String,dynamic> datos_defecto = {
    "hola":"mundo",
    "edad":2,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportes Realizados"),
      ),
      body: FirestoreListView()
    );
  }
}


class FirestoreListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('multas').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          final List<DocumentSnapshot> documentosFiltrados = documents.where((documento) {
            // Accede al campo 'estado' en cada documento
            final bool estado = documento['status'] ?? true; // Si el campo no existe, se asume como false

            // Filtra los documentos con estado true
            return estado == true;
          }).toList();
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final document = documents[index].data() as Map<String, dynamic>;
              return CardRealizados(multaData: document);
            },
          );
        }
      },
    );
  }

}
