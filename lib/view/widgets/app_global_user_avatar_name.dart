import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tchilla/style/colors.dart';

class AppGlobalUserAvatarName extends StatelessWidget {
  final String name;
  final double size;

  const AppGlobalUserAvatarName({
    super.key,
    required this.name,
    this.size = 40,
  });

  Color _getColorFromName(String name) {
    List<Color> colors = [
      Colors.red.shade600,
      Colors.blue.shade600,
      Colors.green.shade600,
      Colors.orange.shade600,
      Colors.purple.shade600,
      Colors.teal.shade600,
      Colors.pink.shade600,
      Colors.indigo.shade600,
      Colors.amber.shade600,
      Colors.brown.shade600
    ];
    int index = name.isNotEmpty ? name.codeUnitAt(0) % colors.length : 0;
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    String initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: _getColorFromName(name),
      child: Text(
        initial,
        style: GoogleFonts.inter(
          fontSize: size * 0.5,
          fontWeight: FontWeight.w500,
          color: primary50,
        ),
      ),
    );
  }
}
