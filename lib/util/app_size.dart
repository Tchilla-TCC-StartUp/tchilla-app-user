import 'package:responsive_sizer/responsive_sizer.dart';

double getAdaptativeWidth(double max, double medium, double min) {
  final double width = Device.width;

  if (width >= 480) {
    return max;
  } else if (width >= 360) {
    return medium;
  } else {
    return min;
  }
}

double getAdaptativeHeight(double max, double medium, double min) {
  final double height = Device.height;
  if (height >= 800) {
    return max;
  } else if (height >= 600) {
    return medium;
  } else {
    return min;
  }
}


double getAdaptativeFontSize(double large, double medium, double small) {
  final double width = Device.width;
  if (width >= 480) {
    return large;
  } else if (width >= 360) {
    return medium;
  } else {
    return small;
  }
}
