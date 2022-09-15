import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'raza_pet.dart';

class SelectClase extends StatelessWidget {
  SelectClase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Clase de la Mascota"),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.all(defaultPadding),
                alignment: Alignment.center,
                icon: Image.asset(
                  "assets/images/perro.jpg",
                  height: 500,
                  width: 350,
                  alignment: Alignment.center,
                ),
                iconSize: 300,
                onPressed: () {
                  // aqui el codigo de offset para la tabla
                  idClase = "1";
                  offsetClase = 10;
                  valueClase =  "Perro";
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectRazaPerro()),
                  );
                },
              ),
              IconButton(
                padding: EdgeInsets.all(defaultPadding),
                alignment: Alignment.center,
                icon: Image.asset(
                  "assets/images/gato.png",
                  height: 500,
                  width: 350,
                  alignment: Alignment.center,
                ),
                iconSize: 300,
                onPressed: () {
                  // aqui el codigo de offset para la tabla
                  idClase = "2";
                  offsetClase = 1;
                  valueClase =  "Gato";
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectRazaGato()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  } 
}
