import 'dart:async';

import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Timer(
      const Duration(milliseconds: 2000),
      () => Navigator.of(context).popUntil((route) => route.isFirst),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0A6844),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              color: Colors.white,
              size: 128.0,
            ),
            SizedBox(height: 24.0),
            Text(
              'Equipe avaliada com sucesso',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lalo',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
