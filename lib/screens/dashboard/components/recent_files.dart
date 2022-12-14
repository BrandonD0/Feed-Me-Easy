import 'dart:ffi';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:intl/intl.dart';

import 'package:admin/Backend.dart';
import 'package:admin/confirmacion.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
//import '../../../main.dart';
import 'dart:math';

import 'dart:async';
//import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


Future<int> aIO(String quanity) async {
  //final url = 'mqtts://BrandonD0:aio_RRHO54z9scLEDkjIf3zKigdSqpld@io.adafruit.com';
  //final url = 'https://io.adafruit.com/BrandonD0/feeds/feedmeeasy';
  final url = 'io.adafruit.com';
  final client = MqttServerClient.withPort(url, '', 1883);
  const topic1 = 'gabrielmonsa39/feeds/feed-me-easy';
  try {
    //client.checkCredentials('BrandonD0', '-BranVid19-');
    await client.connect('gabrielmonsa39', '939300724eb242b08ebb7bf56a165868');
  } on Exception catch (e) {
    print('EXAMPLE::client exception - $e');
    client.disconnect();
  }
  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
    client.disconnect();
  }
  final builder1 = MqttClientPayloadBuilder();
  builder1.addString(quanity);
  print('EXAMPLE:: <<<< PUBLISH 1 >>>>');
  client.publishMessage(topic1, MqttQos.atLeastOnce, builder1.payload!);

  return 0;
}

/// The subscribed callback
/*void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  exit(-1);
}*/









class BotonComida extends StatelessWidget {
  var name;

  BotonComida({
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
                      ..displayDuration = const Duration(milliseconds: 5000)
                      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
                      ..indicatorSize = 45.0
                      ..radius = 50.0
                      ..userInteractions = true
                      ..dismissOnTap = true;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Servir comida a " + name,
            style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 3,
                
            ),
          ),
          if (productKey == "") 
            Text(
              "Producto asociado: NO DEFINIDO",
              style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 3,
                  
              ),
            ),
          if (productKey != "") 
            Text(
              "Producto asociado: " + productKey,
              style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 3,
                  
              ),
            ),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                  child: Icon(
                    Icons.fastfood,
                  ),
                  onPressed: () async {
                    DateTime now = new DateTime.now();
                    if (productKey != "" && cantPorcion != "NO DEFINIDO" && !lockReport && namePet != "NO DEFINIDO") {
                      await fetchInsertReport(nomUsuario, name, cantPorcion, DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second).toString());
                      if (ok_getID == 1 && ok_insertReport == 1) {
                        ok_getID = 0; ok_insertReport = 0; lockReport = false;
                        await aIO(cantPorcion);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Confirmacion()),
                        );
                      } else {
                        EasyLoading.showError('No se ha podido servir la comida.');
                      }
                    } else {
                      EasyLoading.showError('Parece que no ha ingresado la porcion de comida y/o la clave del producto y/o una mascota.');
                    }
                  },
                ),
          ),
        ],
      ),
    );
  }
}

