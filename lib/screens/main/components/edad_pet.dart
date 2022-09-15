import 'package:admin/constants.dart';
import 'package:admin/screens/main/components/nombre_pet.dart';
import 'package:flutter/material.dart';

import 'confirmacion_pet.dart';

class SelectEdadGato extends StatelessWidget {
  SelectEdadGato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Edad de la Mascota"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
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
              Text(
                'Edad en años.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 0;
                    valueEdad = "Entre 0 y 2";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 0 y 2  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 1;
                    valueEdad = "Entre 2 y 6";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 2 y 6  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 2;
                    valueEdad = "Más de 6";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '   Más de 6   ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}

class SelectEdadPerro extends StatelessWidget {
  SelectEdadPerro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Edad de la Mascota"),
      ),
      body: Container(
        alignment: Alignment.topCenter,
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
              Text(
                'Edad en meses.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 25,),
              Material(
                
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 0;
                    valueEdad = "Entre 0 y 3";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 0 y 3  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 1;
                    valueEdad = "Entre 3 y 5";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 3 y 5  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 2;
                    valueEdad = "Entre 5 y 8";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 5 y 8  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 3;
                    valueEdad = "Entre 8 y 12";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 8 y 12  ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetEdad = 4;
                    valueEdad = "Más de 12";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NombreMascota()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '    Más de 12    ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}
