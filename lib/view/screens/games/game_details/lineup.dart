import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_fonts.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/main.dart';
import 'package:game_grid/view/widget/common_image_view_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get.dart';

class Lineup extends StatefulWidget {
  const Lineup({super.key});

  @override
  State<Lineup> createState() => _LineupState();
}

class _LineupState extends State<Lineup> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabs = [
      {'icon': Assets.imagesFc, 'title': 'FC Barcelona'},
      {'icon': Assets.imagesRd, 'title': 'Real Madrid'},
    ];
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT,
      physics: BouncingScrollPhysics(),
      children: [
        Row(
          spacing: 10,
          children: List.generate(2, (index) {
            final isSelected = selectedIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? kSecondaryColor.withValues(alpha: 0.1)
                        : kFillColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.0,
                      color: selectedIndex == index
                          ? kSecondaryColor
                          : kBorderColor,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 6,
                    children: [
                      Image.asset(tabs[index]['icon'], height: 24),
                      Text(
                        tabs[index]['title'],
                        style: TextStyle(
                          fontFamily: AppFonts.Satoshi,
                          color: kTertiaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 2),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        selectedIndex == 0 ? _Team1() : _Team2(),
      ],
    );
  }
}

class _Team1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(child: Image.asset(Assets.imagesGoal, height: 70)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: _PlayerMarker(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return _PlayerMarker();
                }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) {
                  return _PlayerMarker(isYellow: true);
                }),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return _PlayerMarker(isYellow: index != 0);
                }),
              ),
              SizedBox(height: 25),
              Center(child: Image.asset(Assets.imagesD, height: 50)),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Coaches', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kBorderColor, width: 1.0),
                          ),
                          child: Center(
                            child: CommonImageView(
                              height: Get.height,
                              width: Get.width,
                              radius: 100,
                              url: dummyImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        MyText(
                          paddingTop: 6,
                          text: 'M. Stegen',
                          size: 10,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Players on Bench', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 60,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(6, (i) {
                    final List<Map<String, String>> benchPlayers = [
                      {'goals': '7', 'name': 'L. Messi', 'role': 'Attacker'},
                      {'goals': '5', 'name': 'G. Piqué', 'role': 'Defender'},
                      {
                        'goals': '3',
                        'name': 'S. Busquets',
                        'role': 'Midfielder',
                      },
                      {'goals': '2', 'name': 'A. Fati', 'role': 'Attacker'},
                      {'goals': '1', 'name': 'J. Alba', 'role': 'Defender'},
                      {
                        'goals': '4',
                        'name': 'F. De Jong',
                        'role': 'Midfielder',
                      },
                    ];

                    final player = benchPlayers[i];
                    return _PlayerOnBench(
                      isYellow: i == 1,
                      goals: player['goals']! + ' ',
                      name: player['name'],
                      role: player['role'],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Injuries', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 50,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    final List<Map<String, String>> injuredPlayers = [
                      {
                        'name': 'McGuire',
                        'injury': 'Shoulder Injury',
                        'dateInjured': 'Mid August 2025',
                      },
                      {
                        'name': 'Callender',
                        'injury': 'Hernia',
                        'dateInjured': 'Mid August 2025',
                      },
                      {
                        'name': 'Gerbet',
                        'injury': 'Hamstring Injury',
                        'dateInjured': 'A few days',
                      },
                    ];

                    final name = injuredPlayers[index]['name']!;
                    final injury = injuredPlayers[index]['injury']!;
                    final dateInjured = injuredPlayers[index]['dateInjured']!;
                    return _InjuredPlayer(
                      image: dummyImg,
                      name: name,
                      injury: injury,
                      dateInjured: dateInjured,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Team2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.VERTICAL,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            children: [
              Center(child: Image.asset(Assets.imagesGoal, height: 70)),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return _PlayerMarker();
                }),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) {
                  return _PlayerMarker(isYellow: true);
                }),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return _PlayerMarker(isYellow: index != 0);
                }),
              ),
              SizedBox(height: 25),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(child: Image.asset(Assets.imagesD, height: 50)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _PlayerMarker(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Coaches', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(2, (index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kBorderColor, width: 1.0),
                          ),
                          child: Center(
                            child: CommonImageView(
                              height: Get.height,
                              width: Get.width,
                              radius: 100,
                              url: dummyImg,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        MyText(
                          paddingTop: 6,
                          text: 'M. Stegen',
                          size: 10,
                          weight: FontWeight.w500,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Players on Bench', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 60,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(6, (i) {
                    final List<Map<String, String>> benchPlayers = [
                      {'goals': '7', 'name': 'L. Messi', 'role': 'Attacker'},
                      {'goals': '5', 'name': 'G. Piqué', 'role': 'Defender'},
                      {
                        'goals': '3',
                        'name': 'S. Busquets',
                        'role': 'Midfielder',
                      },
                      {'goals': '2', 'name': 'A. Fati', 'role': 'Attacker'},
                      {'goals': '1', 'name': 'J. Alba', 'role': 'Defender'},
                      {
                        'goals': '4',
                        'name': 'F. De Jong',
                        'role': 'Midfielder',
                      },
                    ];

                    final player = benchPlayers[i];
                    return _PlayerOnBench(
                      isYellow: i == 1,
                      goals: player['goals']! + ' ',
                      name: player['name'],
                      role: player['role'],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kFillColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBorderColor, width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyText(text: 'Injuries', weight: FontWeight.w700),
              Container(
                height: 1,
                color: kBorderColor,
                margin: EdgeInsets.symmetric(vertical: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 50,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(3, (index) {
                    final List<Map<String, String>> injuredPlayers = [
                      {
                        'name': 'McGuire',
                        'injury': 'Shoulder Injury',
                        'dateInjured': 'Mid August 2025',
                      },
                      {
                        'name': 'Callender',
                        'injury': 'Hernia',
                        'dateInjured': 'Mid August 2025',
                      },
                      {
                        'name': 'Gerbet',
                        'injury': 'Hamstring Injury',
                        'dateInjured': 'A few days',
                      },
                    ];

                    final name = injuredPlayers[index]['name']!;
                    final injury = injuredPlayers[index]['injury']!;
                    final dateInjured = injuredPlayers[index]['dateInjured']!;
                    return _InjuredPlayer(
                      image: dummyImg,
                      name: name,
                      injury: injury,
                      dateInjured: dateInjured,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayerMarker extends StatelessWidget {
  const _PlayerMarker({this.isYellow = false});
  final bool? isYellow;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kBorderColor, width: 1.0),
              ),
              child: Center(
                child: CommonImageView(
                  height: Get.height,
                  width: Get.width,
                  radius: 100,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: isYellow! ? kYellowColor2 : kGreenColor3,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: MyText(
                    text: '6.32',
                    size: 8,
                    weight: FontWeight.w700,
                    paddingTop: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        MyText(
          paddingTop: 6,
          text: 'M. Stegen',
          size: 10,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _PlayerOnBench extends StatelessWidget {
  const _PlayerOnBench({
    this.isYellow = false,
    this.goals,
    this.name,
    this.role,
  });
  final bool? isYellow;
  final String? goals;
  final String? name;
  final String? role;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kBorderColor, width: 1.0),
              ),
              child: Center(
                child: CommonImageView(
                  height: Get.height,
                  width: Get.width,
                  radius: 100,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              left: -22,
              top: 0,
              child: Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(
                    text: '83’',
                    color: kGreenColor3,
                    size: 10,
                    weight: FontWeight.w500,
                  ),
                  Image.asset(Assets.imagesArrowNextPlayer, height: 16),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: -10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: isYellow! ? kYellowColor2 : kGreenColor3,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: MyText(
                    text: '6.32',
                    size: 8,
                    weight: FontWeight.w700,
                    paddingTop: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(
              text: goals ?? '',
              size: 10,
              color: kTertiaryColor.withValues(alpha: 0.5),
              weight: FontWeight.w500,
            ),
            MyText(text: name ?? '', size: 10, weight: FontWeight.w500),
          ],
        ),
        MyText(
          text: role ?? '',
          size: 10,
          textAlign: TextAlign.center,
          weight: FontWeight.w500,
          color: kTertiaryColor.withValues(alpha: 0.6),
        ),
      ],
    );
  }
}

class _InjuredPlayer extends StatelessWidget {
  final String image;
  final String name;
  final String injury;
  final String dateInjured;

  const _InjuredPlayer({
    required this.image,
    required this.name,
    required this.injury,
    required this.dateInjured,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kBorderColor, width: 1.0),
              ),
              child: Center(
                child: CommonImageView(
                  height: Get.height,
                  width: Get.width,
                  radius: 100,
                  url: dummyImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(Assets.imagesInjury, height: 16),
            ),
          ],
        ),
        SizedBox(height: 6),
        MyText(
          text: name,
          size: 10,
          color: kTertiaryColor.withValues(alpha: 0.5),
          weight: FontWeight.w500,
        ),
        MyText(text: injury, size: 10, weight: FontWeight.w500),
        MyText(
          text: dateInjured,
          size: 10,
          weight: FontWeight.w500,
          color: kTertiaryColor.withValues(alpha: 0.6),
        ),
      ],
    );
  }
}
