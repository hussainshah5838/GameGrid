import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String heading;
  final String subtitle;
  final double headingSize;
  final double subtitleSize;
  final EdgeInsetsGeometry? padding;

  const SectionHeading({
    Key? key,
    required this.heading,
    required this.subtitle,
    this.headingSize = 22,
    this.subtitleSize = 14,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              fontSize: headingSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(fontSize: subtitleSize, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
