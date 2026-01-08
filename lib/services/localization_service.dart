import 'package:flutter/material.dart';

/// Localization service for Home Hub
/// Supports English (en) and Swahili (sw)
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': _english,
    'sw': _swahili,
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // Getter methods for common strings
  String get appName => translate('app_name');
  String get hello => translate('hello');
  String get login => translate('login');
  String get register => translate('register');
  String get email => translate('email');
  String get password => translate('password');
  String get confirmPassword => translate('confirm_password');
  String get phoneNumber => translate('phone_number');
  String get fullName => translate('full_name');
  String get username => translate('username');
  String get forgetPassword => translate('forget_password');
  String get registerOrCreateAccount => translate('register_or_create_account');

  // Onboarding
  String get buyYourDreamHome => translate('buy_your_dream_home');
  String get saleYourProperty => translate('sale_your_property');
  String get skip => translate('skip');
  String get next => translate('next');

  // Home Screen
  String get search => translate('search');
  String get allProperty => translate('all_property');
  String get seeAll => translate('see_all');
  String get featuredProperty => translate('featured_property');
  String get house => translate('house');
  String get apartment => translate('apartment');
  String get office => translate('office');
  String get land => translate('land');

  // Property Details
  String get bed => translate('bed');
  String get bath => translate('bath');
  String get kitchen => translate('kitchen');
  String get sqft => translate('sqft');
  String get tzsPerMonth => translate('tzs_per_month');

  // Search & Filters
  String get location => translate('location');
  String get priceRange => translate('price_range');
  String get houseType => translate('house_type');
  String get rentalPeriod => translate('rental_period');
  String get nearBeach => translate('near_beach');
  String get nearCity => translate('near_city');
  String get nearMainRoad => translate('near_main_road');
  String get monthly => translate('monthly');
  String get threeMonths => translate('three_months');
  String get sixMonths => translate('six_months');
  String get yearly => translate('yearly');

  // Property Types
  String get singleRoom => translate('single_room');
  String get oneBedroom => translate('one_bedroom');
  String get twoBedroom => translate('two_bedroom');
  String get threeBedroom => translate('three_bedroom');
  String get familyHouse => translate('family_house');
  String get studio => translate('studio');

  // Actions
  String get viewOnMap => translate('view_on_map');
  String get getDirections => translate('get_directions');
  String get contactLandlord => translate('contact_landlord');
  String get callNow => translate('call_now');
  String get whatsapp => translate('whatsapp');
  String get chat => translate('chat');
  String get saveToFavorites => translate('save_to_favorites');
  String get removeFavorite => translate('remove_favorite');
  String get bookViewing => translate('book_viewing');
  String get confirmAvailability => translate('confirm_availability');

  // Navigation
  String get openInGoogleMaps => translate('open_in_google_maps');
  String get rideWithBolt => translate('ride_with_bolt');
  String get rideWithUber => translate('ride_with_uber');

  // Questions
  String get whatIsYourBudget => translate('what_is_your_budget');
  String get whereDoYouWantToBuy => translate('where_do_you_want_to_buy');
  String get near => translate('near');
  String get outside => translate('outside');
  String get continueText => translate('continue');

  // Notifications
  String get notifications => translate('notifications');
  String get newHousesAvailable => translate('new_houses_available');
  String get priceDropAlert => translate('price_drop_alert');

  // Profile
  String get profile => translate('profile');
  String get myFavorites => translate('my_favorites');
  String get savedSearches => translate('saved_searches');
  String get settings => translate('settings');
  String get language => translate('language');
  String get logout => translate('logout');

  // Messages
  String get noPropertiesFound => translate('no_properties_found');
  String get loading => translate('loading');
  String get error => translate('error');
  String get tryAgain => translate('try_again');
  String get success => translate('success');

  // Validation
  String get enterEmail => translate('enter_email');
  String get enterPassword => translate('enter_password');
  String get enterUsername => translate('enter_username');
  String get passwordsDoNotMatch => translate('passwords_do_not_match');
  String get enterPhoneNumber => translate('enter_phone_number');
  String get invalidPhoneNumber => translate('invalid_phone_number');
  String get enterFullName => translate('enter_full_name');

  // OTP
  String get enterOtp => translate('enter_otp');
  String get verifyOtp => translate('verify_otp');
  String get resendOtp => translate('resend_otp');
  String get otpSent => translate('otp_sent');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'sw'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

