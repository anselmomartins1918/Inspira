import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspira/app/data/controllers/login_controller.dart';
import 'package:inspira/app/data/services/auth_service.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';
import 'package:inspira/app/ui/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginController loginController = LoginController();

    return Scaffold(
      backgroundColor: const Color(0xFF032826),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              flex: 45,
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.width * 0.2,
                      child: SvgPicture.asset('assets/logo_mude_big.svg'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 55,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64.0),
                    topRight: Radius.circular(64.0),
                  ),
                  color: Color(0xFFF0F5F2),
                ),
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64.0,
                    vertical: 32.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Bem-vindo, Avaliador!',
                        style: TextStyle(
                          color: Color(0xFF032826),
                          fontSize: 32.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      IntrinsicHeight(
                        child: Column(
                          children: [
                            IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'E-mail',
                                    style: TextStyle(
                                      color: Color(0xFF032826),
                                      fontSize: 20.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  CustomTextFormField(
                                    controller: email,
                                    hintText: 'nome.sobrenome@inspira.com',
                                    onChanged: (String text) => text =
                                        text.toLowerCase().replaceAll(' ', ''),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Senha',
                                    style: TextStyle(
                                      color: Color(0xFF032826),
                                      fontSize: 20.0,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  CustomTextFormField(
                                    controller: password,
                                    hintText: 'inspira2024',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: loginController.isLoading$,
                        builder: (context, child) {
                          return CustomButton(
                            text: 'Entrar na conta',
                            isLoading: loginController.isLoading,
                            onPressed: () async {
                              bool loggedIn = await loginController.login(
                                email: email.text,
                                password: password.text,
                                auth: context.read<AuthService>(),
                              );

                              if (context.mounted) {
                                if (loggedIn) {
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Por favor, verifique suas credenciais de acesso.',
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
