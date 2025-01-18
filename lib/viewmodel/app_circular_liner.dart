import 'package:flutter/material.dart';

class CircleSeriesPainter extends CustomPainter {
  final Color circleColor; // Cor das linhas dos círculos
  final double spacing; // Espaçamento entre os círculos
  final double strokeWidth; // Espessura das linhas

  CircleSeriesPainter({
    required this.circleColor,
    this.spacing = 10.0, // Espaçamento entre os círculos
    this.strokeWidth = 2.0, // Espessura padrão das linhas
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2); // Centro do canvas
    final paint = Paint()
      ..color = circleColor
      ..strokeWidth = strokeWidth // Define a espessura das linhas
      ..style =
          PaintingStyle.stroke; // Desenha apenas o contorno (sem preenchimento)

    // Raio dos 3 círculos, com espaçamento ajustável
    final radii = [
      size.width / 8,
      size.width / 5 + spacing, // Aumenta o raio para adicionar espaçamento
      size.width / 4 + 4 * spacing, // Aumenta ainda mais o raio
    ];

    // Desenha os 3 círculos com espaçamento
    for (double radius in radii) {
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
