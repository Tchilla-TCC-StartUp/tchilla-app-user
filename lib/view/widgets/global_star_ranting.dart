import 'package:flutter/material.dart';
import 'package:tchilla/style/colors.dart';

class AppGlobalStarRating extends StatelessWidget {
  final double value;
  final int maxStars;
  final ValueChanged<double> onChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const AppGlobalStarRating({
    super.key,
    required this.value,
    required this.onChanged,
    this.maxStars = 5,
    this.size = 40,
    this.activeColor = Colors.amberAccent,
    this.inactiveColor = gray400,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxStars, (index) {
        final starIndex = index + 1;
        IconData icon;

        if (value >= starIndex) {
          icon = Icons.star_rounded; // estrela cheia
        } else if (value >= starIndex - 0.5) {
          icon = Icons.star_half_rounded; // meia estrela
        } else {
          icon = Icons.star_border_rounded; // estrela vazia
        }

        return GestureDetector(
          onTap: () => onChanged(starIndex.toDouble()),
          child: Icon(
            icon,
            color: icon == Icons.star_border_rounded ? inactiveColor : activeColor,
            size: size,
          ),
        );
      }),
    );
  }
}

class AppGlobalStarRatingWithSlider extends StatelessWidget {
  final double value;
  final int maxStars;
  final ValueChanged<double> onChanged;
  final double iconSize;
  final double sliderHeight;
  final Color activeColor;
  final Color inactiveColor;

  const AppGlobalStarRatingWithSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.maxStars = 5,
    this.iconSize = 40,
    this.sliderHeight = 24,
    this.activeColor = Colors.amberAccent,
    this.inactiveColor = gray400,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGlobalStarRating(
          value: value,
          maxStars: maxStars,
          onChanged: onChanged,
          size: iconSize,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
        Slider(
          value: value,
          min: 0,
          max: maxStars.toDouble(),
          divisions: maxStars * 2, // permite meio em meio (0.5)
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }
}



