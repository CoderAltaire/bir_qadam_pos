
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppKeys {
  const AppKeys._();
  // LOGIN SCREEN KEYS
  static const Key loginInput = ValueKey('login_input');
  static const Key loginButton = ValueKey('login_button');
  static const Key loginPrivacy = ValueKey('login_privacy');
  static const Key loginPolicy = ValueKey('login_policy');

  // VERIFY SCREEN KEYS
  static const Key verifyOtpInput = ValueKey('verify_otp_input');
  static const Key verifyClearButton = ValueKey('verify_clear_button');
  static const Key verifyContiueButton = ValueKey('verify_continue_button');

  // COMPLETED SCREEN KEYS
  static const Key completeNameInput = ValueKey('complete_name_input');
  static const Key completeLastnameInput = ValueKey('complete_lastname_input');
  static const Key completeDateInput = ValueKey('complete_date_input');
  static const Key completeGenderInput = ValueKey('complete_gender_input');
  static const Key completeButton = ValueKey('complete_button');

  // PINCODE SCREEN
  static const Key pincodeClearButton = ValueKey('pincode_clear_button');
  static const Key pincodeFingerprintButton =
      ValueKey('pincode_fingerprint_button');

  // HOME PAGE
  static const Key personalCard = ValueKey('personal_card');
  static const Key newsButton = ValueKey('news_button');
  static const Key appDrawer =ValueKey('app_drawer');
  static const Key tabBonus = ValueKey('tab_bonus');
  static const Key tabPurchase = ValueKey('tab_purchase');
  static const Key homeRefresh = ValueKey('home_refresh');
  static const Key homeBanner = ValueKey('home_banner');
  static const Key barcodeButton = ValueKey('barcode_button');

  // BOTTOM NAVIGATION BAR
  static const Key bottomHome = ValueKey('bottom_home');
  static const Key bottomBranch = ValueKey('bottom_branch');
  static const Key bottomProducts = ValueKey('bottom_products');
  static const Key bottomProfile = ValueKey('bottom_profile');

  // FEEDBACK
  static const Key feedbackMessage = ValueKey('feedback_message');
  static const Key feedbackType = ValueKey('feedback_type');
  static const Key feedbackBranch = ValueKey('feedback_branch');
  static const Key feedbackFile = ValueKey('feedback_file');
  static const Key feedbackSend = ValueKey('feedback_send');

  // PROFILE
  static const Key profileLogoutButton = ValueKey('profile_logout_button');
  static const Key profileSettings = ValueKey('profile_settings');
  static const Key profileAbout = ValueKey('profile_about');
  static const Key profileShare = ValueKey('profile_share');
  static const Key profileRate = ValueKey('profile_rate');
  static const Key profileMapAddress = ValueKey('profile_address');

  static const Key profileFeedback = ValueKey('profile_feedback');
  static const Key profilePolicy = ValueKey('profile_policy');


  // SETTINGS
  static const Key settingsUpdateProfile = ValueKey('settings_update_profile');
  static const Key settingsUpdatePincode = ValueKey('settings_update_pincode');
  static const Key settingsDeletePincode = ValueKey('settings_delete_pincode');
  static const Key settingsSelectLanguage = ValueKey('settings_select_lang');

  // DIALOGS
  static const Key dialogYes = ValueKey('dialog_yes');
  static const Key dialogNo = ValueKey('dialog_no');
}
