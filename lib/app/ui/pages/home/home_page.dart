import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspira/app/data/controllers/home_controller.dart';
import 'package:inspira/app/data/services/auth_service.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController =
        HomeController(auth: context.read<AuthService>());
    Size size = MediaQuery.of(context).size;

    String? email = context.read<AuthService>().user?.email;

    bool isValuer() {
      return email != 'laura.coelho@inspira.com';
    }

    return Scaffold(
      body: Container(
        color: const Color(0xFFF0F5F2),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              flex: 65,
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: size.width * 0.4,
                      child: SvgPicture.asset('assets/logo_unifametro.svg'),
                    ),
                    const SizedBox(height: 48.0),
                    const Text(
                      '‘‘Inspire confiança com seu\nolhar cuidadoso e justo’’',
                      style: TextStyle(
                        color: Color(0xFF032826),
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: AnimatedBuilder(
                animation: homeController.name$,
                builder: (context, child) {
                  if (homeController.name == null) {
                    return const CircularProgressIndicator(color: Colors.white);
                  }
                  return Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(64.0),
                        topRight: Radius.circular(64.0),
                      ),
                      color: Color(0xFF032826),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Olá,   Avaliador',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.0,
                                fontFamily: 'Lato',
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            SizedBox(
                              width: size.width * 0.6,
                              child: CustomButton(
                                onPressed: () {
                                  if (isValuer()) {
                                    Navigator.popAndPushNamed(
                                      context,
                                      '/team_selection',
                                      arguments: homeController.name,
                                    );
                                  } else {
                                    Navigator.popAndPushNamed(
                                        context, '/ranking');
                                  }
                                },
                                text: isValuer()
                                    ? 'Avaliar equipe'
                                    : 'Ranking das equipes',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.width * 0.125,
                          child: Image.asset('assets/logo_mude_small.png'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
