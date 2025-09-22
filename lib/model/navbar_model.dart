
import 'package:game_grid/constants/app_images.dart';

class BottomNavItem {
  final String icon;
  final String? iconA; 
  final String? label; 

  const BottomNavItem({
    required this.icon,
    this.iconA,
    this.label,
  });
}



final List<BottomNavItem> items = [
  BottomNavItem(
    icon: Assets.imagesResearch,
    iconA: Assets.imagesResearchA,
    label: 'Research',
  ),
  BottomNavItem(
    icon: Assets.imagesGames,
    iconA: Assets.imagesGamesA,
    label: 'Games',
  ),
  BottomNavItem(
    icon: Assets.imagesBot,
    label: null, 
  ),
  BottomNavItem(
    icon: Assets.imagesTrends,
    iconA: Assets.imagesTrendsA,
    label: 'Trends',
  ),
  BottomNavItem(
    icon: Assets.imagesTickets,
    iconA: Assets.imagesTicketsA,
    label: 'Tickets',
  ),
];
