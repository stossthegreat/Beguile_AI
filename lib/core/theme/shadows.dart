import 'package:flutter/material.dart';

class WFShadows {
  // Glass effect shadows
  static const List<BoxShadow> glass = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 18,
      offset: Offset(0, 4),
    ),
  ];

  // Button shadows
  static const List<BoxShadow> button = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  // Purple glow for special elements
  static const List<BoxShadow> purpleGlow = [
    BoxShadow(
      color: Color(0x40A855FF),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  // Card shadows
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  // Subtle shadows
  static const List<BoxShadow> subtle = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  // Soft white glow for glass cards
  static const List<BoxShadow> softWhiteGlow = [
    BoxShadow(
      color: Color(0x33FFFFFF), // white at 20% opacity
      blurRadius: 60,
      spreadRadius: -10,
      offset: Offset(0, 0),
    ),
  ];

  // Magenta button glow
  static const List<BoxShadow> magentaGlow = [
    BoxShadow(
      color: Color(0x80FF00FF), // magenta at 50% opacity
      blurRadius: 25,
      spreadRadius: -5,
      offset: Offset(0, 0),
    ),
  ];

  // Fuchsia card glow (for selected plan cards)
  static const List<BoxShadow> fuchsiaGlow = [
    BoxShadow(
      color: Color(0x66E879F9), // fuchsia at 40% opacity
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  // Emerald card glow (for yearly plan)
  static const List<BoxShadow> emeraldGlow = [
    BoxShadow(
      color: Color(0x6634D399), // emerald at 40% opacity
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  // White glow for CTA buttons
  static const List<BoxShadow> whiteGlow = [
    BoxShadow(
      color: Color(0x4DFFFFFF), // white at 30% opacity
      blurRadius: 25,
      spreadRadius: -5,
      offset: Offset(0, 0),
    ),
  ];

  // Mentor portrait glow (parameterized in code)
  static List<BoxShadow> mentorGlow(Color color) => [
    BoxShadow(
      color: color.withOpacity(0.4),
      blurRadius: 80,
      spreadRadius: 20,
    ),
    BoxShadow(
      color: color.withOpacity(0.2),
      blurRadius: 120,
      spreadRadius: 40,
    ),
  ];

  // Council portrait subtle glow
  static List<BoxShadow> councilPortraitGlow(Color color) => [
    BoxShadow(
      color: color.withOpacity(0.2),
      blurRadius: 40,
      spreadRadius: 5,
    ),
  ];
}
