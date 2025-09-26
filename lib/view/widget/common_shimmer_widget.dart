import 'package:flutter/material.dart';
import 'package:game_grid/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CommonShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color baseColor;
  final Color highlightColor;

   const CommonShimmer({
    super.key,
    this.height,
    this.width,
    this.radius = 8.0,
    this.baseColor = Colors.black54,
    this.highlightColor = kSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor.withValues(alpha: 0.6),
      highlightColor: highlightColor.withValues(alpha: 0.4),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
    );
  }
}
