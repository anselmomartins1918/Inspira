import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            SizedBox(
              width: size.width * 0.6,
              height: size.width * 0.6,
              child: SvgPicture.asset('assets/logo_unifametro_branco.svg'),
            ),
            const Text(
              'Produzido por Hub de Inovação Unifametro',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
