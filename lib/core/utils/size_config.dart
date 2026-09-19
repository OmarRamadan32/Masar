import 'dart:ui';

abstract class ResponsizeSizer {
  static double getResponsiveFontSize(double fontSize) {
    double scaleFactor = getScaleFactor();
    double responsiveFontSize = fontSize * scaleFactor;
    //- the Scale Limits
    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor() {
    double mobileBaseWidth = 400;
    final double physicalWidth =
        PlatformDispatcher.instance.views.first.physicalSize.width;
    final double devicePixelRatio =
        PlatformDispatcher.instance.views.first.devicePixelRatio;

    final double currentWidth = physicalWidth / devicePixelRatio;
    return currentWidth / mobileBaseWidth;
  }
}
