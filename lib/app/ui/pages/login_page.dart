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
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.15),
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

                      if (loggedIn) {
                      } else {
                        if (context.mounted) {
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
                })
          ],
        ),
      ),
    );
  }
}
