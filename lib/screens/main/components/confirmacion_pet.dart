import 'package:admin/Backend.dart';
import 'package:admin/constants.dart';
import 'package:admin/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConfirmDatosPet extends StatelessWidget {
  const ConfirmDatosPet({Key? key}) : super(key: key);

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
        title: const Text("Confirmación de datos"),
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
              "Nombre:   " + valueNombre,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 25,),
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
              ],
            )
          ],
        ),
      ),
    );
  } 
}