import 'package:admin/Backend.dart';
import 'package:admin/controllers/MenuController.dart';
//import 'package:admin/main.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../main.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.menu),
              onPressed: context.read<MenuController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            Text(
              "  Feed Me Easy",
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
            ),
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            Text(
              "  Feed Me Easy",
              style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          NightMode(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class NightMode extends StatelessWidget {
  const NightMode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: ElevatedButton(
        child: Icon(
          Icons.dark_mode_rounded,
        ),
        onPressed: () => {
          if (!iterator) {
            bgColor = bgColorDarkM,
            secondaryColor = secondaryColorDarkM,
          } else {
            bgColor = Colors.white,
            secondaryColor = Colors.pink,
          },
          iterator = !iterator,
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Menu(username: nomUsuario, namePet: namePet,)),
          )
        },
      ),
    );
  }
}
