import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:stringer/stringer.dart';
import 'package:abotube/a_models/phrase.dart';
import 'package:abotube/a_models/languages.dart';

/// => TAMAM
@immutable
class Flag {
  // --------------------------------------------------------------------------
  /// THIS CLASS IS USED TO STORE CONSTANT COUNTRY DATA
  // --------------------------------------------------------------------------
  const Flag({
    @required this.id,
    @required this.iso2,
    @required this.icon,
    @required this.region,
    @required this.continent,
    @required this.language,
    @required this.currencyID,
    @required this.phoneCode,
    @required this.capital,
    @required this.langCodes,
    @required this.areaSqKm,
    @required this.population,
    @required this.phrases,
  });
  /// --------------------------------------------------------------------------
  final String id;
  final String iso2;
  final String icon;
  final String region;
  final String continent;
  final String language;
  final String currencyID;
  final String phoneCode;
  final String capital;
  final String langCodes;
  final int population;
  final int areaSqKm;
  final List<Phrase> phrases;
  // -----------------------------------------------------------------------------

  /// CLONING

  // --------------------
  /// TESTED : WORKS PERFECT
  Flag copyWith({
    String id,
    String iso2,
    String icon,
    String region,
    String continent,
    String language,
    String currencyID,
    String phoneCode,
    String capital,
    String langCodes,
    int areaSqKm,
    int population,
    List<Phrase> phrases,
  }){
    return Flag(
      id: id ?? this.id,
      iso2: iso2 ?? this.iso2,
      icon: icon ?? this.icon,
      region: region ?? this.region,
      continent: continent ?? this.continent,
      language: language ?? this.language,
      currencyID: currencyID ?? this.currencyID,
      phoneCode: phoneCode ?? this.phoneCode,
      capital: capital ?? this.capital,
      langCodes: langCodes ?? this.langCodes,
      areaSqKm: areaSqKm ?? this.areaSqKm,
      population: population ?? this.population,
      phrases: phrases ?? this.phrases,
    );
  }
  // -----------------------------------------------------------------------------

  /// CYPHERS

