import 'package:admin/constants.dart';
import 'package:admin/screens/main/components/peso_pet.dart';
import 'package:flutter/material.dart';

class SelectRazaGato extends StatelessWidget {
  SelectRazaGato({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Raza de la Mascota"),
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
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetRaza = 1;
                    valueRaza = "Común Europeo";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/europeo.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Común Europeo',
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
                    offsetRaza = 3;
                    valueRaza = "Siamés";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/siames.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Siamés',
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
                    offsetRaza = 2;
                    valueRaza = "Persa";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/persa.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Persa',
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
                    offsetRaza = 1;
                    valueRaza = "Otro";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoGato()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/muchosGatos.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Otro',
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

class SelectRazaPerro extends StatelessWidget {
  SelectRazaPerro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Seleccionar Raza de la Mascota"),
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
              Material(
                color: primaryColor,
                elevation: 8,
                borderRadius: BorderRadius.circular(28),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    offsetRaza = 4;
                    valueRaza = "Pastor Alemán";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/aleman.png",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Pastor Alemán',
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
                    offsetRaza = 6;
                    valueRaza = "Caniche";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/caniche.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Caniche',
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
                    offsetRaza = 7;
                    valueRaza = "Dálmata";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/dalmata.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Dálmata',
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
                    offsetRaza = 5;
                    valueRaza = "Labrador";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/labrador.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Labrador',
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
                    offsetRaza = 8;
                    valueRaza = "Pitbull";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/pitbull.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Pitbull',
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
                    offsetRaza = 4;
                    valueRaza = "Otro";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/muchosPerros.jpg",
                        height: 250,
                        width: 350,
                        alignment: Alignment.center,
                      ),
                      Text(
                        'Otro',
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
