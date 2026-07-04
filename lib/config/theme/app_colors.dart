import 'package:flutter/material.dart';

/// Central color palette for the entire app.
///
/// Every color used across the project should be defined here and referenced
/// by its semantic name rather than hardcoded in individual widgets.
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════════════════════════════
  //  MATERIAL ALIASES
  //  Named wrappers around Colors.* so no page imports raw Material colors.
  // ═══════════════════════════════════════════════════════════════════════
  /// Also the app's card-surface and inactive-progress-bar color.
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color red = Colors.red;
  static const Color transparent = Colors.transparent;

  /// Black at 87% opacity (default "black87" text/icon color)
  static const Color textBlackPrimary = Colors.black87;

  /// Black at 54% opacity (default "black54" secondary text color)
  static const Color textBlackSecondary = Colors.black54;

  /// Black at 12% opacity (default "black12" border/shadow color)
  static const Color borderBlack12 = Colors.black12;

  // ═══════════════════════════════════════════════════════════════════════
  //  BACKGROUND
  // ═══════════════════════════════════════════════════════════════════════
  /// Scaffold / onboarding background (#F1F5F9)
  static const Color background = Color(0xFFF1F5F9);

  /// Auth screen background (#EEF5FB)
  static const Color backgroundAuth = Color(0xFFEEF5FB);

  /// Create selection gradient start (#F5F7FA)
  static const Color backgroundGradientStart = Color(0xFFF5F7FA);

  /// Create selection gradient end (#C3CFE2)
  static const Color backgroundGradientEnd = Color(0xFFC3CFE2);

  // ═══════════════════════════════════════════════════════════════════════
  //  PRIMARY GRADIENT
  // ═══════════════════════════════════════════════════════════════════════
  /// Primary blue (#4DB6FF)
  static const Color primaryBlue = Color(0xFF4DB6FF);

  /// Primary purple (#8B5CF6). Also the "selected" border/progress-active color.
  static const Color primaryPurple = Color(0xFF8B5CF6);

  // ═══════════════════════════════════════════════════════════════════════
  //  TEXT
  // ═══════════════════════════════════════════════════════════════════════
  /// Primary text (#222222)
  static const Color textPrimary = Color(0xFF222222);

  /// Secondary text (#707070)
  static const Color textSecondary = Color(0xFF707070);

  /// Onboarding title (#1A1A2E)
  static const Color textOnboardingTitle = Color(0xFF1A1A2E);

  /// Onboarding subtitle (#6B7280)
  static const Color textOnboardingSubtitle = Color(0xFF6B7280);

  /// Feature tile text (#23233C)
  static const Color textFeatureTile = Color(0xFF23233C);

  /// Gender / option text (#555555)
  static const Color textOption = Color(0xFF555555);

  /// Amber pro-tip heading text (#B07700)
  static const Color textAmber = Color(0xFFB07700);

  /// Muted meta text / icon, e.g. info row (#8A8A8E)
  static const Color textMuted = Color(0xFF8A8A8E);

  // ═══════════════════════════════════════════════════════════════════════
  //  SURFACES & CARDS
  // ═══════════════════════════════════════════════════════════════════════
  /// Feature tile background (#F5F7FB)
  static const Color surfaceFeatureTile = Color(0xFFF5F7FB);

  /// Feature icon circle background (#EDF4FF)
  static const Color surfaceIconCircle = Color(0xFFEDF4FF);

  /// Create icon badge background (#EDF1F7)
  static const Color surfaceIconBadge = Color(0xFFEDF1F7);

  /// Inactive progress step (#E9EEF3)
  static const Color surfaceProgressInactive = Color(0xFFE9EEF3);

  /// Sparkle circle background (#F3E8FF)
  static const Color surfaceSparkle = Color(0xFFF3E8FF);

  /// Pro-tip box background (#FDF2F8)
  static const Color surfaceProTip = Color(0xFFFDF2F8);

  /// Cancel button background (#EEF3F8)
  static const Color surfaceCancelButton = Color(0xFFEEF3F8);

  /// White at 80% opacity (frosted card)
  static const Color surfaceWhite80 = Color(0xCCFFFFFF);

  /// White at 50% opacity (frosted card bg)
  static const Color surfaceWhite50 = Color(0x80FFFFFF);

  /// Light blue left (#D0EBFF, animated background)
  static const Color surfaceLightBlueLeft = Color(0xFFD0EBFF);

  /// Light blue right (#E8F4FF, animated background)
  static const Color surfaceLightBlueRight = Color(0xFFE8F4FF);

  /// Inactive chip / attendee-count pill background (#F0F0F0)
  /// Also used for the QR badge and other light-gray round icon badges.
  static const Color surfaceChipInactive = Color(0xFFF0F0F0);

  // ═══════════════════════════════════════════════════════════════════════
  //  BORDERS
  // ═══════════════════════════════════════════════════════════════════════
  /// Default border (#E6E6E6). Also covers feature-tile and event-card borders.
  static const Color border = Color(0xFFE6E6E6);

  /// Dashed placeholder border (#D8DCE6)
  static const Color borderDashed = Color(0xFFD8DCE6);

  /// Pro-tip box border (#F3D9EE)
  static const Color borderProTip = Color(0xFFF3D9EE);

  /// White border at 40% opacity
  static const Color borderWhite40 = Color(0x66FFFFFF);

  /// Black border at 10% opacity
  static const Color borderBlack10 = Color(0x1A000000);

  /// Amber border at 20% opacity
  static const Color borderAmber20 = Color(0x33FFB300);

  /// Radio / checkbox border (#A8A8A8)
  static const Color borderRadio = Color(0xFFA8A8A8);

  // ═══════════════════════════════════════════════════════════════════════
  //  ICONS
  // ═══════════════════════════════════════════════════════════════════════
  /// Default icon (#767676). Also covers the location-pin icon.
  static const Color icon = Color(0xFF767676);

  /// Hint / upload placeholder icon (#B4B4B4)
  static const Color iconHint = Color(0xFFB4B4B4);

  /// Upload placeholder frame (#B8C0CC)
  static const Color iconPlaceholderFrame = Color(0xFFB8C0CC);

  /// Feature list icon (#4AA7FF)
  static const Color iconFeature = Color(0xFF4AA7FF);

  /// Facebook brand (#1877F2)
  static const Color iconFacebook = Color(0xFF1877F2);

  /// Amber lightbulb icon (#FFB300)
  static const Color iconAmber = Color(0xFFFFB300);

  /// Info / pro-tip accent (#C026D3)
  static const Color iconInfo = Color(0xFFC026D3);

  // ═══════════════════════════════════════════════════════════════════════
  //  SELECTION & ACCENTS
  // ═══════════════════════════════════════════════════════════════════════
  /// Checkbox / radio active color (#2F9BFF)
  static const Color activeBlue = Color(0xFF2F9BFF);

  /// Check icon / checkbox color (#2F80ED)
  static const Color check = Color(0xFF2F80ED);

  /// Event accent blue (#3B82F6)
  static const Color accentEvent = Color(0xFF3B82F6);

  /// Community accent green (#22C55E)
  static const Color accentCommunity = Color(0xFF22C55E);

  // ═══════════════════════════════════════════════════════════════════════
  //  GRADIENT COLORS (individual stops)
  // ═══════════════════════════════════════════════════════════════════════

  // --- Onboarding final screen ---
  /// Final screen gradient blue (#5EC6FF)
  static const Color gradientFinalBlue = Color(0xFF5EC6FF);
  /// Final screen gradient purple (#9658FF)
  static const Color gradientFinalPurple = Color(0xFF9658FF);

  // --- Onboarding button ---
  /// Button gradient cyan-blue (#5AC8FA)
  static const Color gradientButtonCyan = Color(0xFF5AC8FA);
  /// Button gradient purple (#9B59F5)
  static const Color gradientButtonPurple = Color(0xFF9B59F5);

  // --- Onboarding progress ---
  /// Progress gradient start (#45B7FF)
  static const Color gradientProgressStart = Color(0xFF45B7FF);

  // --- Notification allow button ---
  /// Allow button cyan (#62CCFF)
  static const Color gradientAllowCyan = Color(0xFF62CCFF);
  /// Allow button pink (#C35CFF)
  static const Color gradientAllowPink = Color(0xFFC35CFF);
  /// Allow button purple (#705CF6)
  static const Color gradientAllowPurple = Color(0xFF705CF6);

  // --- FAB (bottom nav) ---
  /// FAB gradient purple (#8663F6)
  static const Color gradientFabPurple = Color(0xFF8663F6);
  /// FAB gradient pink (#C470F5)
  static const Color gradientFabPink = Color(0xFFC470F5);
  /// FAB gradient blue (#57C2FF)
  static const Color gradientFabBlue = Color(0xFF57C2FF);

  // --- Splash / intro background ---
  /// Intro background cyan (#5ECFFF)
  static const Color gradientIntroCyan = Color(0xFF5ECFFF);
  /// Intro background periwinkle (#6B7FFF)
  static const Color gradientIntroPeriwinkle = Color(0xFF6B7FFF);

  // --- Event / Community cards ---
  /// Event card pink (#EC4899)
  static const Color gradientEventPink = Color(0xFFEC4899);
  /// Event card purple (#A855F7)
  static const Color gradientEventPurple = Color(0xFFA855F7);
  /// Event card light pink (#F472B6)
  static const Color gradientEventLightPink = Color(0xFFF472B6);
  /// Event card light purple (#C084FC)
  static const Color gradientEventLightPurple = Color(0xFFC084FC);
  /// Community card cyan (#67E8F9)
  static const Color gradientCommunityCyan = Color(0xFF67E8F9);
  /// Community card blue (#60A5FA)
  static const Color gradientCommunityBlue = Color(0xFF60A5FA);

  // --- Create post "add" button ---
  /// Add button gradient blue (#4F8EF7)
  static const Color gradientAddButtonBlue = Color(0xFF4F8EF7);
  /// Add button gradient purple (#8E54E9)
  static const Color gradientAddButtonPurple = Color(0xFF8E54E9);

  // ═══════════════════════════════════════════════════════════════════════
  //  SHADOWS
  // ═══════════════════════════════════════════════════════════════════════
  /// Black at 8% opacity (#14000000)
  static const Color shadowBlack8 = Color(0x14000000);

  /// Blue glow (#804CBBFF)
  static const Color shadowBlue = Color(0x804CBBFF);

  /// Amber glow at 8% (#14FFB300)
  static const Color shadowAmber8 = Color(0x14FFB300);
}