  // --------------------
  /// TESTED : WORKS PERFECT
  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'iso2': iso2,
      'flag': icon,
      'region': region,
      'continent': continent,
      'language': language,
      'currencyID': currencyID,
      'phoneCode': phoneCode,
      'capital': capital,
      'langCodes': langCodes,
      'areaSqKm': areaSqKm,
      'population': population,
      'phrases': Phrase.cipherPhrasesToLangsMap(phrases),
    };
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Map<String, dynamic>> cipherFlags(List<Flag> flags){
    final List<Map<String, dynamic>> _maps = [];

    if (Mapper.checkCanLoopList(flags) == true){
      for (final Flag flag in flags){
        _maps.add(flag.toMap());
      }
    }

    return _maps;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Flag decipher(Map<String, dynamic> map){
    Flag _output;

    if (map != null){
      _output = Flag(
        id: map['id'],
        iso2: map['iso2'],
        icon: map['flag'],
        region: map['region'],
        continent: map['continent'],
        language: map['language'],
        currencyID: map['currencyID'],
        phoneCode: map['phoneCode'],
        capital: map['capital'],
        langCodes: map['langCodes'],
        areaSqKm: map['areaSqKm'],
        population: map['population'],
        phrases: Phrase.decipherPhrasesLangsMap(
          phid: map['id'],
          langsMap: map['phrases'],
        ),
      );
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Flag> decipherMaps(List<dynamic> maps){
    final List<Flag> _output = [];

    if (Mapper.checkCanLoopList(maps) == true){
      for (final dynamic map in maps){
        _output.add(decipher(map));
      }
    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// FLAG GETTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Flag getFlagFromFlagsByCountryID({
    @required List<Flag> flags,
    @required String countryID,
  }){
    Flag _output;

    if (TextCheck.isEmpty(countryID) == false){
      if (Mapper.checkCanLoopList(flags) == true){
        for (final Flag flag in flags){
          if (flag.id == countryID){
            _output = flag;
            break;
          }
        }
      }
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Flag getFlagFromFlagsByISO2({
    @required List<Flag> flags,
    @required String iso2,
  }){
    Flag _output;

    if (TextCheck.isEmpty(iso2) == false){
      if (Mapper.checkCanLoopList(flags) == true){
        for (final Flag flag in flags){
          if (flag.iso2 == iso2){
            _output = flag;
            break;
          }
        }
      }
    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// ID GETTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static String getCountryIDByISO2(String iso2){
    String _output;

    if (iso2 != null) {

      final Flag _flag = getFlagFromFlagsByISO2(
        flags: allFlags,
        iso2: iso2,
      );

      _output = _flag.id;

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> getAllCountriesIDs() {
    final List<String> _ids = <String>[];
    for (final Flag flag in allFlags) {
      _ids.add(flag.id);
    }
    return _ids;
  }
  // -----------------------------------------------------------------------------

  /// ICON GETTER

  // --------------------
  /// TESTED : WORKS PERFECT
  static String getCountryIcon(String countryID) {
    String _output = Iconz.dvBlankSVG;

    if (countryID != null) {

      final Flag _flag = getFlagFromFlagsByCountryID(
        flags: allFlags,
        countryID: countryID,
      );

      _output = _flag?.icon;

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// PHONE CODE GETTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static String getCountryPhoneCode(String countryID){
    String _output;

    if (countryID != null) {

      final Flag _flag = getFlagFromFlagsByCountryID(
        flags: allFlags,
        countryID: countryID,
      );

      _output = _flag.phoneCode;

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// PHONE CODE GETTERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static String getCountryCurrencyID(String countryID){
    String _output;

    if (countryID != null) {

      final Flag _flag = getFlagFromFlagsByCountryID(
        flags: allFlags,
        countryID: countryID,
      );

      _output = _flag.currencyID;

    }

    return _output;
  }
  // --------------------
  /// Task
  static List<String> getALlLangCodes(){
    List<String> _output = [];

    for (final Flag flag in allFlags){

      _output = Stringer.addStringsToStringsIfDoNotContainThem(
          listToTake: _output,
          listToAdd: flag.langCodes.split(','),
      );

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// BLOG

  // --------------------
  /// TESTED : WORKS PERFECT
  void blogFlag(){

    blog(
      'Flag(\n'
          "id: '$id',\n"
          "iso2: '$iso2',\n"
          "icon: '$icon',\n"
          "region: '$region',\n"
          "continent: '$continent',\n"
          "language: '$language',\n"
          "currencyID: '$currencyID',\n"
          "phoneCode: '$phoneCode',\n"
          "capital: '$capital',\n"
          "langCodes: '$langCodes',\n"
          'areaSqKm: $areaSqKm,\n'
          'population: $population,\n'
          'phrases: <Phrase>[\n'
              "Phrase(langCode: 'de', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'de').value}', id: '$id'),\n"
              "Phrase(langCode: 'ar', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'ar').value}', id: '$id'),\n"
              "Phrase(langCode: 'en', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'en').value}', id: '$id'),\n"
              "Phrase(langCode: 'fr', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'fr').value}', id: '$id'),\n"
              "Phrase(langCode: 'es', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'es').value}', id: '$id'),\n"
              "Phrase(langCode: 'zh', value: '${Phrase.searchPhraseByIDAndLangCode(phrases: phrases, phid: id, langCode: 'zh').value}', id: '$id'),\n"
          '],\n'
        '),\n',
    );
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void blogFlags(List<Flag> flags){
    if (Mapper.checkCanLoopList(flags) == true){
      for (final Flag flag in flags){
        flag.blogFlag();
      }
    }
  }
  // -----------------------------------------------------------------------------

  /// JSON BLOG CREATOR

  // --------------------
  /// TESTED : WORKS PERFECT
  static void blogFlagsToJSON(List<Flag> flags){
    if (Mapper.checkCanLoopList(flags) == true){
      blog('[\n');
      for (int i = 0; i < flags.length; i++){

        final Flag _flag = flags[i];
        final bool _lastItem = i == flags.length - 1;

        String _string = '{\n'
            '"id":"${_flag.id}",\n'
            '"iso2":"${_flag.iso2}",\n'
            '"flag":"${_flag.icon}",\n'
            '"region":"${_flag.region}",\n'
            '"continent":"${_flag.continent}",\n'
            '"language":"${_flag.language}",\n'
            '"currencyID":"${_flag.currencyID}",\n'
            '"phoneCode":"${_flag.phoneCode}",\n'
            '"capital":"${_flag.capital}",\n'
            '"langCodes":"${_flag.langCodes}",\n'
            '"areaSqKm":${_flag.areaSqKm},\n'
            '"population":${_flag.population},\n'
            '"phrases":${_blogPhrasesToJSON(_flag.phrases)}\n'
            '}';

        if (_lastItem == false){
          _string = '$_string,';
        }

        blog(_string);

      }
      blog(']');
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String _blogPhrasesToJSON(List<Phrase> phrases){
    String _output = '{\n';

    if (Mapper.checkCanLoopList(phrases) == true) {

      for (int i = 0; i < phrases.length; i++) {

        final Phrase phrase = phrases[i];
        final bool _isLast = i + 1 == phrases.length;

        if (_isLast == false){
          _output = '$_output"${phrase.langCode}": "${phrase.value}",\n';
        }
        else {
          /// remove last comma
          _output = '$_output"${phrase.langCode}": "${phrase.value}"\n';
        }

      }

  }

    return '$_output}';
  }
  // -----------------------------------------------------------------------------

  /// EQUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkFlagsAreIdentical(Flag flag1, Flag flag2){
    bool _identical = false;

    if (flag1 == null && flag2 == null){
      _identical = true;
    }

    else if (flag1 != null && flag2 != null) {
      if (
      flag1.id == flag2.id &&
      flag1.iso2 == flag2.iso2 &&
      flag1.icon == flag2.icon &&
      flag1.region == flag2.region &&
      flag1.continent == flag2.continent &&
      flag1.language == flag2.language &&
      flag1.currencyID == flag2.currencyID &&
      flag1.phoneCode == flag2.phoneCode &&
      flag1.capital == flag2.capital &&
      flag1.langCodes == flag2.langCodes &&
      flag1.areaSqKm == flag2.areaSqKm &&
      flag1.population == flag2.population &&
      Phrase.checkPhrasesListsAreIdentical(phrases1: flag1.phrases, phrases2: flag2.phrases,) == true
    ) {
        _identical = true;
      }
    }

    return _identical;
  }
  // -----------------------------------------------------------------------------

  /// OVERRIDES

  // --------------------
  /*
   @override
   String toString() => 'MapModel(key: $key, value: ${value.toString()})';
   */
  // --------------------
  @override
  bool operator == (Object other){

    if (identical(this, other)) {
      return true;
    }

    bool _areIdentical = false;
    if (other is Flag){
      _areIdentical = checkFlagsAreIdentical(
        this,
        other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      id.hashCode^
      iso2.hashCode^
      icon.hashCode^
      region.hashCode^
      continent.hashCode^
      language.hashCode^
      currencyID.hashCode^
      phoneCode.hashCode^
      capital.hashCode^
      langCodes.hashCode^
      areaSqKm.hashCode^
      population.hashCode^
      phrases.hashCode;
  // -----------------------------------------------------------------------------
}
