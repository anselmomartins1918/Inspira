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
                      child: SvgPicture.asset('assets/logo_unifametro.svg'),
                    ),
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
                      color: Color(0xFF05713A),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Olá, ${homeController.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontFamily: 'Lato',
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.6,
                          child: CustomButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/team_selection'),
                            text: 'Avaliar equipe',
                          ),
                        ),
                        SizedBox(
                          height: size.width * 0.125,
                          child: Image.asset('assets/inspira.png'),
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
