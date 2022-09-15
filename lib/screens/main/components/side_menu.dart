import 'package:admin/constants.dart';
import 'package:admin/screens/main/components/add_pet.dart';
import 'package:admin/screens/main/components/peso_pet.dart';
//import 'package:admin/controllers/MenuController.dart';
//import 'package:admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
//import 'package:select_form_field/select_form_field.dart';

import '../../../Backend.dart';
import '../../../main.dart';
//import '../../../responsive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu ({ Key? key }) : super(key: key);
  @override
  SideMenuLess createState() => SideMenuLess();
}

class SideMenuLess extends State<SideMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ok_getID = 0;
    return Drawer(
      child: ListView(
        
        children: <Widget>[
          new Container(
            child: new DrawerHeader(
              child: Container(
                child: Image.asset("assets/images/Logo.png"),
                color: secondaryColor,
              ),
            ),
          ),

          Options(
            title: "Mascota",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () async {
              await fetchGetInfo(nomUsuario);
              if (ok_getInfo == 1) {
                ok_getInfo = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pet()),
                );
              }
            },
          ),

          Options(
            title: "Reportes",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () async {
              await fetchGetID(nomUsuario, namePet);
              if (ok_getID == 1) {
                ok_getID = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Reports()),
                );
              }
            },
          ),

          Options(
            title: "Comida",
            svgSrc: "assets/icons/menu_task.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Food()),
              )
            },
          ),

          Options(
            title: "Clave de Producto",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductKey()),
              )
            },
          ),

          Options(
            title: "Cerrar sesión",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () => {
              globalCheck = 0, ok = 0, ok_getPet = 0, ok_getInfo = 0,
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Inicio()),
              )
            },
          ),

        ],
      ),
    );
  }
}

class Data {
  final double cantidad;
  final String fecha;
  Data ({
    required this.cantidad,
    required this.fecha,
  });
}


// ignore: must_be_immutable
class Reports extends StatelessWidget {
  List<Data> data = [];
  Reports({Key? key}) : super(key: key);

  List<ColumnSeries<Data, String>> _getRoundedColumnSeries() {
    double currentValue;
    for (int i = 0; i < ReportData.length; i=i+2) {
      currentValue = double.parse(ReportData[i].toString());
      //minvalue = (currentValue < minvalue) ? currentValue : minvalue;
      maxValue = (currentValue > maxValue) ? currentValue : maxValue;
      data.add(Data(cantidad: double.parse(ReportData[i].toString()), fecha: ReportData[i+1].toString().substring(0,10)));
    }
    final List<Data> chartData = data;
    return <ColumnSeries<Data, String>>[
      ColumnSeries<Data, String>(
        width: 0.9,
        dataLabelSettings: const DataLabelSettings(
            isVisible: true, labelAlignment: ChartDataLabelAlignment.top),
        dataSource: chartData,

        /// If we set the border radius value for column series,
        /// then the series will appear as rounder corner.
        borderRadius: BorderRadius.circular(10),
        xValueMapper: (Data sales, _) => sales.fecha,
        yValueMapper: (Data sales, _) => sales.cantidad,
      ),
    ];
  }

  Widget parseData () {
    try {
      return SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(
            text: ''),
        primaryXAxis: CategoryAxis(
          labelStyle: const TextStyle(color: Colors.white),
          axisLine: const AxisLine(width: 0),
          labelPosition: ChartDataLabelPosition.inside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(isVisible: false, minimum: 0, maximum: maxValue + 50),
        series: _getRoundedColumnSeries(),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: false,
          format: 'point.x : point.y gramos',
          header: ''
        ),
      );
    } catch (err) {
      return Text(
        "Algo ha ido mal al conseguir los datos. Esto puede ser por un error de conexión o porque la mascota aún no posee reportes de comida.",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ok_getID = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Reportes de Comida"),
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
              const SizedBox(height: 20,),
              if (ok_getStatusReport == 0)
                Text(
                  "No hay reportes para la mascota " + namePet,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              const SizedBox(height: 20,),
              if (ok_getStatusReport == 1)
                Text(
                  "Reportes para la mascota " + namePet + ".\n\n"
                  + 'La parte inferior de la barra muestra la fecha en que se le dio de comer a ' + namePet 
                  + 'y la parte superior muestra la cantidad en gramos servida (si fueron muchas, aparecerán todos los valores).',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              const SizedBox(height: 20,),
              if (ok_getStatusReport == 1)
                parseData(),
              const SizedBox(height: 60,),
            ],
          ),      
        ),
      ),
    );
  }
}

