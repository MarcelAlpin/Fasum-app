// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signOut => 'Sign Out';

  @override
  String get email => 'Email';

  @override
  String get pleaseEnterValidEmail => 'Please enter a valid email';

  @override
  String get password => 'Password';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get pleaseConfirmPassword => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get fullName => 'Full Name';

  @override
  String get pleaseEnterFullName => 'Please enter your full name';

  @override
  String get noUserFound => 'No user found with that email';

  @override
  String get wrongPassword => 'Wrong password. Please try again.';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email.';

  @override
  String get invalidEmail => 'The email address is not valid.';

  @override
  String get genericError => 'An error occurred. Please try again.';

  @override
  String errorOccurred(Object error) {
    return 'An error occurred: $error';
  }

  @override
  String get reportDetail => 'Report Detail';

  @override
  String get viewFullImage => 'View full image';

  @override
  String get openInGoogleMaps => 'Open in Google Maps';

  @override
  String get unableToOpenMaps => 'Unable to open Google Maps';

  @override
  String get filterCategory => 'Filter Category';

  @override
  String get allCategories => 'All Categories';

  @override
  String get noReportsInThisCategory => 'No reports in this category.';

  @override
  String secondsAgo(Object count) {
    return '$count secs ago';
  }

  @override
  String minutesAgo(Object count) {
    return '$count mins ago';
  }

  @override
  String hoursAgo(Object count) {
    return '$count hrs ago';
  }

  @override
  String get oneDayAgo => '1 day ago';

  @override
  String get categoryJalanRusak => 'Damaged Road';

  @override
  String get categoryMarkaPudar => 'Faded Road Markings';

  @override
  String get categoryLampuMati => 'Lampu Mati';

  @override
  String get categoryTrotoarRusak => 'Damaged Sidewalk';

  @override
  String get categoryRambuRusak => 'Broken Traffic Sign';

  @override
  String get categoryJembatanRusak => 'Broken Bridge';

  @override
  String get categorySampahMenumpuk => 'Piled Garbage';

  @override
  String get categorySaluranTersumbat => 'Clogged Drain';

  @override
  String get categorySungaiTercemar => 'Polluted River';

  @override
  String get categorySampahSungai => 'River Garbage';

  @override
  String get categoryPohonTumbang => 'Fallen Tree';

  @override
  String get categoryTamanRusak => 'Damaged Park';

  @override
  String get categoryFasilitasRusak => 'Broken Facility';

  @override
  String get categoryPipaBocor => 'Leaking Pipe';

  @override
  String get categoryVandalisme => 'Vandalism';

  @override
  String get categoryBanjir => 'Flood';

  @override
  String get categoryLainnya => 'Others';

  @override
  String get addPost => 'Add Post';

  @override
  String get takePicture => 'Take a picture';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get cancel => 'Cancel';

  @override
  String get pleaseAddImageAndDescription => 'Please add an image and description.';

  @override
  String get userNotFoundPleaseSignIn => 'User not found. Please sign in.';

  @override
  String get postUploadedSuccessfully => 'Post uploaded successfully!';

  @override
  String failedToUploadPost(Object error) {
    return 'Failed to upload the post: $error';
  }

  @override
  String get locationServicesDisabled => 'Location services are disabled.';

  @override
  String get locationPermissionsDenied => 'Location permissions are denied.';

  @override
  String failedToRetrieveLocation(Object error) {
    return 'Failed to retrieve location: $error';
  }

  @override
  String failedToPickImage(Object error) {
    return 'Failed to pick image: $error';
  }

  @override
  String failedToCompressImage(Object error) {
    return 'Failed to compress image: $error';
  }

  @override
  String get generateAnotherDescription => 'Generate another description';

  @override
  String get addBriefDescription => 'Add a brief description...';

  @override
  String get post => 'Post';

  @override
  String get notificationSent => '✅ Notification sent successfully';

  @override
  String notificationFailed(Object error) {
    return '❌ Failed to send notification: $error';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get unknownLanguage => 'Unknown Language';

  @override
  String get english => 'English';

  @override
  String get indonesian => 'Indonesian';
}
