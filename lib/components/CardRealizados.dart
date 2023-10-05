import 'package:flutter/material.dart';
class CardRealizados extends StatelessWidget {
  final Map<String,dynamic>  multaData ;
  const CardRealizados({super.key,required this.multaData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Container(
        width: double.infinity,
        height: 100,
        child: Card(
          child: InkWell(
            child: Column(
              children: [
                Text(multaData['placa']),
                Text(multaData['marca']),
                Text(multaData['observaciones']),
                Text(multaData['tipo']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
