//import 'dart:ffi';
//import 'dart:convert';

import 'dart:io';

import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/email.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Backend.dart';

const Duration espera = Duration(seconds: 3);


void main() {
  //var nombreMascota;
  runApp(MyApp());
}


// ignore: must_be_immutable
class Menu extends StatelessWidget {
  var username;
  var namePet;
  
  Menu({
    @required this.username,
    @required this.namePet,
  });

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 1500)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed Me Easy',
      theme: ThemeData.dark().copyWith(
        
        scaffoldBackgroundColor: bgColor,
        
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
        ],
        child: MainScreen(name: username, nameMascota: namePet),
      ),
      builder: EasyLoading.init(),
    );
  }

  
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed Me Easy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Inicio(),
      builder: EasyLoading.init(),
    );
  }
}

class CrearCuentaStateful extends StatefulWidget {
  const CrearCuentaStateful ({ Key? key }) : super(key: key);
  @override
  CrearCuenta createState() => CrearCuenta();
}

// ignore: must_be_immutable
class CrearCuenta extends State<CrearCuentaStateful> {
  
  static const TextSize  = 20.00;
  late Future<AlbumNew> futureAlbum;
  final controller_email = TextEditingController();
  final controller_nom   = TextEditingController();
  final controller_con   = TextEditingController();
  final controller_cco   = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return MaterialApp(
      title: 'Feed Me Easy - Crear Cuenta',
      builder: EasyLoading.init(),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView (
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                _logo(),
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: false,
                    controller: controller_email,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Correo electrónico",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.mail_outline_rounded, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                //_formulario(Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)), "Nombre de Usuario", false),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: false,
                    controller: controller_nom,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Nombre de Usuario",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                //_formulario(Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)), "Contraseña", true),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    controller: controller_con,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
                //_formulario(Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)), "Confirmar Contraseña", true),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    controller: controller_cco,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Confirmar Contraseña",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(50)),  
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (controller_cco.text == controller_con.text && controller_nom.text != "" && controller_con.text != "" && controller_email.text != "" && controller_cco.text != "") {
                        await fetchNew(controller_email.text, controller_nom.text, controller_con.text);
                        if (globalNew == 1) {
                          globalNew = 0;
                          await sendEmail(name: controller_nom.text, email: controller_email.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        } else {
                          EasyLoading.showError('Los datos ingresados parece que ya han sido registrados con anterioridad.');
                        }
                      } else {
                        EasyLoading.showError('Debe ingresar valores en todos los campos y las contraseñas deben coincidir.');
                      }
                    },
                    child: Text(
                      "Crear Cuenta",
                      style: TextStyle(
                          fontSize: TextSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 3,
                        
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(50)),  
                  ),
                  child: TextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    child: Text(
                      "Regresar",
                      style: TextStyle(
                          fontSize: TextSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 3,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio ({ Key? key }) : super(key: key);
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {

  String savedName = ''; 
  late Future<AlbumCheck> futureAlbum;
  final controller_nom = TextEditingController();
  final controller_con = TextEditingController();
  //TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  
  // Retrieve the saved name if it exists
 
  static const TextSize = 20.00;
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return MaterialApp(
      title: "Feed Me Easy",
      builder: EasyLoading.init(),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                SizedBox(height: 10,),
                _logo(),
                SizedBox(height: 30,),

                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //_formulario(Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)), "Nombre de Usuario", false),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: false,
                    controller: controller_nom,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Nombre de Usuario",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //_formulario(Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)), "Contraseña", true),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 25,
                        offset: Offset(0, 5),
                        spreadRadius: -25,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  child: TextField(
                    obscureText: true,
                    controller: controller_con,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000912),
                      
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 25),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(
                        color: Color(0xffA6B0BD),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock_outline, size: 30, color: Color(0xffA6B0BD)),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 75,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(50)),  
                  ),
                  child: TextButton(
                    onPressed: () async {
                      //EasyLoading.show(status: 'Espere un momento por favor...');
                      if (controller_nom.text != "" && controller_con.text != "") {
                        await fetchCheck(controller_nom.text, controller_con.text);
                        if (globalCheck == 1 && ok == 1 && ok_getPet == 1 && ok_productkey == 1) {
                          //EasyLoading.dismiss();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu(username: controller_nom.text, namePet: namePet,)),
                          );
                        } else {
                          //EasyLoading.dismiss();
                          EasyLoading.showError('Usuario y/o contraseña no válidos.');
                        }
                      } else {
                        EasyLoading.showError('Debe ingresar su usuario y contraseña.');
                      }           
                    },
                    child: Text(
                      "Iniciar sesión",
                      style: TextStyle(
                          fontSize: TextSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 3,
                        
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(50)),  
                  ),
                  child: TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CrearCuentaStateful()),
                      )
                    },
                    child: Text(
                      "Crear Cuenta",
                      style: TextStyle(
                          fontSize: TextSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 3,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}

/*Widget _formulario(Icon prefixIcon, String hintText, bool isPassword) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 25,
          offset: Offset(0, 5),
          spreadRadius: -25,
        ),
      ],
    ),
    margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
    child: TextField(
      obscureText: isPassword,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Color(0xff000912),
        
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 25),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xffA6B0BD),
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints(
          minWidth: 75,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    ),
  );
}*/

Widget _logo() {
  return Container(
    child: Row(
      mainAxisAlignment : MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(
          "assets/images/Logo.png",
          height: 300,
          width: 350,
          alignment: Alignment.center,
        ),
      ],
    ),
  );
}



