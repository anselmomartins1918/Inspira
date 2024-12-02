import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Timer(
      const Duration(milliseconds: 3000),
      () => Navigator.of(context).pushReplacementNamed('/login'),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF032826),
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
              width: size.width * 0.5,
              height: size.width * 0.5,
              child: SvgPicture.asset('assets/logo_mude_big.svg'),
            ),
            RichText(
              text: const TextSpan(
                text: 'Produzido por ',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                children: [
                  TextSpan(
                    text: 'Hub de Inovação Unifametro',
                    style: TextStyle(color: Color(0xFFF9A053), fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
