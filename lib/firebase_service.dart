import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
final storageRef = FirebaseStorage.instance.ref();
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


Future<void> agregarReporte(Map<String,dynamic> DatosReporte,File imagen_vehiculo)async{
 print("send data");

 final url = await uploadImageToFirebaseStorage(imagen_vehiculo);
 DatosReporte['url_imagen'] = url;
 var uuid = Uuid();
 var v4 = uuid.v4();
 DatosReporte['id'] = v4;
 await db.collection("reportes").doc(v4).set(DatosReporte);
}

Future<void> agregarMulta(Map<String,dynamic> DatosReporte)async{
  print("send data");
  var uuid = Uuid();
  var v4 = uuid.v4();
  DatosReporte['id'] = v4;
  await db.collection("multas").doc(v4).set(DatosReporte);
}

Future<List<Map<String,dynamic>>> leerReportesPendientes()async{
  List<Map<String, dynamic>> dataReportes = [];
  await db.collection("reportes").get().then(
        (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          final dataMap = docSnapshot.data() as Map<String, dynamic>;
          if(dataMap['note']<4){
            dataReportes.add(dataMap);
          }

        }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return dataReportes;
}

Future<String> uploadImageToFirebaseStorage(File file) async {
  try {
    // Referencia al almacenamiento de Firebase donde se almacenará el archivo
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('placas/${basename(file.path)}');
    print('placas/${basename(file.path)}');
    // Subir el archivo al almacenamiento de Firebase
    UploadTask uploadTask = storageReference.putFile(file);

    // Esperar a que la tarea de subida se complete
    await uploadTask.whenComplete(() => null);

    // Obtener la URL de descarga del archivo
    String downloadUrl = await storageReference.getDownloadURL();

    return downloadUrl;
  } catch (e) {
    print('Error al subir la imagen: $e');
    return '';
  }
}