class Food extends StatelessWidget {
  final controllerPorcion = TextEditingController();
  Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Porciones de comida"),
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
              const SizedBox(height: 20,),
              const Text(
                "Establecer porciones de comida. Si no se coloca nada o se borra la porción registrada, se usará una porción de comida automática.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              if (useRecommend) 
                const Text(
                  "\n\nUsando porción recomendada.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              if (!useRecommend) 
                const Text(
                  "\n\nUsando porción customizada.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              
              const SizedBox(height: 50,),
              ////////////////////////////////////   Porción de comida manual   ////////////////////////////////////////////////
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                controller: controllerPorcion,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Porción de comida en gramos",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.fastfood_rounded, color: Colors.black,),
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
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.add_box_rounded),
                        onPressed: () {
                          if (controllerPorcion.text != "") {
                            useRecommend = false;
                            cantPorcionRespaldo = cantPorcion;
                            cantPorcion = controllerPorcion.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
                            );
                          } else {
                            EasyLoading.showError('Debe ingresar una porción de comida válida.');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.green;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30,),
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.cancel),
                        onPressed: () {
                          useRecommend = true;
                          if (cantPorcionRespaldo != "")
                            cantPorcion = cantPorcionRespaldo;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.purple;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),      
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AddPet extends StatelessWidget {
  AddPet({Key? key}) : super(key: key);
  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Agregar Mascota"),
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
              const SizedBox(height: 20,),
              ////////////////////////////////////   Nombre de Mascota   ////////////////////////////////////////////////
              TextField(
                obscureText: false,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Nombre de la mascota",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.pets, color: Colors.black,),
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
              const SizedBox(height: 20,),

              ////////////////////////////////////   Peso de Mascota   ////////////////////////////////////////////////
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Peso de la mascota en kg",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.monitor_weight_outlined, color: Colors.black,),
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
              const SizedBox(height: 20,),
              ////////////////////////////////////   Tipo de Mascota   ////////////////////////////////////////////////
              TextField(
                obscureText: false,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Tipo de Mascota",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.keyboard_control_outlined, color: Colors.black,),
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
              const SizedBox(height: 20,),

              ////////////////////////////////////   Raza de Mascota   ////////////////////////////////////////////////
              TextField(
                obscureText: false,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Raza de Mascota",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.groups, color: Colors.black,),
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
              const SizedBox(height: 20,),

              ////////////////////////////////////   Edad de Mascota   ////////////////////////////////////////////////
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Edad de Mascota",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.format_list_numbered, color: Colors.black,),
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
              const SizedBox(height: 20,),

              ////////////////////////////////////////////////////////////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.add_box_rounded),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Pet()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.green;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30,),
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.cancel),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.purple;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  } 
}

class Pet extends StatelessWidget {
  const Pet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Información de Mascota"),
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
              "Nombre:   " + namePet,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 25,),
            Text(
              "Clase:       " + info_clase,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "Raza:       " + info_raza,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              "Peso:       " + info_peso + " kg",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 20,),
            if (info_clase.contains("Perro"))
              Text(
                "Edad:       " + info_edad + " meses",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
            if (info_clase.contains("Gato"))
              Text(
                "Edad:       " + info_edad + " años",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
            if (info_clase.contains("NO DEFINIDO"))
              Text(
                "Edad:       " + info_edad + " años",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                    child: ElevatedButton(
                      child: const Icon(Icons.add_box_rounded),
                      onPressed: () {
                        if (namePet == "NO DEFINIDO") {
                          isNewPet = true;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SelectClase()),
                          );
                        }
                        else 
                          EasyLoading.showError('Ya se tiene una mascota ingresada.');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                              return Colors.green;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                    child: ElevatedButton(
                      child: const Icon(Icons.list_alt_rounded),
                      onPressed: () {
                        if (namePet != "NO DEFINIDO") {
                          isNewPet = false;
                          if (info_clase == "Gato")
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SelectPesoGato()),
                            );
                          else 
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SelectPesoPerro()),
                            );
                        }
                        else 
                          EasyLoading.showError('Para modificar una mascota, primero se debe ingresar una.');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                              return Colors.orange;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 100,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                    child: ElevatedButton(
                      child: const Icon(Icons.cancel),
                      onPressed: () async {
                        await fetchDelete(nomUsuario, namePet);
                        if (ok_delete == 1) {
                          namePet = "NO DEFINIDO";
                          ok_delete = 0; ok_getInfo = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
                          );
                        } else {
                          EasyLoading.showError('Ha ocurrido un error al eliminar su mascota.');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                              return Colors.purple;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  } 
}

class ProductKey extends StatelessWidget {
  final controllerKey = TextEditingController();
  ProductKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Clave de Producto"),
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
              const SizedBox(height: 20,),
              const Text(
                "Ejemplo de Clave: 12345",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 50,),
              if (productKey == "")
                Text(
                  "No se tiene producto asociado",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              if (productKey != "")
                Text(
                  "Se tiene asociado el producto : " + productKey,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              const SizedBox(height: 50,),
              ////////////////////////////////////   Clave de producto   ////////////////////////////////////////////////
              TextField(
                keyboardType: TextInputType.number,
                obscureText: false,
                controller: controllerKey,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Clave de Producto",
                  hintStyle: TextStyle(
                    color: Color(0xffA6B0BD),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
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
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.add_box_rounded),
                        onPressed: () async {
                          if (controllerKey.text.toString().length >= 5) {
                            await fetchAddProduct(nomUsuario, controllerKey.text);
                            if (ok_newProduct == 1) {
                              productKey = controllerKey.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
                              );
                            } else {
                              EasyLoading.showError('Este producto no se le puede asignar.');
                            }    
                          } else {
                            EasyLoading.showError('Ingrese un código válido.');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.green;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30,),
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.cancel),
                        onPressed: () async {
                          if (productKey != "") {
                            await fetchDeleteProduct(nomUsuario, productKey);
                            if (ok_deleteProduct == 1)
                              ok_deleteProduct = 0;
                              productKey = "";
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
                              );
                          } else {
                            EasyLoading.showError('No hay producto para eliminar.');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                                return Colors.purple;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),      
        ),
      ),
    );
  }
}


class Options extends StatelessWidget {
  const Options({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.blue,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

