import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xFF05713A),
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
                      height: size.width * 0.125,
                      child: Image.asset('assets/inspira.png'),
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
                    topLeft: Radius.circular(120.0),
                    topRight: Radius.circular(120.0),
                  ),
                  color: Colors.white,
                ),
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: email,
                      labelText: 'Usuário',
                    ),
                    const SizedBox(height: 8.0),
                    CustomTextFormField(
                      controller: password,
                      labelText: 'Senha',
                      obscureText: true,
                    ),
                    const SizedBox(height: 32.0),
                    AnimatedBuilder(
                      animation: loginController.isLoading$,
                      builder: (context, child) {
                        return CustomButton(
                          text: 'Entrar',
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
          ],
        ),
      ),
    );
  }
}
