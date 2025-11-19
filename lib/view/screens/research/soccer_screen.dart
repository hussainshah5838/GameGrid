
// import 'package:flutter/material.dart';
// import 'package:game_grid/constants/app_colors.dart';
// import 'package:game_grid/constants/app_fonts.dart';
// import 'package:game_grid/constants/app_images.dart';
// import 'package:game_grid/constants/app_sizes.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class SoccerScreen extends StatefulWidget {
//   const SoccerScreen({Key? key}) : super(key: key);

//   @override
//   State<SoccerScreen> createState() => SoccerScreenState();
// }

// class SoccerScreenState extends State<SoccerScreen> {
//   int selectedIndex = 3; // 'Today' is often a good default
//   final List<String> tabs = [
//     'May 14',
//     'May 15',
//     'Yesterday',
//     'Today',
//     'Tomorrow',
//     'May 19',
//     'May 20',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Start the API call when the widget is first created
   
//   }

//   // Helper function to map country names from the API to your local assets
//   // since the API does not provide flag images.
//   String _getFlagForCountry(String categoryName) {
//     if (categoryName.toLowerCase().contains('brazil')) {
//       return Assets.brazilFlag;
//     } else if (categoryName.toLowerCase().contains('canada')) {
//       // You'll need to add a Canada flag to your assets
//       return Assets.usFlag; // Placeholder, replace with actual Canadian flag asset
//     } else if (categoryName.toLowerCase().contains('japan')) {
//       // You'll need to add a Japan flag to your assets
//       return Assets.chinaFlag; // Placeholder
//     }
//     return Assets.usFlag; // Default flag
//   }


//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<FootballApiResponse>(
//       future: _footballDataFuture,
//       builder: (context, snapshot) {
//         // Case 1: Waiting for data
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         // Case 2: Error occurred
//         if (snapshot.hasError) {
//           print(snapshot.error);
//           return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white),));
//         }

//         // Case 3: Data has been successfully fetched
//         if (!snapshot.hasData || snapshot.data!.scores.categories.isEmpty) {
//           return const Center(child: Text('No matches found.'));
//         }

//         final categories = snapshot.data!.scores.categories;

//         prettyLogger(categories);

//         return ListView(
//           shrinkWrap: true,
//           padding: AppSizes.ZERO,
//           physics: const BouncingScrollPhysics(),
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               height: 48,
//               decoration: BoxDecoration(
//                 color: kFillColor,
//                 border: Border(bottom: BorderSide(color: kBorderColor, width: 1)),
//               ),
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: tabs.length,
//                 padding: AppSizes.HORIZONTAL,
//                 physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 separatorBuilder: (context, index) => const SizedBox(width: 12),
//                 itemBuilder: (context, index) {
//                   final isSelected = selectedIndex == index;
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                         // NOTE: In a real app, you would re-trigger the API call here
//                         // with a different endpoint based on the selected tab.
//                         // For now, it just changes the UI state.
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 8),
//                       height: Get.height,
//                       decoration: BoxDecoration(
//                         color: isSelected ? kSecondaryColor : Colors.transparent,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       alignment: Alignment.center,
//                       child: Text(
//                         tabs[index],
//                         style: TextStyle(
//                           fontFamily: AppFonts.Satoshi,
//                           fontWeight: FontWeight.w500,
//                           color: isSelected ? kPrimaryColor : kQuaternaryColor,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: AppSizes.DEFAULT,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Favorites section remains static for now
//                   Favorites(
//                     title: 'Favorites',
//                     totalCounter: '2',
//                     child: ListView.separated(
//                       itemCount: 2,
//                       shrinkWrap: true,
//                       padding: AppSizes.ZERO,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return MatchesTile(
//                           isActive: true,
//                           onTap: () {},
//                           time: '09:45 am',
//                           team1: 'FC Barcelona',
//                           team2: 'Real Madrid',
//                           team1Logo: Assets.imagesLy,
//                           team2Logo: Assets.imagesLy,
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return const SizedBox(height: 16);
//                       },
//                     ),
//                   ),
//                   MyText(
//                     paddingTop: 12,
//                     paddingBottom: 8,
//                     text: '${categories.fold(0, (sum, cat) => sum + cat.matches.length)} Matches found',
//                     size: 12,
//                     weight: FontWeight.w500,
//                     color: kQuaternaryColor,
//                   ),
//                   ListView.separated(
//                     separatorBuilder: (context, index) => const SizedBox(height: 8),
//                     padding: AppSizes.ZERO,
//                     itemCount: categories.length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(), // Parent ListView scrolls
//                     itemBuilder: (context, categoryIndex) {
//                       final category = categories[categoryIndex];
//                       if (category.matches.isEmpty) {
//                         return const SizedBox.shrink(); // Don't show categories with no matches
//                       }
//                       return Country(
//                         countryImage: _getFlagForCountry(category.name),
//                         title: category.name,
//                         totalCounter: category.matches.length.toString(),
//                         child: ListView.separated(
//                           itemCount: category.matches.length,
//                           shrinkWrap: true,
//                           padding: AppSizes.ZERO,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, matchIndex) {
//                             final match = category.matches[matchIndex];
//                             return MatchesTile(
//                               isActive: match.status == "Live", // Example logic
//                               onTap: () => Get.to(()=> MatchDetails()),
//                               time: match.time,
//                               team1: match.localteam.name,
//                               team2: match.awayteam.name,
//                               // API does not provide logos, using placeholders
//                               team1Logo: Assets.imagesLy,
//                               team2Logo: Assets.imagesLy,
//                             );
//                           },
//                           separatorBuilder: (context, index) => const SizedBox(height: 16),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
