import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

import 'edad_pet.dart';

class SelectPesoGato extends StatelessWidget {
  SelectPesoGato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Peso de la Mascota"),
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
                'Peso en kg.',
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
                    offsetPeso = 0;
                    valuePeso = "Entre 2 y 5";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 2 y 5  ',
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
                    offsetPeso = 3;
                    valuePeso = "Entre 6 y 8";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 6 y 8  ',
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
                    offsetPeso = 6;
                    valuePeso = "Más de 8";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '   Más de 8   ',
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

class SelectPesoPerro extends StatelessWidget {
  SelectPesoPerro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Peso de la Mascota"),
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
                'Peso en kg.',
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
                    offsetPeso = 0;
                    valuePeso = "Entre 10 y 25";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 10 y 25  ',
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
                    offsetPeso = 5;
                    valuePeso = "Entre 25 y 35";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 25 y 35  ',
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
                    offsetPeso = 10;
                    valuePeso = "Entre 35 y 45";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '  Entre 35 y 45  ',
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
                    offsetPeso = 15;
                    valuePeso = "Más de 45";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectEdadPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      Text(
                        '    Más de 45    ',
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