class PorcionComida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Porci??n usada (en g):",
            style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 3,
                
            ),
          ),
          SizedBox(height: 20,),
          if (useRecommend && cantPorcion == "NO DEFINIDO") 
            SizedBox(
              width: double.infinity,
              child: Text(
                "Recomendada (" + cantPorcion + ")",
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3,
                    
                ),
              ),
            ),
          if (useRecommend && cantPorcion != "NO DEFINIDO") 
            SizedBox(
              width: double.infinity,
              child: Text(
                "Recomendada (" + double.parse(cantPorcion).toStringAsFixed(2) + ")",
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3,
                    
                ),
              ),
            ),
          if (!useRecommend) 
            SizedBox(
              width: double.infinity,
              child: Text(
               cantPorcion,
                textAlign: TextAlign.center,
                style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 3,
                    
                ),
              ),
            ),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                  child: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Food()),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MisTips extends StatelessWidget {
  MisTips({Key? key}) : super(key: key);
  var arr = [
    'Visita al veterinario frecuentemente.',
    'Aplica las vacunas correspondientes en el tiempo indicado por el veterinario.',
    'El entrenamiento de la mascota basado en recompensas arroja excelentes resultados en su comportamiento.',
    'Compra juguetes seguros para tu mascota, de acuerdo a su raza y tama??o.',
    'Limpia las patas de tu mascota frecuentemente.', 
    'Lava los dientes de tu mascota para evitar enfermedades.',
    'Educa a tu perro, para que sepa d??nde debe dormir, d??nde hacer sus necesidades, horarios de comida, salidas, etc.',
    'Emplea unos minutos de tu d??a para jugar con tu mascota, ya sea lanzando una pelota o darle un largo paseo por el parque.',
    'Si tienes perros o gatos y no deseas tener m??s mascotas, es recomendable esterilizarlo. La ??poca del celo puede ser complicada y despertar conductas agresivas y enfermedades.',
    'Permite que tu mascota juegue con otros perros y personas, lo har?? m??s amigable.',
    'Las mascotas tienen una vida m??s corta que los humanos, por ello, aprovecha cada momento para consentirlo, disfrutar de su cari??o y compa????a.',
    'Tienes que brindarle un espacio en el que tu mascota pueda estar lejos de los elementos peligrosos, y darle tambi??n una buena higiene, es b??sico para una vida de calidad.',
    'Debes dejar una fuente de agua lo suficientemente cerca de ??l para que se mantenga saludable y su nivel de energ??a se mantenga alto gracias a la hidrataci??n.',
    'Sigue las recomendaciones diet??ticas que te haga tu veterinario en funci??n de las necesidades nutricionales de tu perro, basadas en el tama??o, la edad, el nivel de actividad y la raza.',
    'Ellos sienten amor y cari??o por sus due??os, es por ello que debes tratarlos bien, pero si eres agresivo, los maltratas, y los castigas con frecuencia terminar??n desarrollando un car??cter bastante agresivo y hasta peligroso.',
    'Cuanto mejor sea tu mascota en el cumplimiento de las ??rdenes b??sicas y necesarias, mayores ser??n las posibilidades de que tu perro viva una vida segura y larga.',
    'Las u??as demasiado grandes son comunes en los perros de edad avanzada y pueden dificultar el caminar. Adem??s, estas u??as son mucho m??s propensas a romperse, lo que puede ser bastante doloroso.',
    'Evita cargarlo constantemente: Trata de resistir esta tentaci??n, porque su cuerpo es muy delicado. Si lo haces, primero coloca una mano sobre su parte posterior y otra bajo el pecho, lev??ntalo con ambas manos y mantenlo junto a tu cuerpo para que se sienta seguro.',
    'El cepillado regular es esencial para los perros j??venes, debido a que elimina el pelo muerto, la suciedad y los par??sitos; adem??s, estimula el aporte de sangre hacia la piel, lo que genera un pelaje de aspecto m??s sano y brillante. Utiliza un equipo especial para esta acci??n.',
    'Para controlar el sarro y la placa dental, es aconsejable nutrirlo con un alimento seco, ya que le ayudar?? a aflojar los dientes de leche y acelerar as?? el proceso de dentici??n. Si la boca de tu cachorro es muy sensible, ablanda la comida sumergi??ndola primero en agua.',
    'Aprende a detectar enfermedades: A menudo, puedes pensar que tu mascota no se siente bien y una r??pida visita al veterinario te ayudar?? a confirmar que algo no marcha correctamente. Algunos s??ntomas son: p??rdida de apetito, rechazo del agua, disminuci??n o aumento s??bito de peso, lentitud o rechazo a jugar, micciones frecuentes o escasas, heces con sangre o blandas, v??mitos, salivaci??n excesiva o respiraci??n irregular.',
    'Acostumbra a tu perro a llevar un collar blando desde el principio. Despu??s de un tiempo, a??ade una correa corta y ligera y d??jate llevar por ??l sin tirar de ella durante algunos d??as. El objetivo es acostumbrarle a caminar contigo sin que tire. Si corre, o se retrasa, un suave tir??n es todo lo que deber??s hacer. Qu??date cerca de ??l para que no sienta deseos de soltarse.',
    'La vida puede ser muy complicada si no acostumbras a tu perro a viajar en coche. Primero, acost??mbrale a realizar peque??os trayectos de 5 a 10 minutos en d??as alternos, y poco a poco aumenta la duraci??n de los viajes hasta que se sienta c??modo.',
    'Saber c??mo cuidar una mascota adulta en su fase final, es otra clave fundamental para mejorar su calidad de vida. Cuida tu mascota con paciencia en esta etapa, ya que suceden cambios en su fisionom??a, siendo su principal limitaci??n el movimiento. Es importante que acompa??es a tu mascota y le entregues cari??o en todo momento, con el objetivo de evitar que se deprima, porque puede dejar de comer y aquello complicar??a su salud.',
    'Tener una mascota es una gran responsabilidad, y por eso un seguro para mascotas le brinda protecci??n ante imprevistos. Su cobertura es un apoyo permanente que te entregar?? orientaci??n telef??nica, acceso a servicios m??dicos e incluso hospedaje para tus perros o gatos, si te vas de vacaciones y necesitas un buen cuidado para tu mejor amigo.',
    'Podr??amos decir que una mascota es como un ni??o peque??o. Tiene la necesidad de explorarlo todo y llev??rselo a la boca. Para evitar accidentes en casa, cuida de tu perro y no dejes a su alcance nada que pueda causarle da??o. Elimina objetos punzantes o cortantes, plantas t??xicas, objetos delicados que puedan romperse f??cilmente como porcelana o vidrio.',
  ];
  String aleatorio() {
    var random = new Random();
    return arr[random.nextInt(arr.length)-1];
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Tips y consejos"),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                      aleatorio(),
                      style: TextStyle(
                          fontSize: 20,
                       fontWeight: FontWeight.w400,
                          color: Colors.white,
                       letterSpacing: 3,
                      
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

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      
      child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tips para las mascotas:",
            style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 3,
                
            ),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                  child: Icon(
                    Icons.lightbulb,
                  ),
                  onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MisTips()),
                      ),
                    },
            ),
          ),
        ],
      ),
    );
  }

}
