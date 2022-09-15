import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/header.dart';

import 'components/recent_files.dart';
//import 'components/storage_details.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  var username;
  var namePet;
  DashboardScreen({
    @required this.username,
    @required this.namePet,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Bienvenida(name: username),
                      SizedBox(height: defaultPadding),
                      BotonComida(name: namePet),
                      if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) PorcionComida(),
                      SizedBox(height: 20,),
                      Tips(),
                    ],
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



