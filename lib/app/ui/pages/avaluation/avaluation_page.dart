import 'package:flutter/material.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';

class AvaluationPage extends StatelessWidget {
  final String name;
  final String team;

  const AvaluationPage({
    required this.name,
    required this.team,
    super.key,
  });

  static const Map<String, String> themes = {};

  static const List<String> burden = [
    'Peso: 3',
    'Peso: 3',
    'Peso: 2',
    'Peso: 1',
  ];

  static const List<String> types = [
    'Grau de aderência da solução ao desafio de captação e permanência de alunos',
    'Grau de aderência da solução ao desafio de captação e permanência de alunos',
    'Grau de aderência da solução ao desafio de captação e permanência de alunos',
    'Grau de aderência da solução ao desafio de captação e permanência de alunos',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                IconButton(
                  color: const Color(0xFFF6741C),
                  icon: const Icon(Icons.arrow_back_ios_new),
                  iconSize: 32.0,
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(
                  height: 48.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Avaliação de Equipe',
                        style: TextStyle(
                          color: Color(0xFF0A6844),
                          fontFamily: 'Lato',
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IntrinsicHeight(
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            team,
                            style: const TextStyle(
                              color: Color(0xFF05713A),
                              fontFamily: 'Lato',
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          IntrinsicWidth(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                color: Color(0xFFA6F7A7),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: Text(
                                team,
                                style: const TextStyle(
                                  color: Color(0xFF05713A),
                                  fontFamily: 'Lato',
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      color: Color(0xFFD7E0DB),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: const Text(
                      'Peso: 3',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    types.first,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF05713A),
                      fontFamily: 'Lalo',
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFFD7E0DB),
                                  shape: BoxShape.circle),
                              padding: const EdgeInsets.all(32.0),
                              child: const Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontFamily: 'Lalo',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFFD7E0DB),
                                  shape: BoxShape.circle),
                              padding: const EdgeInsets.all(32.0),
                              child: const Text(
                                '2',
                                style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontFamily: 'Lalo',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xFFD7E0DB),
                                  shape: BoxShape.circle),
                              padding: const EdgeInsets.all(32.0),
                              child: const Text(
                                '3',
                                style: TextStyle(
                                  color: Color(0xFF141414),
                                  fontFamily: 'Lalo',
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        backgroundColor: Colors.white,
                        borderColor: const Color(0xFFF6741C),
                        prefixIcon: Icons.arrow_back_ios_new,
                        iconColor: const Color(0xFFF6741C),
                        text: 'Voltar',
                        textColor: const Color(0xFFF6741C),
                        onPressed: () {},
                      ),
                      CustomButton(
                        text: 'Próximo Critério',
                        suffixIcon: Icons.arrow_forward_ios,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            const IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Critérios',
                    style: TextStyle(
                      color: Color(0xFF05713A),
                      fontFamily: 'Lalo',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
