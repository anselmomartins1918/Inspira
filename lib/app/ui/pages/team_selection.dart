import 'package:flutter/material.dart';

class TeamSelection extends StatelessWidget {
  const TeamSelection({super.key});

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
                        'Seleção de Equipe',
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
                  return Card(
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
