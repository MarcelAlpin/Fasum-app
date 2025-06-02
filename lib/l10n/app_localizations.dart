import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @signIn.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In id, this message translates to:
  /// **'Daftar'**
  String get signUp;

  /// No description provided for @signOut.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get signOut;

  /// No description provided for @email.
  ///
  /// In id, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @pleaseEnterValidEmail.
  ///
  /// In id, this message translates to:
  /// **'Silakan masukkan email yang valid'**
  String get pleaseEnterValidEmail;

  /// No description provided for @password.
  ///
  /// In id, this message translates to:
  /// **'Kata Sandi'**
  String get password;

  /// No description provided for @pleaseEnterPassword.
  ///
  /// In id, this message translates to:
  /// **'Silakan masukkan kata sandi Anda'**
  String get pleaseEnterPassword;

  /// No description provided for @passwordTooShort.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi harus terdiri dari minimal 6 karakter'**
  String get passwordTooShort;

  /// No description provided for @confirmPassword.
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi Kata Sandi'**
  String get confirmPassword;

  /// No description provided for @pleaseConfirmPassword.
  ///
  /// In id, this message translates to:
  /// **'Silakan konfirmasi kata sandi Anda'**
  String get pleaseConfirmPassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi tidak cocok'**
  String get passwordsDoNotMatch;

  /// No description provided for @dontHaveAccount.
  ///
  /// In id, this message translates to:
  /// **'Belum punya akun?'**
  String get dontHaveAccount;

  /// No description provided for @fullName.
  ///
  /// In id, this message translates to:
  /// **'Nama Lengkap'**
  String get fullName;

  /// No description provided for @pleaseEnterFullName.
  ///
  /// In id, this message translates to:
  /// **'Silakan masukkan nama lengkap Anda'**
  String get pleaseEnterFullName;

  /// No description provided for @noUserFound.
  ///
  /// In id, this message translates to:
  /// **'Pengguna dengan email tersebut tidak ditemukan'**
  String get noUserFound;

  /// No description provided for @wrongPassword.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi salah. Silakan coba lagi.'**
  String get wrongPassword;

  /// No description provided for @weakPassword.
  ///
  /// In id, this message translates to:
  /// **'Kata sandi yang diberikan terlalu lemah.'**
  String get weakPassword;

  /// No description provided for @emailAlreadyInUse.
  ///
  /// In id, this message translates to:
  /// **'Akun dengan email tersebut sudah ada.'**
  String get emailAlreadyInUse;

  /// No description provided for @invalidEmail.
  ///
  /// In id, this message translates to:
  /// **'Alamat email tidak valid.'**
  String get invalidEmail;

  /// No description provided for @genericError.
  ///
  /// In id, this message translates to:
  /// **'Terjadi kesalahan. Silakan coba lagi.'**
  String get genericError;

  /// No description provided for @errorOccurred.
  ///
  /// In id, this message translates to:
  /// **'Terjadi kesalahan: {error}'**
  String errorOccurred(Object error);

  /// No description provided for @reportDetail.
  ///
  /// In id, this message translates to:
  /// **'Detail Laporan'**
  String get reportDetail;

  /// No description provided for @viewFullImage.
  ///
  /// In id, this message translates to:
  /// **'Lihat gambar penuh'**
  String get viewFullImage;

  /// No description provided for @openInGoogleMaps.
  ///
  /// In id, this message translates to:
  /// **'Buka di Google Maps'**
  String get openInGoogleMaps;

  /// No description provided for @unableToOpenMaps.
  ///
  /// In id, this message translates to:
  /// **'Tidak bisa membuka Google Maps'**
  String get unableToOpenMaps;

  /// No description provided for @filterCategory.
  ///
  /// In id, this message translates to:
  /// **'Filter Kategori'**
  String get filterCategory;

  /// No description provided for @allCategories.
  ///
  /// In id, this message translates to:
  /// **'Semua Kategori'**
  String get allCategories;

  /// No description provided for @noReportsInThisCategory.
  ///
  /// In id, this message translates to:
  /// **'Tidak ada laporan untuk kategori ini.'**
  String get noReportsInThisCategory;

  /// No description provided for @secondsAgo.
  ///
  /// In id, this message translates to:
  /// **'{count} detik yang lalu'**
  String secondsAgo(Object count);

  /// No description provided for @minutesAgo.
  ///
  /// In id, this message translates to:
  /// **'{count} menit yang lalu'**
  String minutesAgo(Object count);

  /// No description provided for @hoursAgo.
  ///
  /// In id, this message translates to:
  /// **'{count} jam yang lalu'**
  String hoursAgo(Object count);

  /// No description provided for @oneDayAgo.
  ///
  /// In id, this message translates to:
  /// **'1 hari yang lalu'**
  String get oneDayAgo;

  /// No description provided for @categoryJalanRusak.
  ///
  /// In id, this message translates to:
  /// **'Jalan Rusak'**
  String get categoryJalanRusak;

  /// No description provided for @categoryMarkaPudar.
  ///
  /// In id, this message translates to:
  /// **'Marka Pudar'**
  String get categoryMarkaPudar;

  /// No description provided for @categoryLampuMati.
  ///
  /// In id, this message translates to:
  /// **'Lampu Mati'**
  String get categoryLampuMati;

  /// No description provided for @categoryTrotoarRusak.
  ///
  /// In id, this message translates to:
  /// **'Trotoar Rusak'**
  String get categoryTrotoarRusak;

  /// No description provided for @categoryRambuRusak.
  ///
  /// In id, this message translates to:
  /// **'Rambu Rusak'**
  String get categoryRambuRusak;

  /// No description provided for @categoryJembatanRusak.
  ///
  /// In id, this message translates to:
  /// **'Jembatan Rusak'**
  String get categoryJembatanRusak;

  /// No description provided for @categorySampahMenumpuk.
  ///
  /// In id, this message translates to:
  /// **'Sampah Menumpuk'**
  String get categorySampahMenumpuk;

  /// No description provided for @categorySaluranTersumbat.
  ///
  /// In id, this message translates to:
  /// **'Saluran Tersumbat'**
  String get categorySaluranTersumbat;

  /// No description provided for @categorySungaiTercemar.
  ///
  /// In id, this message translates to:
  /// **'Sungai Tercemar'**
  String get categorySungaiTercemar;

  /// No description provided for @categorySampahSungai.
  ///
  /// In id, this message translates to:
  /// **'Sampah Sungai'**
  String get categorySampahSungai;

  /// No description provided for @categoryPohonTumbang.
  ///
  /// In id, this message translates to:
  /// **'Pohon Tumbang'**
  String get categoryPohonTumbang;

  /// No description provided for @categoryTamanRusak.
  ///
  /// In id, this message translates to:
  /// **'Taman Rusak'**
  String get categoryTamanRusak;

  /// No description provided for @categoryFasilitasRusak.
  ///
  /// In id, this message translates to:
  /// **'Fasilitas Rusak'**
  String get categoryFasilitasRusak;

  /// No description provided for @categoryPipaBocor.
  ///
  /// In id, this message translates to:
  /// **'Pipa Bocor'**
  String get categoryPipaBocor;

  /// No description provided for @categoryVandalisme.
  ///
  /// In id, this message translates to:
  /// **'Vandalisme'**
  String get categoryVandalisme;

  /// No description provided for @categoryBanjir.
  ///
  /// In id, this message translates to:
  /// **'Banjir'**
  String get categoryBanjir;

  /// No description provided for @categoryLainnya.
  ///
  /// In id, this message translates to:
  /// **'Lainnya'**
  String get categoryLainnya;

  /// No description provided for @addPost.
  ///
  /// In id, this message translates to:
  /// **'Tambah Laporan'**
  String get addPost;

  /// No description provided for @takePicture.
  ///
  /// In id, this message translates to:
  /// **'Ambil Foto'**
  String get takePicture;

  /// No description provided for @chooseFromGallery.
  ///
  /// In id, this message translates to:
  /// **'Pilih dari Galeri'**
  String get chooseFromGallery;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @pleaseAddImageAndDescription.
  ///
  /// In id, this message translates to:
  /// **'Silakan tambahkan gambar dan deskripsi.'**
  String get pleaseAddImageAndDescription;

  /// No description provided for @userNotFoundPleaseSignIn.
  ///
  /// In id, this message translates to:
  /// **'Pengguna tidak ditemukan. Silakan masuk.'**
  String get userNotFoundPleaseSignIn;

  /// No description provided for @postUploadedSuccessfully.
  ///
  /// In id, this message translates to:
  /// **'Laporan berhasil diunggah!'**
  String get postUploadedSuccessfully;

  /// No description provided for @failedToUploadPost.
  ///
  /// In id, this message translates to:
  /// **'Gagal mengunggah laporan: {error}'**
  String failedToUploadPost(Object error);

  /// No description provided for @locationServicesDisabled.
  ///
  /// In id, this message translates to:
  /// **'Layanan lokasi dinonaktifkan.'**
  String get locationServicesDisabled;

  /// No description provided for @locationPermissionsDenied.
  ///
  /// In id, this message translates to:
  /// **'Izin lokasi ditolak.'**
  String get locationPermissionsDenied;

  /// No description provided for @failedToRetrieveLocation.
  ///
  /// In id, this message translates to:
  /// **'Gagal mengambil lokasi: {error}'**
  String failedToRetrieveLocation(Object error);

  /// No description provided for @failedToPickImage.
  ///
  /// In id, this message translates to:
  /// **'Gagal memilih gambar: {error}'**
  String failedToPickImage(Object error);

  /// No description provided for @failedToCompressImage.
  ///
  /// In id, this message translates to:
  /// **'Gagal mengompres gambar: {error}'**
  String failedToCompressImage(Object error);

  /// No description provided for @generateAnotherDescription.
  ///
  /// In id, this message translates to:
  /// **'Buat deskripsi lain'**
  String get generateAnotherDescription;

  /// No description provided for @addBriefDescription.
  ///
  /// In id, this message translates to:
  /// **'Tambahkan deskripsi singkat...'**
  String get addBriefDescription;

  /// No description provided for @post.
  ///
  /// In id, this message translates to:
  /// **'Kirim'**
  String get post;

  /// No description provided for @notificationSent.
  ///
  /// In id, this message translates to:
  /// **'✅ Notifikasi berhasil dikirim'**
  String get notificationSent;

  /// No description provided for @notificationFailed.
  ///
  /// In id, this message translates to:
  /// **'❌ Gagal kirim notifikasi: {error}'**
  String notificationFailed(Object error);

  /// No description provided for @settings.
  ///
  /// In id, this message translates to:
  /// **'Pengaturan'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In id, this message translates to:
  /// **'Bahasa'**
  String get language;

  /// No description provided for @unknownLanguage.
  ///
  /// In id, this message translates to:
  /// **'Bahasa Tidak Dikenal'**
  String get unknownLanguage;

  /// No description provided for @english.
  ///
  /// In id, this message translates to:
  /// **'Inggris'**
  String get english;

  /// No description provided for @indonesian.
  ///
  /// In id, this message translates to:
  /// **'Indonesia'**
  String get indonesian;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
