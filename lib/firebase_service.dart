import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Future<void> agregarDatos() async{
  // Create a new user with a first and last name

    final user = <String, dynamic>{
      "first": "rocklion",
      "last": "diaz",
      "born": 1999
    };

  // Add a new document with a generated ID
    await db.collection("users").add(user);
}


Future<void> agregarReporte(Map<String,dynamic> DatosReporte)async{
 print("send data");
 await db.collection("reportes").add(DatosReporte);
}

