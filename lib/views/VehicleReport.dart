import 'package:flutter/material.dart';

class VehicleReport extends StatefulWidget {
  const VehicleReport({super.key});

  @override
  State<VehicleReport> createState() => _VehicleReportState();
}

class _VehicleReportState extends State<VehicleReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reportar al Vehiculo"),
        ),
        body: Column(
          children: [
            SizedBox( height: 20, width: double.infinity)
          ],
        ),
    );
  }
}
