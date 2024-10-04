import 'package:flutter/material.dart';
import 'package:inspira/app/data/controllers/avaluantion_controller.dart';
import 'package:inspira/app/ui/widgets/custom_button.dart';

class AvaluationPage extends StatelessWidget {
  final String name;
  final String team;

  const AvaluationPage({
    required this.name,
    required this.team,
    super.key,
  });

  static const Map<String, String> themes = {
    'Equipe 1': 'Mescados de Educação Brasileira',
    'Equipe 2': 'Concorrência no Setor Educacional',
    'Equipe 3': 'Tecnologia e Inovação na Educação',
    'Equipe 4': 'Criação de Produtos Inovadores para a Unifametro',
    'Equipe 5': 'Transformação e Criação de uma Nova Unifametro',
    'Equipe 6': 'Experiência do Aluno no Contexto Educacional',
  };

  static const List<String> burden = [
    'Peso: 3',
    'Peso: 3',
    'Peso: 2',
    'Peso: 1',
  ];

  static const List<String> types = [
    'Grau de aderência da solução ao desafio de captação e permanência de alunos',
    'Potencial de implementação real com base no custo benefício',
    'Grau de Inovação da Solução comparado ao Estado do Ceará',
    'Grau de Simplicidade da solução: promove uma experiência mais eficiente e acessível tanto para os usuários experientes como para novatos',
  ];

  @override
  Widget build(BuildContext context) {
    AvaluantionController controller = AvaluantionController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
        child: AnimatedBuilder(
          animation: controller.actualValue$,
          builder: (context, child) {
            return Column(
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
                if (controller.actualValue != 4)
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
                                      themes[team] ?? '',
                                      textAlign: TextAlign.center,
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
                        IntrinsicHeight(
                          child: Column(
                            children: [
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
                                child: Text(
                                  burden[controller.actualValue],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                types[controller.actualValue],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF05713A),
                                  fontFamily: 'Lalo',
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 32.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                            ],
                          ),
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
                              onPressed: () {
                                if (controller.actualValue == 0) {
                                  Navigator.pop(context);
                                } else {
                                  controller.decrement();
                                }
                              },
                            ),
                            CustomButton(
                              text: controller.actualValue != 3 ? 'Próximo Critério' : 'Revisar avaliação',
                              suffixIcon: Icons.arrow_forward_ios,
                              onPressed: () => controller.increment(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                if (controller.actualValue == 4)
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Critério 1',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: BoxShape.circle),
                                  padding: const EdgeInsets.all(32.0),
                                  child: const Text(
                                    '3\npts',
                                    textAlign: TextAlign.center,
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
                            const SizedBox(width: 16.0),
                            Column(
                              children: [
                                const Text(
                                  'Critério 2',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: BoxShape.circle),
                                  padding: const EdgeInsets.all(32.0),
                                  child: const Text(
                                    '3\npts',
                                    textAlign: TextAlign.center,
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
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Critério 3',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: BoxShape.circle),
                                  padding: const EdgeInsets.all(32.0),
                                  child: const Text(
                                    '3\npts',
                                    textAlign: TextAlign.center,
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
                            const SizedBox(width: 16.0),
                            Column(
                              children: [
                                const Text(
                                  'Critério 4',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Lato',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      shape: BoxShape.circle),
                                  padding: const EdgeInsets.all(32.0),
                                  child: const Text(
                                    '3\npts',
                                    textAlign: TextAlign.center,
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
                          ],
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        CustomButton(
                          text: 'Confirmar Avaliação com 23pts',
                          suffixIcon: Icons.arrow_forward_ios,
                          onPressed: () => controller.increment(),
                        ),
                      ],
                    ),
                  ),
                IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Critérios',
                        style: TextStyle(
                          color: Color(0xFF05713A),
                          fontFamily: 'Lalo',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (controller.actualValue != 0) {
                                    controller.navigateTo(index: 0);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: controller.actualValue == 0
                                            ? const Color(0xFFB0B8B3)
                                            : const Color(0xFFD7E0DB),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 8.0,
                                      ),
                                      child: const Text(
                                        '1',
                                        style: TextStyle(
                                          color: Color(0xFF141414),
                                          fontFamily: 'Lalo',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              GestureDetector(
                                onTap: () {
                                  if (controller.actualValue != 1) {
                                    controller.navigateTo(index: 1);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: controller.actualValue == 1
                                            ? const Color(0xFFB0B8B3)
                                            : const Color(0xFFD7E0DB),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 8.0,
                                      ),
                                      child: const Text(
                                        '2',
                                        style: TextStyle(
                                          color: Color(0xFF141414),
                                          fontFamily: 'Lalo',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              GestureDetector(
                                onTap: () {
                                  if (controller.actualValue != 2) {
                                    controller.navigateTo(index: 2);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: controller.actualValue == 2
                                            ? const Color(0xFFB0B8B3)
                                            : const Color(0xFFD7E0DB),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 8.0,
                                      ),
                                      child: const Text(
                                        '3',
                                        style: TextStyle(
                                          color: Color(0xFF141414),
                                          fontFamily: 'Lalo',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              GestureDetector(
                                onTap: () {
                                  if (controller.actualValue != 3) {
                                    controller.navigateTo(index: 3);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        color: controller.actualValue == 3
                                            ? const Color(0xFFB0B8B3)
                                            : const Color(0xFFD7E0DB),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24.0,
                                        vertical: 8.0,
                                      ),
                                      child: const Text(
                                        '4',
                                        style: TextStyle(
                                          color: Color(0xFF141414),
                                          fontFamily: 'Lalo',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              if (controller.actualValue != 4) {
                                controller.navigateTo(index: 4);
                              }
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: controller.actualValue == 4
                                        ? const Color(0xFFB0B8B3)
                                        : const Color(0xFFD7E0DB),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0,
                                    vertical: 8.0,
                                  ),
                                  child: const Text(
                                    'Confirmação',
                                    style: TextStyle(
                                      color: Color(0xFF141414),
                                      fontFamily: 'Lalo',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
