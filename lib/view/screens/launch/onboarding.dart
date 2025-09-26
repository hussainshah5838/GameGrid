import 'package:flutter/material.dart';
import 'package:game_grid/config/routes/routes.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/constants/app_sizes.dart';
import 'package:game_grid/services/onboard_service.dart';
import 'package:game_grid/view/widget/my_button_widget.dart';
import 'package:game_grid/view/widget/my_text_widget.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Smarter Betting\nStarts Here',
      'subtitle':
          'Analyze games, spot trends, and get AI-powered predictions designed for serious sports bettors.',
      'image': Assets.imagesOn1,
    },
    {
      'title': 'Deep Game Insights\nat Your Fingertips',
      'subtitle':
          'Track live stats, compare odds, and dive into detailed research customized to your favorites.',
      'image': Assets.imagesOn2,
    },
    {
      'title': 'Meet GG your\nAI Assistant',
      'subtitle':
          'Ask your smart bot anything like “What’s today’s best NBA bet?” and get real-time, data-backed answers.',
      'image': Assets.imagesOn3,
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < _pages.length - 1) {
      _controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      OnboardingService.instance.setOnboardingSeen();
      Get.offAllNamed(AppLinks.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Container(
              key: ValueKey<String>(_pages[_currentPage]['image']!),
              height: Get.height,
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_pages[_currentPage]['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 55),
              Center(child: Image.asset(Assets.imagesLogoTextual, height: 31)),
              SizedBox(height: 30),
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyText(
                          paddingLeft: 20,
                          paddingRight: 20,
                          text: _pages[index]['title']!,
                          size: 26,
                          weight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          paddingBottom: 8,
                        ),
                        MyText(
                          paddingLeft: 20,
                          paddingRight: 20,
                          text: _pages[index]['subtitle']!,
                          size: 16,
                          color: kQuaternaryColor,
                          lineHeight: 1.5,
                          paddingBottom: 30,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: AppSizes.DEFAULT,
                  child: MyButton(
                    buttonText: _currentPage == _pages.length - 1
                        ? 'Get Started'
                        : 'Continue',
                    onTap: _onNext,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
