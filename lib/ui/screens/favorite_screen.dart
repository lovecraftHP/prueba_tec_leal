import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tec_leal/styles/app_styles.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppStyle.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false);
                },
                icon: const Icon(FontAwesomeIcons.gear))
          ],
        ),
        body: Center(
          child: Text('Favorites'),
        ),
      );
}
