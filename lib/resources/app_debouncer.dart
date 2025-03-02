import 'dart:async';
import 'dart:ui';

class AppDebouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? timer;
  AppDebouncer({
    required this.milliseconds,
    this.action,
    this.timer,
  });

  void run(VoidCallback action) {
    if (null != timer) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
