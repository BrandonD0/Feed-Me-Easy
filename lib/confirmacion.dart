import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Confirmacion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Información de Entrega"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Text(
              "¡La comida ha sido entregada satisfactoriamente!\n\nPuede consultar las veces y la cantidad de comida que ha recibido su mascota a través de la opción 'Reportes'.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(50)),  
              ),
              child: TextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                child: Text(
                  "Regresar",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}