import 'package:flutter/material.dart';

class ReportesRealizados extends StatefulWidget {
  const ReportesRealizados({super.key});

  @override
  State<ReportesRealizados> createState() => _ReportesRealizadosState();
}

class _ReportesRealizadosState extends State<ReportesRealizados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reportes Realizados"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          child: Card(
            child: InkWell(
              onTap: (){},
            ),
          ),
        ),
      ),
    );
  }
}
