import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class AppGlobalBorderButton extends StatelessWidget {
  const AppGlobalBorderButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.minWidth,
    required this.textButton,
  });

  final void Function()? onPressed;
  final double? minWidth;
  final String textButton;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 800), // Transição suave
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: isLoading
          ? Center(
              key: const ValueKey<int>(1),
              child: Container(
                width: 150.px,
                height: 55.px,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.px),
                  border: Border.all(color: primary950, width: 1),
                ),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: primary950,
                  semanticsLabel: "Carregando...",
                ),
              ),
            )
          : MaterialButton(
              key: const ValueKey<int>(2),
              color: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              elevation: 0,
              minWidth: minWidth,
              height: 55.px,
              onPressed:
                  isLoading ? null : onPressed, // Evita múltiplos cliques
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.px),
                side: const BorderSide(
                  color: primary950,
                  width: 1,
                ),
              ),
              child: AppGlobalText(
                text: textButton,
                style: TextStyleEnum.h3_bold,
                color: primary950,
              ),
            ),
    );
  }
}
