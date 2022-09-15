import 'package:admin/constants.dart';
import 'package:admin/screens/main/components/confirmacion_pet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../Backend.dart';
import '../../../main.dart';

class NombreMascota extends StatelessWidget {
  final controllerNombre = TextEditingController();
  NombreMascota({Key? key}) : super(key: key);

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
        title: const Text("Nombre de la Mascota y Confirmacion"),
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
              Text(
                "Clase:       " + valueClase,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Raza:       " + valueRaza,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "Peso:       " + valuePeso + " kg",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 20,),
              if (valueClase.contains("Perro"))
                Text(
                  "Edad:       " + valueEdad + " meses",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              if (valueClase.contains("Gato"))
                Text(
                  "Edad:       " + valueEdad + " años",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                  ),
                ),
              const SizedBox(height: 50,),
              const Text(
                "Escriba el nombre de la mascota. Este campo no puede estar vacío.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 50,),
              ////////////////////////////////////   Nombre de Mascota   ////////////////////////////////////////////////
              TextField(
                obscureText: false,
                controller: controllerNombre,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000912),
                  
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 25),
                  hintText: "Nombre de Mascota",
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50)),  
                ),
                child: TextButton(
                  onPressed: () async {
                    if (controllerNombre.text != "") {
                      valueNombre = controllerNombre.text;
                      if (isNewPet) {
                        await fetchAddPet(nomUsuario, valueNombre, idClase, offsetRaza.toString(), (offsetClase + offsetEdad + offsetPeso).toString());
                        if (ok_addPet == 1 && ok_getPet == 1) {
                          ok_addPet = 0; ok_getPet = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: valueNombre,)),
                          );
                        } else {
                          EasyLoading.showError('Ha ocurrido un error al ingresar/modificar a su mascota. Reintente con nuevos valores.');
                        }
                      } else {
                        await fetchEditPet(nomUsuario, valueNombre, (offsetClase + offsetEdad + offsetPeso).toString(), namePet);
                        namePet = valueNombre; 
                        ok_addPet = 0; ok_getPet = 0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: valueNombre,)),
                        );
                      }
                    } else {
                      EasyLoading.showError('Debe ingresar un nombre para su mascota.');
                    }
                  },
                  child: Text(
                    "Confirmar",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 3,
                      
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, top: 25, bottom: 15),
                      child: ElevatedButton(
                        child: const Icon(Icons.add_box_rounded),
                        onPressed: () {
                          if (controllerNombre.text != "") {
                            valueNombre = controllerNombre.text;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ConfirmDatosPet()),
                            );
                          } else {
                            EasyLoading.showError('Debe ingresar un nombre para su mascota.');
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
                
                ],
              ),*/
              const SizedBox(height: 100,),
            ],
          ),      
        ),
      ),
    );
  }
}