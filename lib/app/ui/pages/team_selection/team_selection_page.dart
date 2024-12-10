import 'package:flutter/material.dart';
import 'package:inspira/app/data/controllers/team_selection_controller.dart';

class TeamSelection extends StatelessWidget {
  final String name;

  TeamSelection({
    required this.name,
    super.key,
  });

  final List<String> teams = [
    'Viva Sereno',
    'Alladin',
    'Darueira',
    'Bençavó',
    'FinFocus',
    'Jovem Tech',
  ];

  @override
  Widget build(BuildContext context) {
    TeamSelectionController controller = TeamSelectionController(name: name);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF032826),
            centerTitle: true,
            title: const Text(
              'Seleção de Equipe',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 144.0,
            crossAxisSpacing: 32.0,
            mainAxisSpacing: 32.0,
          ),
          itemCount: teams.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: controller.avaluations$,
              builder: (context, child) {
                bool isSelect = controller.avaluations
                    .any((avaluation) => avaluation.team == teams[index]);

                return GestureDetector(
                  onTap: () => !isSelect
                      ? Navigator.pushNamed(
                          context,
                          '/avaluation',
                          arguments: [name, teams[index]],
                        )
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF141414),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                      color: isSelect ? const Color(0xFFA6F7A7) : Colors.white,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
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
                        if (isSelect)
                          Positioned(
                            bottom: -24.0,
                            left: 0.0,
                            right: 0.0,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: IntrinsicWidth(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: const Color(0xFF0A6844),
                                  ),
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    "${controller.avaluations.firstWhere((avaluation) => avaluation.team == teams[index]).grade}",
                                    style: const TextStyle(
                                      color: Color(0xFFA6F7A7),
                                      fontFamily: 'Lalo',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
