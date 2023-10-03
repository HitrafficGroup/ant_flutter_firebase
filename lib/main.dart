import 'package:firebase_plate_detector/views/ReportesPendientes.dart';
import 'package:firebase_plate_detector/views/ReportesRealizados.dart';
import 'package:firebase_plate_detector/views/VehicleReport.dart';
import 'package:flutter/material.dart';
import 'package:firebase_plate_detector/views/HomePage.dart';
import 'package:firebase_plate_detector/views/LoginPage.dart';
import 'package:firebase_plate_detector/views/ReportPage.dart';
import 'color_schemes.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/':(context) => LoginPage(),
        '/home':(context) => HomePage(),
        '/report':(context) => ReportPage(),
        '/pendientes':(context) => ReportesPendientes(),
        '/realizados':(context) => ReportesRealizados(),
        '/vehicle_report':(context) => VehicleReport(),
      },
    );
  }
}
