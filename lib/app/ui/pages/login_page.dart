import 'package:flutter/material.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';
import 'package:inspira/app/ui/widgets/custom_text_form_field.dart';

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
            ),
            const SizedBox(height: 32.0),
            const CustomButton(text: 'Entrar', onPressed: null),
          ],
        ),
      ),
    );
  }
}
