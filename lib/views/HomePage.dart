import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_plate_detector/components/CardReports.dart';
import 'package:firebase_plate_detector/components/MenuBtn.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class MyArguments {
  final String placa;
  File? imagen;
  Map<String, dynamic> car_data;

  MyArguments(this.placa, this.imagen,this.car_data);
}



class _HomePageState extends State<HomePage> {
  File? carFoto;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 247, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 53,
              width: double.infinity,
            ),
            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(67.5),
                color: Colors.white54,
                image:  DecorationImage(
                  image: ExactAssetImage('assets/profile.jpg'),
                  fit: BoxFit.fitWidth,
                  ),
                  border: Border.all(
                    color: Color.fromRGBO(217, 220, 233, 1),
                    width: 5,
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
            SizedBox(
              height: 9,
              width: double.infinity,
            ),
            Text(
              'Ana Doe',
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 9),
            Text(
              'Tarifador',
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color.fromRGBO(60, 75, 103, 1)
              ),
            ),
            SizedBox(height: 9),
            CardReports(),
            SizedBox(height: 18),
            MenuBtn(title: "Capturar Placa",customIcon: Icons.camera_alt,onPress: (){
              getImage();
            }),
            SizedBox(height: 18),
            MenuBtn(title: "Reportes Pendientes",customIcon: Icons.assignment_late_rounded,
                onPress: (){
                  Navigator.pushNamed(context, "/pendientes");
                }
            ),
            SizedBox(height: 18),
            MenuBtn(title: "Reportes Realizados",customIcon: Icons.assignment_turned_in,
                onPress: (){Navigator.pushNamed(context, "/realizados");

                }
            ),


          ],
        ),
      ),
    );
  }


  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Placa Capturada'),
          content:  TextField(
            controller: myController,
            textCapitalization: TextCapitalization.characters,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Continuar'),
              onPressed: () async{
                String result = myController.text.replaceAll('-', '');
                final apiData = await fetchData(result);
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/report", arguments: MyArguments(myController.text, carFoto,apiData));
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void getImage() async{

    showDialog(context: context, builder: (context){
      return Center(child: CircularProgressIndicator());
    });
    final photo = await ImagePicker().pickImage(source: ImageSource.camera);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    if(photo?.path != null){

        final inputImage = InputImage.fromFilePath(photo!.path);
        final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
        for (TextBlock block in recognizedText.blocks) {
          final String text = block.text;
          if(text.length >= 7 && text.length <= 8){
            if(text != "ECUADOR"|| text != "ECUAD0R" || text != "ecuador" || text != "Ecuador"){
              if (text.contains("-")) {
                setState(() {
                  myController.text = text;
                  carFoto = File(photo.path);
                });
                break;
              }

            }

          }

        }

        textRecognizer.close();
        Navigator.of(context).pop();
        _dialogBuilder(context);
      }

  }
  Future<Map<String, dynamic>> fetchData(String param1) async {
    final response = await http.get(Uri.parse('http://3.146.178.204:3000/data_ant?placa=$param1'));

    if (response.statusCode == 200) {
      // Si la solicitud es exitosa (código de estado 200), analiza la respuesta JSON.
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // Si la solicitud falla, puedes manejar el error aquí.
      throw Exception('Error en la solicitud: ${response.statusCode}');
    }
  }



}

