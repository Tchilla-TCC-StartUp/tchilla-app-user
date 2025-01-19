import 'package:flutter/material.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

class AppGlobalShowAndHideAnimation extends StatefulWidget {
  final FocusNode focusNode; // FocusNode para monitorar o foco
  final List<Widget> children; // Widgets que serão exibidos/ocultados
  final Duration duration; // Duração da animação
  final Curve curve; // Curva da animação

  const AppGlobalShowAndHideAnimation({
    Key? key,
    required this.focusNode,
    required this.children,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  _AppGlobalShowAndHideAnimationState createState() =>
      _AppGlobalShowAndHideAnimationState();
}

class _AppGlobalShowAndHideAnimationState
    extends State<AppGlobalShowAndHideAnimation>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Listener para monitorar o estado do FocusNode
    widget.focusNode.addListener(() {
      setState(() {
        _isVisible = !widget.focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      curve: widget.curve,
      clipBehavior: Clip.hardEdge, // Garante que o conteúdo fique contido
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: widget.duration,
        curve: widget.curve,
        child: _isVisible
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              )
            : const AppGlobalVericalSpacing(), // Se invisível, remove o tamanho
      ),
    );
  }
}
