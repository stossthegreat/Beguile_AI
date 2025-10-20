import 'package:flutter/material.dart';
import 'colors.dart';

class WFGradients {
  static const LinearGradient beguileGradient = LinearGradient(
    colors: WFColors.beguileGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: WFColors.buttonGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [
      Color(0xFF7C3AED), // purple-600
      Color(0xFF8B5CF6), // purple-500
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Onboarding slide gradients (Dark Psych Theme)
  static const LinearGradient onboardingSlide1 = LinearGradient(
    colors: [Color(0xFFDC2626), Color(0xFFE11D48), Color(0xFFC026D3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient onboardingSlide2 = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFF7C3AED), Color(0xFFEF4444)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient onboardingSlide3 = LinearGradient(
    colors: [Color(0xFF6D28D9), Color(0xFFA855F7), Color(0xFFE11D48)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient onboardingSlide4 = LinearGradient(
    colors: [Color(0xFFE11D48), Color(0xFFD946EF), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient onboardingSlide5 = LinearGradient(
    colors: [Color(0xFFEF4444), Color(0xFF8B5CF6), Color(0xFFC026D3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient onboardingSlide6 = LinearGradient(
    colors: [Color(0xFFE879F9), Color(0xFF8B5CF6), Color(0xFF34D399)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Explode animation gradient
  static const LinearGradient explodeGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFD946EF), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient text for titles
  static const LinearGradient titleGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFA7F3D0), Color(0xFFFBCAFE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Paywall background gradient
  static const LinearGradient paywallBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF05070A), Color(0xFF0B0F15), Color(0xFF05070A)],
    stops: [0.0, 0.5, 1.0],
  );

  // CTA button gradient
  static const LinearGradient ctaButton = LinearGradient(
    colors: [Color(0xFF34D399), Color(0xFFE879F9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Plan card gradients
  static const LinearGradient monthlyPlan = LinearGradient(
    colors: [Color(0xFFC026D3), Color(0xFF7C3AED)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient yearlyPlan = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF14B8A6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Council reveal background
  static const RadialGradient councilBackground = RadialGradient(
    colors: [Color(0xFF1A0A2E), Color(0xFF000000)],
    center: Alignment.center,
    radius: 1.0,
  );

  // "THE COUNCIL" text gradient
  static const LinearGradient councilTextGradient = LinearGradient(
    colors: [Color(0xFF34D399), Color(0xFFE879F9), Color(0xFF8B5CF6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
