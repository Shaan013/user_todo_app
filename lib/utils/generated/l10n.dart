// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `CREATE NETWORK`
  String get titleCreateNetwork {
    return Intl.message(
      'CREATE NETWORK',
      name: 'titleCreateNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Executive Network`
  String get headingExecutiveNetwork {
    return Intl.message(
      'Executive Network',
      name: 'headingExecutiveNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Executive Directory`
  String get titleExecutiveDirectory {
    return Intl.message(
      'Executive Directory',
      name: 'titleExecutiveDirectory',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get errorUnknown {
    return Intl.message('Unknown', name: 'errorUnknown', desc: '', args: []);
  }

  /// `DIGITAL CORRESPONDENCE`
  String get titleDigitalCorrespondence {
    return Intl.message(
      'DIGITAL CORRESPONDENCE',
      name: 'titleDigitalCorrespondence',
      desc: '',
      args: [],
    );
  }

  /// `DIRECT LINE`
  String get titleDirectLine {
    return Intl.message(
      'DIRECT LINE',
      name: 'titleDirectLine',
      desc: '',
      args: [],
    );
  }

  /// `PRIMARY OFFICE`
  String get titlePrimaryOffice {
    return Intl.message(
      'PRIMARY OFFICE',
      name: 'titlePrimaryOffice',
      desc: '',
      args: [],
    );
  }

  /// `WEBSITE`
  String get titleWebsite {
    return Intl.message('WEBSITE', name: 'titleWebsite', desc: '', args: []);
  }

  /// `Api Could Not Fetch Date`
  String get msgApiCouldNotFetchDate {
    return Intl.message(
      'Api Could Not Fetch Date',
      name: 'msgApiCouldNotFetchDate',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get errorSomethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'errorSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `You Date is Null`
  String get erroryouDateIsNull {
    return Intl.message(
      'You Date is Null',
      name: 'erroryouDateIsNull',
      desc: '',
      args: [],
    );
  }

  /// `Todos`
  String get headingTodos {
    return Intl.message('Todos', name: 'headingTodos', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
