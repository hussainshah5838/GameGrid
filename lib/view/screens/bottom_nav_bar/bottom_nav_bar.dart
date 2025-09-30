import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:game_grid/constants/app_images.dart';
import 'package:game_grid/model/navbar_model.dart';
import 'package:game_grid/view/screens/games/games.dart';
import 'package:game_grid/view/screens/gpt/gpt.dart';
import 'package:game_grid/view/screens/gpt/gpt_drawer.dart';
import 'package:game_grid/view/screens/research/research.dart';
import 'package:game_grid/view/screens/tickets/tickets.dart';
import 'package:game_grid/view/screens/trends/trends.dart';
import 'package:game_grid/view/widget/custom_app_bar.dart';
import 'package:game_grid/view/widget/custom_container_widget.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  void _getCurrentIndex(int index) => setState(() {
    _currentIndex = index;
  });
  

  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      Research(),
      Games(),
      GPT(),
      Trends(),
      Tickets(),
    ];
    return CustomContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _key,
        drawer: GptDrawer(),
        appBar: _currentIndex == 2
            ? simpleAppBar(
                title: 'AI Assistant',
                leadingWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _key.currentState?.openDrawer();
                      },
                      child: Image.asset(Assets.imagesGptDrawer, height: 40),
                    ),
                  ],
                ),
              )
            : null,
        body: _screens[_currentIndex],
        bottomNavigationBar: _buildNavBar(items),
      ),
    );
  }

  Stack _buildNavBar(List<BottomNavItem> _items) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: Container(
           
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: kTertiaryColor.withValues(alpha: 0.08),
                    width: 1,
                  ),
                ),
                color: Color(0xff272924).withValues(alpha: .8),
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                  color: kTertiaryColor,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  color: kTertiaryColor.withValues(alpha: 0.6),
                ),
                selectedFontSize: 12,
                unselectedFontSize: 12,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.transparent,
                selectedItemColor: kTertiaryColor,
                unselectedItemColor: kTertiaryColor.withValues(alpha: 0.6),
                currentIndex: _currentIndex,
                onTap: (index) => _getCurrentIndex(index),
                items: List.generate(_items.length, (index) {
                  var data = _items[index];

                   if (index == 2) {
  return BottomNavigationBarItem(
    icon: Transform.translate(
      offset: const Offset(0, 6), 
      child: Image.asset(
        data.icon,
        width: 52,
        height: 52,
      ),
    ),
    label: "", // no label
  );
}

                 return BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Image.asset(
                      _currentIndex == index && data.iconA != null
                          ? data.iconA!
                          : data.icon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  label: data.label ?? "",
                );
            
                }),
              ),
            ),
          ),
        ),
      
      ],
    );
  }
}
