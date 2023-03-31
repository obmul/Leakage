import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? swText = '',
  }) =>
      [enText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OnBoarding
  {
    'eppy9meh': {
      'en': 'Help us find leaks',
      'sw': 'Kichwa cha Kwanza',
    },
    'jga88ppr': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'sw':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    '91gf7o1w': {
      'en': 'Header Two',
      'sw': 'Kichwa cha Pili',
    },
    'bppuhgdu': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'sw':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    'h9sqrhg8': {
      'en': 'Header Three',
      'sw': 'Kichwa cha Tatu',
    },
    'nnrfugzx': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'sw':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    '48ysp53l': {
      'en': 'Get Started',
      'sw': 'Anza',
    },
    'lylokv45': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // AuthPage
  {
    'oh9cbe4w': {
      'en': 'Leakage',
      'sw': 'Kuvuja',
    },
    'acpolaqb': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'a0cr6h4f': {
      'en': 'Email Address',
      'sw': 'Barua pepe',
    },
    'lzx6pvhc': {
      'en': 'Enter your email...',
      'sw': 'Weka barua pepe yako...',
    },
    '5gefmq5s': {
      'en': 'Password',
      'sw': 'Nenosiri',
    },
    '0oodgd1r': {
      'en': 'Enter your password...',
      'sw': 'Weka nenosiri lako...',
    },
    'hfnrdeu8': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'al0ht0av': {
      'en': 'Sign in with Google',
      'sw': 'Ingia kwa kutumia Google',
    },
    '82cn4yh8': {
      'en': 'Sign Up',
      'sw': 'Jisajili',
    },
    'ul0bm30x': {
      'en': 'Name',
      'sw': 'Jina',
    },
    '2t0kxzgl': {
      'en': 'Name',
      'sw': 'Jina',
    },
    '3fm9194f': {
      'en': 'Email Address',
      'sw': 'Barua pepe',
    },
    '3aa55frm': {
      'en': 'Enter your email...',
      'sw': 'Weka barua pepe yako...',
    },
    'rnfcd14y': {
      'en': 'Password',
      'sw': 'Nenosiri',
    },
    'k84jwnz8': {
      'en': 'Enter your password...',
      'sw': 'Weka nenosiri lako...',
    },
    'eeltb79m': {
      'en': 'Confirm Password',
      'sw': 'Thibitisha Nenosiri',
    },
    'xgl5ehja': {
      'en': 'confirm password',
      'sw': 'thibitisha nenosiri',
    },
    '5n0awq8o': {
      'en': 'Create Account',
      'sw': 'Tengeneza akaunti',
    },
    'r4jnkqcb': {
      'en': 'Field is required',
      'sw': 'Sehemu inahitajika',
    },
    'y60p81gp': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '5ft2hyl3': {
      'en': 'Field is required',
      'sw': 'Sehemu inahitajika',
    },
    'laow8ew6': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'c5prxuqf': {
      'en': 'Field is required',
      'sw': 'Sehemu inahitajika',
    },
    'jeow3puv': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    'drklonvm': {
      'en': 'Field is required',
      'sw': 'Sehemu inahitajika',
    },
    '7w5t7abt': {
      'en': 'Please choose an option from the dropdown',
      'sw': 'Tafadhali chagua chaguo kutoka kwenye menyu kunjuzi',
    },
    '2se4z4go': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Home
  {
    'zxs6v9d5': {
      'en': 'Critical',
      'sw': '',
    },
    '0oc48fad': {
      'en': 'High',
      'sw': '',
    },
    '0i4z7v9a': {
      'en': 'low',
      'sw': '',
    },
    'glhv7lpm': {
      'en': ' level of risk',
      'sw': '',
    },
    '300wqku5': {
      'en': 'Search for an item...',
      'sw': '',
    },
  },
  // Profile
  {
    'fyvt4a70': {
      'en': 'Switch to Dark Mode',
      'sw': 'Badili hadi kwa Hali Nyeusi',
    },
    'islzwwo4': {
      'en': 'Switch to Light Mode',
      'sw': 'Badili hadi Hali ya Mwanga',
    },
    'rwt4n65t': {
      'en': 'Edit Profile',
      'sw': 'Badilisha Wasifu',
    },
    '980eid13': {
      'en': 'Log Out',
      'sw': 'Toka nje',
    },
    'fio6ygj7': {
      'en': 'Profile',
      'sw': 'Wasifu',
    },
    'syk2p8fk': {
      'en': '__',
      'sw': '__',
    },
  },
  // edit
  {
    '1nd1oi81': {
      'en': 'Change Photo',
      'sw': 'BADILISHA picha',
    },
    'wmclzfv7': {
      'en': 'Your Name',
      'sw': 'Jina lako',
    },
    'xy6wli37': {
      'en': 'Phone',
      'sw': 'Simu',
    },
    '6jkjj81r': {
      'en': 'Save Changes',
      'sw': 'Hifadhi mabadiliko',
    },
    '1qfay81o': {
      'en': 'Edit Profile',
      'sw': 'Badilisha Wasifu',
    },
  },
  // Miscellaneous
  {
    'hsybudlr': {
      'en': '',
      'sw': '',
    },
    'b9a0fl3q': {
      'en': '',
      'sw': '',
    },
    'doc8tjba': {
      'en': '',
      'sw': '',
    },
    'zi4hpinw': {
      'en': '',
      'sw': '',
    },
    'x5siv4op': {
      'en': '',
      'sw': '',
    },
    'a9kov3ol': {
      'en': '',
      'sw': '',
    },
    '07a3uovx': {
      'en': '',
      'sw': '',
    },
    '3f7zw60m': {
      'en': '',
      'sw': '',
    },
    'pxj9rtav': {
      'en': '',
      'sw': '',
    },
    'a0wljyxa': {
      'en': '',
      'sw': '',
    },
    'dcfpebwi': {
      'en': '',
      'sw': '',
    },
    '3c670mn7': {
      'en': '',
      'sw': '',
    },
    '00j6d3fg': {
      'en': '',
      'sw': '',
    },
    '5u43cbny': {
      'en': '',
      'sw': '',
    },
    'h0lysy59': {
      'en': '',
      'sw': '',
    },
    'dh17c8sl': {
      'en': '',
      'sw': '',
    },
    'nf3w4e2h': {
      'en': '',
      'sw': '',
    },
    '6ol7ouo0': {
      'en': '',
      'sw': '',
    },
    'i0xls5hp': {
      'en': '',
      'sw': '',
    },
    'hrvae0wy': {
      'en': '',
      'sw': '',
    },
    'zyuhre4d': {
      'en': '',
      'sw': '',
    },
    'dnz8fle3': {
      'en': '',
      'sw': '',
    },
    'yt9ku3lo': {
      'en': '',
      'sw': '',
    },
    '1864a10n': {
      'en': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
