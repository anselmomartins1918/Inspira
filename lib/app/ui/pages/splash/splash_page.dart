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
              width: size.width * 0.8,
              height: size.width * 0.5,
              child: Image.asset('assets/logo_mude_big.png'),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Criado por',
                  style: TextStyle(
                    color: Color(0xFFC9F8C9),
                    fontSize: 16.0,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 8.0),
                SvgPicture.asset(
                  'assets/logo_ulabs.svg',
                  width: size.width * 0.3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
