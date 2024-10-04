import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inspira/app/data/controllers/ranking_controller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    RankingController controller = RankingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
        child: AnimatedBuilder(
          animation: controller.teams$,
          builder: (context, child) {
            log(controller.teams.toString());
            return Column(
              children: [
                SizedBox(
                  width: size.width * 0.2,
                  height: size.width * 0.2,
                  child: SvgPicture.asset('assets/logo_unifametro.svg'),
                ),
                const SizedBox(height: 48.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.teams.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: index != 0 ? 8.0 : 0.0),
                        height: 80.0,
                        decoration: BoxDecoration(
                          gradient: index < 3
                              ? LinearGradient(
                                  colors: [
                                    index == 0
                                        ? const Color(0xFFFFD545)
                                        : index == 1
                                            ? const Color(0xFFD7E0DB)
                                            : const Color(0xFFF9A053),
                                    index == 0
                                        ? const Color(0xFFDBA005)
                                        : index == 1
                                            ? const Color(0xFFB0B8B3)
                                            : const Color(0xFFD35614)
                                  ], // Cores do degradê
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: Color(0xFF3B3D3C),
                                fontFamily: 'Lato',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              controller.teams[index].name,
                              style: const TextStyle(
                                color: Color(0xFF3B3D3C),
                                fontFamily: 'Lato',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 24.0),
                            Text(
                              '${controller.teams[index].total}pts',
                              style: const TextStyle(
                                color: Color(0xFF3B3D3C),
                                fontFamily: 'Lato',
                                fontSize: 20.0,
                              ),
                            ),
                            if (index < 3)
                              Container(
                                margin: const EdgeInsets.only(left: 24.0),
                                child: const Icon(
                                  Icons.workspace_premium,
                                  size: 32.0,
                                  color: Colors.white,
                                ),
                              ),
                            if (index > 2) const SizedBox(width: 56.0)
                          ],
                        ),
                      );
                    },
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
