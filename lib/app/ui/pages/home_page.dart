import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              flex: 65,
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child:
                          SvgPicture.asset('assets/logo_unifametro.svg'),
                    ),
                    const SizedBox(height: 24.0),
                    SizedBox(
                      width: size.width * 0.7,
                      child: const Text(
                        'O ranking das equipes aparecerá aqui quando as avaliacões forem lançadas :)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Container(
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(120.0),
                    topRight: Radius.circular(120.0),
                  ),
                  color: Color(0xFF05713A),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Bem-vindo, Anselmo',
                      style: TextStyle(color: Colors.white, fontSize: 32.0),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: CustomButton(
                        onPressed: () {},
                        text: 'Avaliar equipe',
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.125,
                      child: Image.asset('assets/inspira.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