// English translations
const Map<String, String> _english = {
  'app_name': 'Home Hub',
  'hello': 'Hello!',
  'login': 'Login',
  'register': 'Register',
  'email': 'Email',
  'password': 'Password',
  'confirm_password': 'Confirm Password',
  'phone_number': 'Phone Number',
  'full_name': 'Full Name',
  'username': 'Username',
  'forget_password': 'Forget Password?',
  'register_or_create_account': 'Register or create an account',

  // Onboarding
  'buy_your_dream_home': 'Buy your Dream Home',
  'sale_your_property': 'Sale your Property',
  'skip': 'Skip',
  'next': 'Next',

  // Home Screen
  'search': 'Search...',
  'all_property': 'All Property',
  'see_all': 'See All',
  'featured_property': 'Featured Property',
  'house': 'House',
  'apartment': 'Apartment',
  'office': 'Office',
  'land': 'Land',

  // Property Details
  'bed': 'Bed',
  'bath': 'Bath',
  'kitchen': 'Kitchen',
  'sqft': 'sqft',
  'tzs_per_month': 'TZS/month',

  // Search & Filters
  'location': 'Location',
  'price_range': 'Price Range',
  'house_type': 'House Type',
  'rental_period': 'Rental Period',
  'near_beach': 'Near Beach',
  'near_city': 'Near City',
  'near_main_road': 'Near Main Road',
  'monthly': 'Monthly',
  'three_months': '3 Months',
  'six_months': '6 Months',
  'yearly': 'Yearly',

  // Property Types
  'single_room': 'Single Room',
  'one_bedroom': '1 Bedroom',
  'two_bedroom': '2 Bedrooms',
  'three_bedroom': '3 Bedrooms',
  'family_house': 'Family House',
  'studio': 'Studio',

  // Actions
  'view_on_map': 'View on Map',
  'get_directions': 'Get Directions',
  'contact_landlord': 'Contact Landlord',
  'call_now': 'Call Now',
  'whatsapp': 'WhatsApp',
  'chat': 'Chat',
  'save_to_favorites': 'Save to Favorites',
  'remove_favorite': 'Remove from Favorites',
  'book_viewing': 'Book Viewing',
  'confirm_availability': 'Confirm Availability',

  // Navigation
  'open_in_google_maps': 'Open in Google Maps',
  'ride_with_bolt': 'Ride with Bolt',
  'ride_with_uber': 'Ride with Uber',

  // Questions
  'what_is_your_budget': 'What is your budget',
  'where_do_you_want_to_buy': 'Where do you want to buy?',
  'near': 'Near',
  'outside': 'Outside',
  'continue': 'Continue',

  // Notifications
  'notifications': 'Notifications',
  'new_houses_available': 'New houses available',
  'price_drop_alert': 'Price drop alert',

  // Profile
  'profile': 'Profile',
  'my_favorites': 'My Favorites',
  'saved_searches': 'Saved Searches',
  'settings': 'Settings',
  'language': 'Language',
  'logout': 'Logout',

  // Messages
  'no_properties_found': 'No properties found',
  'loading': 'Loading...',
  'error': 'Error',
  'try_again': 'Try Again',
  'success': 'Success',

  // Validation
  'enter_email': 'Enter email',
  'enter_password': 'Enter password',
  'enter_username': 'Enter username',
  'passwords_do_not_match': 'Passwords do not match',
  'enter_phone_number': 'Enter phone number',
  'invalid_phone_number': 'Invalid phone number',
  'enter_full_name': 'Enter full name',

  // OTP
  'enter_otp': 'Enter OTP',
  'verify_otp': 'Verify OTP',
  'resend_otp': 'Resend OTP',
  'otp_sent': 'OTP sent successfully',
};

