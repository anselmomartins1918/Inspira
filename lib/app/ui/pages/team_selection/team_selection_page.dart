import 'package:flutter/material.dart';

class TeamSelection extends StatelessWidget {
  final String name;

  const TeamSelection({
    required this.name,
    super.key,
  });

  static const List<String> teams = [
    'Equipe 1',
    'Equipe 2',
    'Equipe 3',
    'Equipe 4',
    'Equipe 5',
    'Equipe 6'
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
            const Text(
              'Seleção de Equipe',
              style: TextStyle(
                color: Color(0xFF0A6844),
                fontFamily: 'Lato',
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32.0,
                  mainAxisSpacing: 40.0,
                ),
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/avaluation',
                      arguments: [name, teams[index]],
                    ),
                    child: Card(
                      color: const Color(0xFFD7E0DB),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              teams[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'Lato',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                padding: const EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
