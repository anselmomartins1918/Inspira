import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:inspira/app/data/controllers/avaluantion_controller.dart';

class AvaluationPage extends StatefulWidget {
  final String name;
  final String team;

  const AvaluationPage({
    required this.name,
    required this.team,
    super.key,
  });

  static const List<String> types = [
    'Relevância do Problema',
    'Diferenciação da solução',
    'Alinhamento do negócio com as ODS da Agenda 2030',
    'Grau de escalabilidade, viabilidade da solução',
    'Mercado relevante e com potencial',
    'Qualidade da Validação e Problema',
    'MVP (Protótipo)',
    'Qualidade da Apresentação (clareza, emoção, design)',
  ];

  @override
  State<AvaluationPage> createState() => _AvaluationPageState();
}

class _AvaluationPageState extends State<AvaluationPage> {
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    AvaluantionController controller = AvaluantionController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF032826),
            leadingWidth: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios_new),
                  iconSize: 24.0,
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Avaliação de Equipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontSize: 24.0,
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
        child: AnimatedBuilder(
          animation: controller.actualValue$,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Você está avaliando',
                          style: TextStyle(
                            color: Color(0xFF032826),
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFF6741C),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 24.0,
                          ),
                          child: Text(
                            widget.team,
                            style: const TextStyle(
                              color: Color(0xFFF6741C),
                              fontFamily: 'Lato',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Pontuação Atribuída',
                          style: TextStyle(
                            color: Color(0xFF032826),
                            fontFamily: 'Lato',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        AnimatedBuilder(
                          animation: controller.grades$,
                          builder: (context, child) {
                            int sum = controller.grades
                                .whereType<int>()
                                .fold(0, (a, b) => a + b);

                            return Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFF6741C),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 24.0,
                              ),
                              child: Text(
                                '$sum/80pts',
                                style: const TextStyle(
                                  color: Color(0xFFF6741C),
                                  fontFamily: 'Lato',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (controller.actualValue != 8)
                        Column(
                          children: [
                            IntrinsicHeight(
                              child: SizedBox(
                                width: size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Critério ${controller.actualValue + 1}/8',
                                      style: const TextStyle(
                                        color: Color(0xFF078438),
                                        fontFamily: 'Lato',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      AvaluationPage
                                          .types[controller.actualValue],
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Color(0xFF032826),
                                        fontFamily: 'Lalo',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 32.0),
                            AnimatedBuilder(
                              animation: controller.avaluation$,
                              builder: (context, child) {
                                return CarouselSlider.builder(
                                  carouselController: carouselSliderController,
                                  itemCount: 11,
                                  itemBuilder: (context, index, ind) {
                                    return GestureDetector(
                                      onTap: () {
                                        controller.changeAvaluation(index);
                                        carouselSliderController
                                            .jumpToPage(index);
                                      },
                                      child: Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                controller.avaluation == index
                                                    ? const Color(0xFFFEEED1)
                                                    : null,
                                            border: controller.avaluation ==
                                                    index
                                                ? Border.all(
                                                    color:
                                                        const Color(0xFFF6741C))
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0,
                                          ),
                                          child: Text(
                                            '$index',
                                            style: const TextStyle(
                                              color: Color(0xFFF6741C),
                                              fontFamily: 'lato',
                                              fontSize: 120.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    enableInfiniteScroll: false,
                                    aspectRatio: 2.0,
                                    enlargeCenterPage: true,
                                    enlargeStrategy:
                                        CenterPageEnlargeStrategy.height,
                                    viewportFraction: 0.45,
                                    pageSnapping: false,
                                    onPageChanged: (index, reason) =>
                                        controller.changeAvaluation(index),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 48.0),
                          ],
                        ),
                      if (controller.actualValue == 8)
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Critério',
                                  style: TextStyle(
                                    color: Color(0xFF032826),
                                    fontFamily: 'lato',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Pontuação',
                                  style: TextStyle(
                                    color: Color(0xFF032826),
                                    fontFamily: 'lato',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.45,
                              child: ListView.separated(
                                itemCount: AvaluationPage.types.length + 1,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: index < 8
                                        ? Colors.white
                                        : const Color(0xFFFEEED1),
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          index < 8
                                              ? '${index + 1}. ${AvaluationPage.types[index]}'
                                              : 'Pontuação Total',
                                          style: const TextStyle(
                                            color: Color(0xFF032826),
                                            fontFamily: 'lato',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          index < 8
                                              ? '${controller.grades[index] ?? 0}/10pts'
                                              : '${controller.grades.whereType<int>().fold(0, (a, b) => a + b)}/80pts',
                                        ),
                                      ],
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 92.0,
                            width: size.width * 0.25,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                side: const BorderSide(
                                  color: Color(0xFFF6741C),
                                  width: 2.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Color(0xFFF6741C),
                                size: 24.0,
                              ),
                              onPressed: () {
                                if (controller.actualValue == 0) {
                                  Navigator.pop(context);
                                } else {
                                  controller.decrement();
                                  if (controller
                                          .grades[controller.actualValue] !=
                                      null) {
                                    carouselSliderController.jumpToPage(
                                        controller
                                            .grades[controller.actualValue]!);
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 92.0,
                            width: size.width * 0.6,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    (!(controller.actualValue < 8) &&
                                            !controller.verifyComplete())
                                        ? Colors.grey
                                        : const Color(0xFFF6741C),
                                side: (!(controller.actualValue < 8) &&
                                        !controller.verifyComplete())
                                    ? null
                                    : const BorderSide(
                                        color: Color(0xFFF6741C),
                                        width: 2.0,
                                      ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.actualValue != 8
                                        ? 'Próximo Critério'
                                        : 'Avaliar Equipe em ${controller.grades.whereType<int>().fold(0, (a, b) => a + b)}pts',
                                    style: const TextStyle(
                                      color: Color(0xFFF0F5F2),
                                      fontFamily: 'Lato',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFFF0F5F2),
                                    size: 24.0,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                if (controller.actualValue < 8) {
                                  controller.setValue();
                                  controller.increment();

                                  if (controller
                                          .grades[controller.actualValue] !=
                                      null) {
                                    carouselSliderController.jumpToPage(
                                        controller
                                            .grades[controller.actualValue]!);
                                  } else {
                                    carouselSliderController.jumpToPage(0);
                                  }
                                } else {
                                  if (controller.verifyComplete()) {}
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(height: 8.0),
                      SizedBox(
                        height: 40.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: AvaluationPage.types.length + 1,
                          itemBuilder: (context, index) {
                            bool isSelect =
                                index < 8 && controller.grades[index] != null;

                            return GestureDetector(
                              onTap: () {
                                controller.navigateTo(index: index);

                                if (controller.actualValue < 8) {
                                  if (controller
                                          .grades[controller.actualValue] !=
                                      null) {
                                    carouselSliderController.jumpToPage(
                                        controller
                                            .grades[controller.actualValue]!);
                                  } else {
                                    carouselSliderController.jumpToPage(0);
                                  }
                                }
                              },
                              child: Container(
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: isSelect
                                      ? const Color(0xFFC9F8C9)
                                      : index == controller.actualValue
                                          ? const Color(0xFFFEEED1)
                                          : Colors.white,
                                  border: !isSelect
                                      ? Border.all(
                                          color: index == controller.actualValue
                                              ? const Color(0xFFF6741C)
                                              : const Color(0xFF141414),
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(36.0),
                                ),
                                margin: EdgeInsets.only(
                                  left: index != 0 ? 8.0 : 0.0,
                                  bottom: 2.0,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: (index < 8 &&
                                          controller.grades[index] != null)
                                      ? 20.0
                                      : 32.0,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      index < 8
                                          ? (index + 1).toString()
                                          : 'Confirmação',
                                      style: TextStyle(
                                        color: isSelect
                                            ? const Color(0xFF035F39)
                                            : index == controller.actualValue
                                                ? const Color(0xFFF6741C)
                                                : const Color(0xFF141414),
                                      ),
                                    ),
                                    if (isSelect)
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 4.0),
                                        child: const Icon(
                                          Icons.check,
                                          color: Color(0xFF035F39),
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
