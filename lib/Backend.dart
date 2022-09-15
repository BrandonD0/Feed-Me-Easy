import 'dart:convert';
import 'dart:ffi';
import 'package:admin/constants.dart';
import 'package:http/http.dart' as http;


var globalCheck = 0, ok = 0;
var nomUsuario, ok_productkey = 0, productKey = "";

Future<AlbumCheck> fetchCheck(String user, String pass) async {
  nomUsuario = user;
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/check/' + user + '/' + pass));
      //Map mapRes = json.decode(response.body);
  print('https://mysterious-sea-21418.herokuapp.com/check/' + user + '/' + pass);
  //Map<String, dynamic> map = jsonDecode(response.body);
  //return map['status'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var temp = AlbumCheck.fromJson(jsonDecode(response.body));
    if (globalCheck == 1) {
      final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPet/' + user));
      if (response.statusCode == 200) {
        AlbumGetPet.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
      final response2 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPorcion/' + user));
      if (response2.statusCode == 200) {
        AlbumGetPorcion.fromJson(jsonDecode(response2.body));
      } else {
        throw Exception('Failed to load album');
      }
      final response3 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getProduct/' + user));
      if (response3.statusCode == 200) {
        AlbumProductKey.fromJson(jsonDecode(response3.body));
      } else {
        throw Exception('Failed to load album');
      }
    }
    return temp;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumCheck {
  final String status;

  AlbumCheck({
    required this.status,
  });

  factory AlbumCheck.fromJson(Map<String, dynamic> json) {
    ok = 1;
    globalCheck =  json['status'];
    return AlbumCheck(
      status: json['status'].toString(),
    );
  }
}

class AlbumProductKey {
  final String status;

  AlbumProductKey({
    required this.status,
  });

  factory AlbumProductKey.fromJson(Map<String, dynamic> json) {
    ok_productkey = 1;
    productKey = json['clave'].toString();
    return AlbumProductKey(
      status: json['status'].toString(),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////
var globalNew = 0;

Future<AlbumNew> fetchNew(String email, String user, String pass) async {
  print('https://mysterious-sea-21418.herokuapp.com/newUser/' + email + '/' + user + '/' + pass);
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/newUser/' + email + '/' + user + '/' + pass));
  if (response.statusCode == 200) {
    
    AlbumNew.fromJson(jsonDecode(response.body));
    if (globalNew == 1) {
      final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/newUser2/' + email + '/' + user + '/' + pass));
      print('https://mysterious-sea-21418.herokuapp.com/newUser/' + email + '/' + user + '/' + pass);
      if (response.statusCode == 200) {
        return AlbumNew.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load album');
      }
    }
    return AlbumNew.fromJson(jsonDecode(response.body));

  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumNew {
  final String status;

  AlbumNew({
    required this.status,
  });

  factory AlbumNew.fromJson(Map<String, dynamic> json) {
    globalNew = json['status'];
    return AlbumNew(
      status: json['status'].toString(),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
var ok_getPet = 0;
var namePet = "";

Future<AlbumGetPet> fetchGetPet(String user) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPet/' + user));
  print('https://mysterious-sea-21418.herokuapp.com/getPet/' + user);
  //Map<String, dynamic> map = jsonDecode(response.body);
  //return map['status'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumGetPet.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumGetPet {
  final String status;

  AlbumGetPet({
    required this.status,
  });

  factory AlbumGetPet.fromJson(Map<String, dynamic> json) {
    //ok_getPet =  1;
    if (json['mascota'] == "") {
      namePet = "NO DEFINIDO";
    } else {
      namePet = json['mascota'];
    }
    return AlbumGetPet(
      status: json['status'].toString(),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////
var cantPorcion = "";

class AlbumGetPorcion {
  final String status;

  AlbumGetPorcion({
    required this.status,
  });

  factory AlbumGetPorcion.fromJson(Map<String, dynamic> json) {
    if (json['porcion'] == "") {
      cantPorcion = "NO DEFINIDO";
    } else {
      cantPorcion = json['porcion'].toString();
    }
    ok_getPet =  1;
    return AlbumGetPorcion(
      status: json['status'].toString(),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
var ok_getInfo = 0;

Future<AlbumGetInfo> fetchGetInfo(String user) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getInfo/' + user));
  print('https://mysterious-sea-21418.herokuapp.com/getInfo/' + user);
  //Map<String, dynamic> map = jsonDecode(response.body);
  //return map['status'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumGetInfo.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumGetInfo {
  final String status;

  AlbumGetInfo({
    required this.status,
  });

  factory AlbumGetInfo.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> json2 = json['info'];
    if (json['status'] == 1) {
      if (json2['0'] == "P")
        info_clase = "Perro";
      else
        info_clase = "Gato";
      info_raza = json2['1'];
      info_peso = json2['2'];
      info_edad = json2['3'];
    } else {
      info_clase = "NO DEFINIDO";
      info_raza = "NO DEFINIDO";
      info_peso = "NO DEFINIDO";
      info_edad = "NO DEFINIDO";
    }
    ok_getInfo = 1;
    return AlbumGetInfo(
      status: json['status'].toString(),
    );
  }
}



///////////////////////////////////////////////////////////////////////////////////////
var ok_delete = 0;

Future<AlbumDelete> fetchDelete(String user, String pet) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/deleteMascota/' + user + "/" + pet));
  print('https://mysterious-sea-21418.herokuapp.com/deleteMascota/' + user + "/" + pet);
  //Map<String, dynamic> map = jsonDecode(response.body);
  //return map['status'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return AlbumDelete.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumDelete {
  final String status;

  AlbumDelete({
    required this.status,
  });

  factory AlbumDelete.fromJson(Map<String, dynamic> json) {
    ok_delete = 1;
    useRecommend = true;
    cantPorcion = "NO DEFINIDO";
    return AlbumDelete(
      status: json['status'].toString(),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////
var ok_addPet = 0;

Future<AlbumAddPet> fetchAddPet(String user, String pet, String idC, String idR, String idP) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/insertMascota/' + user + "/" + pet + "/" + idC + "/" + idR + "/" + idP));
  print('https://mysterious-sea-21418.herokuapp.com/insertMascota/' + user + "/" + pet + "/" + idC + "/" + idR + "/" + idP);
  //Map<String, dynamic> map = jsonDecode(response.body);
  //return map['status'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final a = AlbumAddPet.fromJson(jsonDecode(response.body));
    if (ok_addPet == 1) {
      await fetchGetPet(nomUsuario);
      final response2 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPorcion/' + user));
      if (response2.statusCode == 200) {
        AlbumGetPorcion.fromJson(jsonDecode(response2.body));
      } else {
        throw Exception('Failed to load album');
      }
    }
    return a;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class AlbumAddPet {
  final String status;

  AlbumAddPet({
    required this.status,
  });

  factory AlbumAddPet.fromJson(Map<String, dynamic> json) {
    ok_addPet = json['status'];
    ok_getInfo = 0;
    return AlbumAddPet(
      status: json['status'].toString(),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
var ok_newProduct = 0;

Future<AlbumNewProduct> fetchAddProduct(String user, String key) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/insertProduct/' + user + '/' + key ));
  print('https://mysterious-sea-21418.herokuapp.com/insertProduct/' + user + '/' + key );
  if (response.statusCode == 200) {
    return AlbumNewProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumNewProduct {
  final String status;

  AlbumNewProduct({
    required this.status,
  });

  factory AlbumNewProduct.fromJson(Map<String, dynamic> json) {
    ok_newProduct = json['status'];
    return AlbumNewProduct(
      status: json['status'].toString(),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
var ok_deleteProduct = 0;

Future<AlbumDeleteProduct> fetchDeleteProduct(String user, String key) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/deleteProduct/' + user + '/' + key ));
  print('https://mysterious-sea-21418.herokuapp.com/deleteProduct/' + user + '/' + key );
  if (response.statusCode == 200) {
    return AlbumDeleteProduct.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumDeleteProduct {
  final String status;

  AlbumDeleteProduct({
    required this.status,
  });

  factory AlbumDeleteProduct.fromJson(Map<String, dynamic> json) {
    ok_deleteProduct = json['status'];
    return AlbumDeleteProduct(
      status: json['status'].toString(),
    );
  }
}


///////////////////////////////////////////////////////////////////////////////////////
var ok_getID = 0, ok_insertReport = 0;
var ID = 0;

Future<AlbumGetID> fetchInsertReport(String user, String mascota, String quantity, String fecha) async {
  lockReport = true;
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPetID/' + user + '/' + mascota));
  print('https://mysterious-sea-21418.herokuapp.com/getPetID/' + user + '/' + mascota);
  if (response.statusCode == 200) {
    final a = AlbumGetID.fromJson(jsonDecode(response.body));
    if (ok_getID == 1) {
      //await fetchGetPet(nomUsuario);
      final response2 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/insertReport/' + ID.toString() + "/" + quantity + "/" + fecha));
      if (response2.statusCode == 200) {
        AlbumInsert.fromJson(jsonDecode(response2.body));
      } else {
        throw Exception('Failed to load album');
      }
    }
    return a;
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumInsert {
  final String status;

  AlbumInsert({
    required this.status,
  });

  factory AlbumInsert.fromJson(Map<String, dynamic> json) {
    ok_insertReport =  json['status'];
    return AlbumInsert(
      status: json['status'].toString(),
    );
  }
}



Future<AlbumGetID> fetchGetID(String user, String mascota) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPetID/' + user + '/' + mascota));
  print('https://mysterious-sea-21418.herokuapp.com/getPetID/' + user + '/' + mascota);
  if (response.statusCode == 200) {
    var a =  AlbumGetID.fromJson(jsonDecode(response.body));
    final response2 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getReport/'+ ID.toString()));
      if (response2.statusCode == 200) {
        AlbumGetReport.fromJson(jsonDecode(response2.body));
      } else {
        throw Exception('Failed to load album');
      }
    return a;
  } else {
    throw Exception('Failed to load album');
  }
}

class AlbumGetID {
  final String status;

  AlbumGetID({
    required this.status,
  });

  factory AlbumGetID.fromJson(Map<String, dynamic> json) {
    ok_getID = json['status'];
    ID = json['id'];
    return AlbumGetID(
      status: json['status'].toString(),
    );
  }
}

var ok_getReport = 0;
var ok_getStatusReport = 0;
var ReportData;

class AlbumGetReport {
  final String status;

  AlbumGetReport({
    required this.status,
  });

  factory AlbumGetReport.fromJson(Map<String, dynamic> json) {
    ok_getReport = 1;
    ok_getStatusReport = json['status'];
    ReportData = json['valores'];
    return AlbumGetReport(
      status: json['status'].toString(),
    );
  }
}


Future<bool> fetchEditPet(String user, String newName, String idPor, String oldName) async {
  final response = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/editMascota/' + user + '/' + newName + '/' + idPor + '/' + oldName));
  print('https://mysterious-sea-21418.herokuapp.com/editMascota/' + user + '/' + newName + '/' + idPor + '/' + oldName);
  //useRecommend = true;
  final response2 = await http
      .get(Uri.parse('https://mysterious-sea-21418.herokuapp.com/getPorcion/' + user));
  if (response2.statusCode == 200) {
    AlbumGetPorcion.fromJson(jsonDecode(response2.body));
  } else {
    throw Exception('Failed to load album');
  }
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception('Failed to load album');
  }
}

