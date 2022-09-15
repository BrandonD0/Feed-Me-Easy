import 'package:flutter/material.dart';

const primaryColor   = Colors.orange;
Color secondaryColor = Colors.pink;
Color bgColor        = Color(0xFFFFFFFF);
const txtColor       = Color(0x00000000);
/* Dark Mode*/ 
const primaryColorDarkM = Color(0xFF2697FF);
const secondaryColorDarkM = Color(0xFF2A2D3E);
const bgColorDarkM = Color(0xFF212332);

bool iterator = false;


bool useRecommend = true;
String cantPorcionRespaldo = "";


String info_clase = "";
String info_raza  = "";
String info_peso  = "";
String info_edad  = "";


///// Para agregar mascota /////
int offsetClase = 0;
int offsetRaza  = 0;
int offsetPeso  = 0;
int offsetEdad  = 0;
String valueClase  = "";
String valueRaza   = "";
String valuePeso   = "";
String valueEdad   = "";
String valueNombre = "";

String idClase = "";
////////////////////////////////

///// Para locks /////
bool lockReport = false;

bool isNewPet = true;

double maxValue =  50.0;
//double minvalue = -40.0;

const defaultPadding = 16.0;
