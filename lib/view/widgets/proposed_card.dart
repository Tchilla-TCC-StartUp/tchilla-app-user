import 'package:flutter/material.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/view/widgets/combo_card.dart';
import 'package:tchilla/view/widgets/local_card.dart';
import 'package:tchilla/view/widgets/product_card.dart';
import 'package:tchilla/view/widgets/service_card.dart';

class ProposedCard extends StatelessWidget {
  final ProposedModel proposed;
  final void Function()? onClick;

  const ProposedCard({
    super.key,
    this.onClick,
    required this.proposed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: _buildCard(proposed: proposed),
    );
  }

  _buildCard({required ProposedModel proposed}) {
    switch (proposed.type!) {
      case ProposedType.local:
        return LocalCard(
          proposed: proposed,
        );
      case ProposedType.service:
        return ServiceCard(
          proposed: proposed,
        );
      case ProposedType.combo:
        return ComboCard(
          proposed: proposed,
        );
      case ProposedType.product:
        return ProductCard(
          proposed: proposed,
        );
    }
  }
}