// Swahili translations
const Map<String, String> _swahili = {
  'app_name': 'Home Hub',
  'hello': 'Habari!',
  'login': 'Ingia',
  'register': 'Jisajili',
  'email': 'Barua pepe',
  'password': 'Nenosiri',
  'confirm_password': 'Thibitisha Nenosiri',
  'phone_number': 'Nambari ya Simu',
  'full_name': 'Jina Kamili',
  'username': 'Jina la Mtumiaji',
  'forget_password': 'Umesahau Nenosiri?',
  'register_or_create_account': 'Jisajili au unda akaunti',

  // Onboarding
  'buy_your_dream_home': 'Nunua Nyumba ya Ndoto Yako',
  'sale_your_property': 'Uza Mali Yako',
  'skip': 'Ruka',
  'next': 'Endelea',

  // Home Screen
  'search': 'Tafuta...',
  'all_property': 'Mali Zote',
  'see_all': 'Ona Zote',
  'featured_property': 'Mali Maalum',
  'house': 'Nyumba',
  'apartment': 'Ghorofa',
  'office': 'Ofisi',
  'land': 'Ardhi',

  // Property Details
  'bed': 'Kitanda',
  'bath': 'Bafu',
  'kitchen': 'Jiko',
  'sqft': 'sqft',
  'tzs_per_month': 'TZS/mwezi',

  // Search & Filters
  'location': 'Eneo',
  'price_range': 'Bei',
  'house_type': 'Aina ya Nyumba',
  'rental_period': 'Muda wa Kukodi',
  'near_beach': 'Karibu na Pwani',
  'near_city': 'Karibu na Jiji',
  'near_main_road': 'Karibu na Barabara Kuu',
  'monthly': 'Kila Mwezi',
  'three_months': 'Miezi 3',
  'six_months': 'Miezi 6',
  'yearly': 'Kila Mwaka',

  // Property Types
  'single_room': 'Chumba Kimoja',
  'one_bedroom': 'Sebule 1',
  'two_bedroom': 'Sebule 2',
  'three_bedroom': 'Sebule 3',
  'family_house': 'Nyumba ya Familia',
  'studio': 'Studio',

  // Actions
  'view_on_map': 'Ona kwenye Ramani',
  'get_directions': 'Pata Maelekezo',
  'contact_landlord': 'Wasiliana na Mmiliki',
  'call_now': 'Piga Simu',
  'whatsapp': 'WhatsApp',
  'chat': 'Ongea',
  'save_to_favorites': 'Hifadhi kwa Vipendwa',
  'remove_favorite': 'Ondoa kutoka Vipendwa',
  'book_viewing': 'Weka Wakati wa Kutembelea',
  'confirm_availability': 'Thibitisha Upatikanaji',

  // Navigation
  'open_in_google_maps': 'Fungua kwenye Google Maps',
  'ride_with_bolt': 'Safari na Bolt',
  'ride_with_uber': 'Safari na Uber',

  // Questions
  'what_is_your_budget': 'Bajeti yako ni kiasi gani',
  'where_do_you_want_to_buy': 'Unataka kununua wapi?',
  'near': 'Karibu',
  'outside': 'Nje',
  'continue': 'Endelea',

  // Notifications
  'notifications': 'Arifa',
  'new_houses_available': 'Nyumba mpya zinapatikana',
  'price_drop_alert': 'Onyo la kupungua kwa bei',

  // Profile
  'profile': 'Wasifu',
  'my_favorites': 'Vipendwa Vyangu',
  'saved_searches': 'Utafutaji Ulohifadhiwa',
  'settings': 'Mipangilio',
  'language': 'Lugha',
  'logout': 'Toka',

  // Messages
  'no_properties_found': 'Hakuna mali zilizopatikana',
  'loading': 'Inapakia...',
  'error': 'Hitilafu',
  'try_again': 'Jaribu Tena',
  'success': 'Imefanikiwa',

  // Validation
  'enter_email': 'Weka barua pepe',
  'enter_password': 'Weka nenosiri',
  'enter_username': 'Weka jina la mtumiaji',
  'passwords_do_not_match': 'Nenosiri hazilingani',
  'enter_phone_number': 'Weka nambari ya simu',
  'invalid_phone_number': 'Nambari ya simu si sahihi',
  'enter_full_name': 'Weka jina kamili',

  // OTP
  'enter_otp': 'Weka OTP',
  'verify_otp': 'Thibitisha OTP',
  'resend_otp': 'Tuma Tena OTP',
  'otp_sent': 'OTP imetumwa',
};
