import 'package:flutter/material.dart';
import 'package:inspira/app/data/controllers/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    RankingController controller = RankingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: AnimatedBuilder(
          animation: controller.teams$,
          builder: (context, child) {
            return Column(
              children: [
                Expanded(
                  flex: 25,
                  child: Container(
                    width: size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.0),
                      ),
                      color: Color(0xFF032826),
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: 0.5,
                        child: Image.asset('assets/logo_mude_big.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 60.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ranking Geral',
                          style: TextStyle(
                            color: Color(0xFF032826),
                            fontSize: 32.0,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: controller.teams.isNotEmpty,
                              child: Container(
                                height: 120.0,
                                width: size.width * 0.4,
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFFFD545),
                                      Color(0xFFDBA005)
                                    ], // Gradiente dourado
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(36.0),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(36.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '500pts',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Lato',
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Equipe 4',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Lato',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -16.0,
                                      left: size.width * 0.125,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                          vertical: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFFFD545),
                                              Color(0xFFDBA005)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(36.0),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '1',
                                              style: TextStyle(
                                                color: Color(0xFF141414),
                                                fontFamily: 'Lato',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.workspace_premium,
                                              color: Colors.black,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: controller.teams.length > 1,
                              child: Container(
                                height: 120.0,
                                width: size.width * 0.4,
                                padding: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFD7E0DB),
                                      Color(0xFFB0B8B3)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(36.0),
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(36.0),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '500pts',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Lato',
                                                  fontSize: 24.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Equipe 4',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Lato',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -16.0,
                                      left: size.width * 0.125,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                          vertical: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFD7E0DB),
                                              Color(0xFFB0B8B3)
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(36.0),
                                        ),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '2',
                                              style: TextStyle(
                                                color: Color(0xFF141414),
                                                fontFamily: 'Lato',
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            Icon(
                                              Icons.workspace_premium,
                                              color: Colors.black,
                                              size: 16.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 36.0),
                        Expanded(
                          child: ListView.separated(
                            itemCount: (controller.teams.length > 2)
                                ? controller.teams.length - 2
                                : 0,
                            itemBuilder: (context, index) {
                              int listIndex = index + 2;

                              return Container(
                                height: 64.0,
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        (listIndex + 1).toString(),
                                        style: const TextStyle(
                                          color: Color(0xFFF6741C),
                                          fontFamily: 'Lato',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 24.0),
                                      Text(
                                        controller.teams[listIndex].name,
                                        style: const TextStyle(
                                          color: Color(0xFF3B3D3C),
                                          fontFamily: 'Lato',
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${controller.teams[listIndex].total}pts',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Lato',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                color: const Color(0xFFB0B8B3),
                                height: 1.0,
                                width: size.width,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
