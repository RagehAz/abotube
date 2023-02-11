import 'package:bldrs_theme/bldrs_theme.dart';
import 'package:filers/filers.dart';
import 'package:flutter/material.dart';
import 'package:mapper/mapper.dart';
import 'package:stringer/stringer.dart';

const Map<String, dynamic> requiredLangueges = {
'hi-IN' : 'India',
'pt-BR' : 'Brazil',
'id-ID' : 'Indonesia',
'es-MX' : 'Mexico',
'ja-JP' : 'Japan',
'ur-PK' : 'Pakistan',
'de-DE' : 'Germany',
'vi-VN' : 'Vietnam',
'tr-TR' : 'Turkey',
'tl-PH' : 'Philippines',
'fr-FR' : 'France',
'ko-KR' : 'South',
'ar-EG' : 'Korea',
'it-IT' : 'Egypt',
'th-TH' : 'Italy',
'bn' :  'Thailand',
};

/// AS WIDGETS USE (package: "bldrs_theme") no need to include
/// packages/bldrs_theme/
/// in the path

const String _flagIconPath = 'packages/bldrs_theme/lib/assets/icons/flags';
const List<Flag> allFlags = <Flag>[

  Flag(
    id: 'alb',
    iso2: 'AL',
    icon: '$_flagIconPath/flag_eu_s_albania.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'ALL',
    phoneCode: '+355',
    capital: 'Tirana',
    langCodes: 'sq,el',
    areaSqKm: 28748,
    population: 2866376,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Albanien', id: 'alb'),
      Phrase(langCode: 'ar', value: 'ألبانيا', id: 'alb'),
      Phrase(langCode: 'en', value: 'Albania', id: 'alb'),
      Phrase(langCode: 'fr', value: 'Albanie', id: 'alb'),
      Phrase(langCode: 'es', value: 'Albania', id: 'alb'),
      Phrase(langCode: 'zh', value: '阿尔巴尼亚', id: 'alb'),
    ],
  ),

  Flag(
    id: 'dza',
    iso2: 'DZ',
    icon: '$_flagIconPath/flag_af_n_algeria.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'DZD',
    phoneCode: '+213',
    capital: 'Algiers',
    langCodes: 'ar-DZ',
    areaSqKm: 2381740,
    population: 42228429,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Algerien', id: 'dza'),
      Phrase(langCode: 'ar', value: 'الجزائر', id: 'dza'),
      Phrase(langCode: 'en', value: 'Algeria', id: 'dza'),
      Phrase(langCode: 'fr', value: 'Algérie', id: 'dza'),
      Phrase(langCode: 'es', value: 'Argelia', id: 'dza'),
      Phrase(langCode: 'zh', value: '阿尔及利亚', id: 'dza'),
    ],
  ),

  Flag(
    id: 'asm',
    iso2: 'AS',
    icon: '$_flagIconPath/flag_oc_poly_american_samoa.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'Pago Pago',
    langCodes: 'en-AS,sm,to',
    areaSqKm: 199,
    population: 55465,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Amerikanisch-Samoa', id: 'asm'),
      Phrase(langCode: 'ar', value: 'ساموا الأمريكية', id: 'asm'),
      Phrase(langCode: 'en', value: 'American Samoa', id: 'asm'),
      Phrase(langCode: 'fr', value: 'Samoa américaines', id: 'asm'),
      Phrase(langCode: 'es', value: 'Samoa Americana', id: 'asm'),
      Phrase(langCode: 'zh', value: '美属萨摩亚', id: 'asm'),
    ],
  ),

  Flag(
    id: 'and',
    iso2: 'AD',
    icon: '$_flagIconPath/flag_eu_s_andorra.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+376',
    capital: 'Andorra la Vella',
    langCodes: 'ca',
    areaSqKm: 468,
    population: 77006,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Andorra', id: 'and'),
      Phrase(langCode: 'ar', value: 'أندورا', id: 'and'),
      Phrase(langCode: 'en', value: 'Andorra', id: 'and'),
      Phrase(langCode: 'fr', value: 'Andorre', id: 'and'),
      Phrase(langCode: 'es', value: 'Andorra', id: 'and'),
      Phrase(langCode: 'zh', value: '安道尔', id: 'and'),
    ],
  ),

  Flag(
    id: 'ago',
    iso2: 'AO',
    icon: '$_flagIconPath/flag_af_m_angola.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'AOA',
    phoneCode: '+244',
    capital: 'Luanda',
    langCodes: 'pt-AO',
    areaSqKm: 1246700,
    population: 30809762,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Angola', id: 'ago'),
      Phrase(langCode: 'ar', value: 'أنغولا', id: 'ago'),
      Phrase(langCode: 'en', value: 'Angola', id: 'ago'),
      Phrase(langCode: 'fr', value: 'Angola', id: 'ago'),
      Phrase(langCode: 'es', value: 'Angola', id: 'ago'),
      Phrase(langCode: 'zh', value: '安哥拉', id: 'ago'),
    ],
  ),

  Flag(
    id: 'atg',
    iso2: 'AG',
    icon: '$_flagIconPath/flag_na_cr_antigua_and_barbuda.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: "St. John's",
    langCodes: 'en-AG',
    areaSqKm: 443,
    population: 96286,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Antigua und Barbuda', id: 'atg'),
      Phrase(langCode: 'ar', value: 'أنتيغوا وباربودا', id: 'atg'),
      Phrase(langCode: 'en', value: 'Antigua And Barbuda', id: 'atg'),
      Phrase(langCode: 'fr', value: 'Antigua-et-Barbuda', id: 'atg'),
      Phrase(langCode: 'es', value: 'Antigua y Barbuda', id: 'atg'),
      Phrase(langCode: 'zh', value: '安提瓜和巴布达', id: 'atg'),
    ],
  ),

  Flag(
    id: 'arg',
    iso2: 'AR',
    icon: '$_flagIconPath/flag_sa_argentina.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'ARS',
    phoneCode: '+54',
    capital: 'Buenos Aires',
    langCodes: 'es-AR,en,it,de,fr,gn',
    areaSqKm: 2766890,
    population: 44494502,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Argentinien', id: 'arg'),
      Phrase(langCode: 'ar', value: 'الأرجنتين', id: 'arg'),
      Phrase(langCode: 'en', value: 'Argentina', id: 'arg'),
      Phrase(langCode: 'fr', value: 'Argentine', id: 'arg'),
      Phrase(langCode: 'es', value: 'Argentina', id: 'arg'),
      Phrase(langCode: 'zh', value: '阿根廷', id: 'arg'),
    ],
  ),

  Flag(
    id: 'arm',
    iso2: 'AM',
    icon: '$_flagIconPath/flag_as_w_armenia.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'AMD',
    phoneCode: '+374',
    capital: 'Yerevan',
    langCodes: 'hy',
    areaSqKm: 29800,
    population: 2951776,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Armenien', id: 'arm'),
      Phrase(langCode: 'ar', value: 'أرمينيا', id: 'arm'),
      Phrase(langCode: 'en', value: 'Armenia', id: 'arm'),
      Phrase(langCode: 'fr', value: 'Arménie', id: 'arm'),
      Phrase(langCode: 'es', value: 'Armenia', id: 'arm'),
      Phrase(langCode: 'zh', value: '亚美尼亚', id: 'arm'),
    ],
  ),

  Flag(
    id: 'abw',
    iso2: 'AW',
    icon: '$_flagIconPath/flag_na_cr_aruba.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'AWG',
    phoneCode: '+297',
    capital: 'Oranjestad',
    langCodes: 'nl-AW,es,en',
    areaSqKm: 193,
    population: 105845,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Aruba', id: 'abw'),
      Phrase(langCode: 'ar', value: 'أروبا', id: 'abw'),
      Phrase(langCode: 'en', value: 'Aruba', id: 'abw'),
      Phrase(langCode: 'fr', value: 'Aruba', id: 'abw'),
      Phrase(langCode: 'es', value: 'Aruba', id: 'abw'),
      Phrase(langCode: 'zh', value: '阿鲁巴', id: 'abw'),
    ],
  ),

  Flag(
    id: 'aus',
    iso2: 'AU',
    icon: '$_flagIconPath/flag_az_flag_australia.svg',
    region: 'Australia and New Zealand',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'AUD',
    phoneCode: '+61',
    capital: 'Canberra',
    langCodes: 'en-AU',
    areaSqKm: 7686850,
    population: 24982688,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Australien', id: 'aus'),
      Phrase(langCode: 'ar', value: 'أستراليا', id: 'aus'),
      Phrase(langCode: 'en', value: 'Australia', id: 'aus'),
      Phrase(langCode: 'fr', value: 'Australie', id: 'aus'),
      Phrase(langCode: 'es', value: 'Australia', id: 'aus'),
      Phrase(langCode: 'zh', value: '澳大利亚', id: 'aus'),
    ],
  ),

  Flag(
    id: 'aut',
    iso2: 'AT',
    icon: '$_flagIconPath/flag_eu_w_austria.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+43',
    capital: 'Vienna',
    langCodes: 'de-AT,hr,hu,sl',
    areaSqKm: 83858,
    population: 8840521,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Österreich', id: 'aut'),
      Phrase(langCode: 'ar', value: 'النمسا', id: 'aut'),
      Phrase(langCode: 'en', value: 'Austria', id: 'aut'),
      Phrase(langCode: 'fr', value: 'Autriche', id: 'aut'),
      Phrase(langCode: 'es', value: 'Austria', id: 'aut'),
      Phrase(langCode: 'zh', value: '奥地利', id: 'aut'),
    ],
  ),

  Flag(
    id: 'aze',
    iso2: 'AZ',
    icon: '$_flagIconPath/flag_as_w_azerbaijan.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'AZN',
    phoneCode: '+994',
    capital: 'Baku',
    langCodes: 'az,ru,hy',
    areaSqKm: 86600,
    population: 9939800,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Aserbaidschan', id: 'aze'),
      Phrase(langCode: 'ar', value: 'أذربيجان', id: 'aze'),
      Phrase(langCode: 'en', value: 'Azerbaijan', id: 'aze'),
      Phrase(langCode: 'fr', value: 'Azerbaïdjan', id: 'aze'),
      Phrase(langCode: 'es', value: 'Azerbaiyán', id: 'aze'),
      Phrase(langCode: 'zh', value: '阿塞拜疆', id: 'aze'),
    ],
  ),

  Flag(
    id: 'bhs',
    iso2: 'BS',
    icon: '$_flagIconPath/flag_na_cr_bahamas.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'BSD',
    phoneCode: '+1',
    capital: 'Nassau',
    langCodes: 'en-BS',
    areaSqKm: 13940,
    population: 385640,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bahamas', id: 'bhs'),
      Phrase(langCode: 'ar', value: 'باهاماس', id: 'bhs'),
      Phrase(langCode: 'en', value: 'Bahamas, The', id: 'bhs'),
      Phrase(langCode: 'fr', value: 'Bahamas', id: 'bhs'),
      Phrase(langCode: 'es', value: 'Bahamas', id: 'bhs'),
      Phrase(langCode: 'zh', value: '巴哈马', id: 'bhs'),
    ],
  ),

  Flag(
    id: 'bhr',
    iso2: 'BH',
    icon: '$_flagIconPath/flag_as_w_bahrain.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'BHD',
    phoneCode: '+973',
    capital: 'Manama',
    langCodes: 'ar-BH,en,fa,ur',
    areaSqKm: 665,
    population: 1569439,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bahrain', id: 'bhr'),
      Phrase(langCode: 'ar', value: 'البحرين', id: 'bhr'),
      Phrase(langCode: 'en', value: 'Bahrain', id: 'bhr'),
      Phrase(langCode: 'fr', value: 'Bahreïn', id: 'bhr'),
      Phrase(langCode: 'es', value: 'Baréin', id: 'bhr'),
      Phrase(langCode: 'zh', value: '巴林', id: 'bhr'),
    ],
  ),

  Flag(
    id: 'bgd',
    iso2: 'BD',
    icon: '$_flagIconPath/flag_as_s_bangladesh.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'BDT',
    phoneCode: '+880',
    capital: 'Dhaka',
    langCodes: 'bn-BD,en',
    areaSqKm: 144000,
    population: 161356039,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bangladesch', id: 'bgd'),
      Phrase(langCode: 'ar', value: 'بنغلاديش', id: 'bgd'),
      Phrase(langCode: 'en', value: 'Bangladesh', id: 'bgd'),
      Phrase(langCode: 'fr', value: 'Bangladesh', id: 'bgd'),
      Phrase(langCode: 'es', value: 'Bangladés', id: 'bgd'),
      Phrase(langCode: 'zh', value: '孟加拉国', id: 'bgd'),
    ],
  ),

  Flag(
    id: 'brb',
    iso2: 'BB',
    icon: '$_flagIconPath/flag_na_cr_barbados.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'BBD',
    phoneCode: '+1-246',
    capital: 'Bridgetown',
    langCodes: 'en-BB',
    areaSqKm: 431,
    population: 286641,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Barbados', id: 'brb'),
      Phrase(langCode: 'ar', value: 'باربادوس', id: 'brb'),
      Phrase(langCode: 'en', value: 'Barbados', id: 'brb'),
      Phrase(langCode: 'fr', value: 'Barbade', id: 'brb'),
      Phrase(langCode: 'es', value: 'Barbados', id: 'brb'),
      Phrase(langCode: 'zh', value: '巴巴多斯', id: 'brb'),
    ],
  ),

  Flag(
    id: 'blr',
    iso2: 'BY',
    icon: '$_flagIconPath/flag_eu_e_belarus.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'BYN',
    phoneCode: '+375',
    capital: 'Minsk',
    langCodes: 'be,ru',
    areaSqKm: 207600,
    population: 9483499,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Belarus', id: 'blr'),
      Phrase(langCode: 'ar', value: 'بيلاروس', id: 'blr'),
      Phrase(langCode: 'en', value: 'Belarus', id: 'blr'),
      Phrase(langCode: 'fr', value: 'Biélorussie', id: 'blr'),
      Phrase(langCode: 'es', value: 'Bielorrusia', id: 'blr'),
      Phrase(langCode: 'zh', value: '白俄罗斯', id: 'blr'),
    ],
  ),

  Flag(
    id: 'bel',
    iso2: 'BE',
    icon: '$_flagIconPath/flag_eu_w_belgium.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+32',
    capital: 'Brussels',
    langCodes: 'nl-BE,fr-BE,de-BE',
    areaSqKm: 30510,
    population: 11433256,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Belgien', id: 'bel'),
      Phrase(langCode: 'ar', value: 'بلجيكا', id: 'bel'),
      Phrase(langCode: 'en', value: 'Belgium', id: 'bel'),
      Phrase(langCode: 'fr', value: 'Belgique', id: 'bel'),
      Phrase(langCode: 'es', value: 'Bélgica', id: 'bel'),
      Phrase(langCode: 'zh', value: '比利时', id: 'bel'),
    ],
  ),

  Flag(
    id: 'blz',
    iso2: 'BZ',
    icon: '$_flagIconPath/flag_na_c_belize.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'BZD',
    phoneCode: '+501',
    capital: 'Belmopan',
    langCodes: 'en-BZ,es',
    areaSqKm: 22966,
    population: 383071,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Belize', id: 'blz'),
      Phrase(langCode: 'ar', value: 'بليز', id: 'blz'),
      Phrase(langCode: 'en', value: 'Belize', id: 'blz'),
      Phrase(langCode: 'fr', value: 'Belize', id: 'blz'),
      Phrase(langCode: 'es', value: 'Belice', id: 'blz'),
      Phrase(langCode: 'zh', value: '伯利兹', id: 'blz'),
    ],
  ),

  Flag(
    id: 'ben',
    iso2: 'BJ',
    icon: '$_flagIconPath/flag_af_w_benin.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+229',
    capital: 'Porto-Novo',
    langCodes: 'fr-BJ',
    areaSqKm: 112620,
    population: 11485048,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Benin', id: 'ben'),
      Phrase(langCode: 'ar', value: 'بنين', id: 'ben'),
      Phrase(langCode: 'en', value: 'Benin', id: 'ben'),
      Phrase(langCode: 'fr', value: 'Bénin', id: 'ben'),
      Phrase(langCode: 'es', value: 'Benín', id: 'ben'),
      Phrase(langCode: 'zh', value: '贝宁', id: 'ben'),
    ],
  ),

  Flag(
    id: 'bmu',
    iso2: 'BM',
    icon: '$_flagIconPath/flag_na_n_bermuda.svg',
    region: 'Northern America',
    continent: 'North America',
    language: 'en',
    currencyID: 'BMD',
    phoneCode: '+1',
    capital: 'Hamilton',
    langCodes: 'en-BM,pt',
    areaSqKm: 53,
    population: 63973,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bermuda', id: 'bmu'),
      Phrase(langCode: 'ar', value: 'برمودا', id: 'bmu'),
      Phrase(langCode: 'en', value: 'Bermuda', id: 'bmu'),
      Phrase(langCode: 'fr', value: 'Bermudes', id: 'bmu'),
      Phrase(langCode: 'es', value: 'Bermudas', id: 'bmu'),
      Phrase(langCode: 'zh', value: '百慕大', id: 'bmu'),
    ],
  ),

  Flag(
    id: 'btn',
    iso2: 'BT',
    icon: '$_flagIconPath/flag_as_s_bhutan.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'BTN',
    phoneCode: '+975',
    capital: 'Thimphu',
    langCodes: 'dz',
    areaSqKm: 47000,
    population: 754394,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bhutan', id: 'btn'),
      Phrase(langCode: 'ar', value: 'بوتان', id: 'btn'),
      Phrase(langCode: 'en', value: 'Bhutan', id: 'btn'),
      Phrase(langCode: 'fr', value: 'Bhoutan', id: 'btn'),
      Phrase(langCode: 'es', value: 'Bután', id: 'btn'),
      Phrase(langCode: 'zh', value: '不丹', id: 'btn'),
    ],
  ),

  Flag(
    id: 'bol',
    iso2: 'BO',
    icon: '$_flagIconPath/flag_sa_bolivia.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'BOB',
    phoneCode: '+591',
    capital: 'Sucre',
    langCodes: 'es-BO,qu,ay',
    areaSqKm: 1098580,
    population: 11353142,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bolivien', id: 'bol'),
      Phrase(langCode: 'ar', value: 'بوليفيا', id: 'bol'),
      Phrase(langCode: 'en', value: 'Bolivia', id: 'bol'),
      Phrase(langCode: 'fr', value: 'Bolivie', id: 'bol'),
      Phrase(langCode: 'es', value: 'Bolivia', id: 'bol'),
      Phrase(langCode: 'zh', value: '玻利维亚', id: 'bol'),
    ],
  ),

  Flag(
    id: 'bih',
    iso2: 'BA',
    icon: '$_flagIconPath/flag_eu_s_bosnia_and_herzegovina.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'BAM',
    phoneCode: '+387',
    capital: 'Sarajevo',
    langCodes: 'bs,hr-BA,sr-BA',
    areaSqKm: 51129,
    population: 3323929,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bosnien und Herzegowina', id: 'bih'),
      Phrase(langCode: 'ar', value: 'البوسنة والهرسك', id: 'bih'),
      Phrase(langCode: 'en', value: 'Bosnia And Herzegovina', id: 'bih'),
      Phrase(langCode: 'fr', value: 'Bosnie-Herzégovine', id: 'bih'),
      Phrase(langCode: 'es', value: 'Bosnia y Herzegovina', id: 'bih'),
      Phrase(langCode: 'zh', value: '波黑', id: 'bih'),
    ],
  ),

  Flag(
    id: 'bwa',
    iso2: 'BW',
    icon: '$_flagIconPath/flag_af_s_botswana.svg',
    region: 'Southern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'BWP',
    phoneCode: '+267',
    capital: 'Gaborone',
    langCodes: 'en-BW,tn-BW',
    areaSqKm: 600370,
    population: 2254126,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Botswana', id: 'bwa'),
      Phrase(langCode: 'ar', value: 'بوتسوانا', id: 'bwa'),
      Phrase(langCode: 'en', value: 'Botswana', id: 'bwa'),
      Phrase(langCode: 'fr', value: 'Botswana', id: 'bwa'),
      Phrase(langCode: 'es', value: 'Botsuana', id: 'bwa'),
      Phrase(langCode: 'zh', value: '博茨瓦纳', id: 'bwa'),
    ],
  ),

  Flag(
    id: 'bra',
    iso2: 'BR',
    icon: '$_flagIconPath/flag_sa_brazil.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'BRL',
    phoneCode: '+55',
    capital: 'Brasilia',
    langCodes: 'pt-BR,es,en,fr',
    areaSqKm: 8511965,
    population: 209469333,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Brasilien', id: 'bra'),
      Phrase(langCode: 'ar', value: 'البرازيل', id: 'bra'),
      Phrase(langCode: 'en', value: 'Brazil', id: 'bra'),
      Phrase(langCode: 'fr', value: 'Brésil', id: 'bra'),
      Phrase(langCode: 'es', value: 'Brasil', id: 'bra'),
      Phrase(langCode: 'zh', value: '巴西', id: 'bra'),
    ],
  ),

  Flag(
    id: 'brn',
    iso2: 'BN',
    icon: '$_flagIconPath/flag_as_se_brunei.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'BND',
    phoneCode: '+673',
    capital: 'Bandar Seri Begawan',
    langCodes: 'ms-BN,en-BN',
    areaSqKm: 5770,
    population: 428962,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Brunei', id: 'brn'),
      Phrase(langCode: 'ar', value: 'بروناي', id: 'brn'),
      Phrase(langCode: 'en', value: 'Brunei', id: 'brn'),
      Phrase(langCode: 'fr', value: 'Brunei', id: 'brn'),
      Phrase(langCode: 'es', value: 'Brunéi', id: 'brn'),
      Phrase(langCode: 'zh', value: '文莱', id: 'brn'),
    ],
  ),

  Flag(
    id: 'bgr',
    iso2: 'BG',
    icon: '$_flagIconPath/flag_eu_e_bulgaria.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'BGN',
    phoneCode: '+359',
    capital: 'Sofia',
    langCodes: 'bg,tr-BG',
    areaSqKm: 110910,
    population: 7025037,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Bulgarien', id: 'bgr'),
      Phrase(langCode: 'ar', value: 'بلغاريا', id: 'bgr'),
      Phrase(langCode: 'en', value: 'Bulgaria', id: 'bgr'),
      Phrase(langCode: 'fr', value: 'Bulgarie', id: 'bgr'),
      Phrase(langCode: 'es', value: 'Bulgaria', id: 'bgr'),
      Phrase(langCode: 'zh', value: '保加利亚', id: 'bgr'),
    ],
  ),

  Flag(
    id: 'bfa',
    iso2: 'BF',
    icon: '$_flagIconPath/flag_af_w_burkina_faso.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+226',
    capital: 'Ouagadougou',
    langCodes: 'fr-BF',
    areaSqKm: 274200,
    population: 19751535,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Burkina Faso', id: 'bfa'),
      Phrase(langCode: 'ar', value: 'بوركينا فاسو', id: 'bfa'),
      Phrase(langCode: 'en', value: 'Burkina Faso', id: 'bfa'),
      Phrase(langCode: 'fr', value: 'Burkina Faso', id: 'bfa'),
      Phrase(langCode: 'es', value: 'Burkina Faso', id: 'bfa'),
      Phrase(langCode: 'zh', value: '布基纳法索', id: 'bfa'),
    ],
  ),

  Flag(
    id: 'bdi',
    iso2: 'BI',
    icon: '$_flagIconPath/flag_af_w_burundi.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'BIF',
    phoneCode: '+257',
    capital: 'Bujumbura',
    langCodes: 'fr-BI,rn',
    areaSqKm: 27830,
    population: 11175378,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Burundi', id: 'bdi'),
      Phrase(langCode: 'ar', value: 'بوروندي', id: 'bdi'),
      Phrase(langCode: 'en', value: 'Burundi', id: 'bdi'),
      Phrase(langCode: 'fr', value: 'Burundi', id: 'bdi'),
      Phrase(langCode: 'es', value: 'Burundi', id: 'bdi'),
      Phrase(langCode: 'zh', value: '布隆迪', id: 'bdi'),
    ],
  ),

  Flag(
    id: 'cpv',
    iso2: 'CV',
    icon: '$_flagIconPath/flag_af_w_cape_verde.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'CVE',
    phoneCode: '+238',
    capital: 'Praia',
    langCodes: 'pt-CV',
    areaSqKm: 4033,
    population: 543767,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kap Verde', id: 'cpv'),
      Phrase(langCode: 'ar', value: 'الرأس الأخضر', id: 'cpv'),
      Phrase(langCode: 'en', value: 'Cabo Verde', id: 'cpv'),
      Phrase(langCode: 'fr', value: 'Cap-Vert', id: 'cpv'),
      Phrase(langCode: 'es', value: 'Cabo Verde', id: 'cpv'),
      Phrase(langCode: 'zh', value: '佛得角', id: 'cpv'),
    ],
  ),

  Flag(
    id: 'khm',
    iso2: 'KH',
    icon: '$_flagIconPath/flag_as_se_cambodia.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KHR',
    phoneCode: '+855',
    capital: 'Phnom Penh',
    langCodes: 'km,fr,en',
    areaSqKm: 181040,
    population: 16249798,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kambodscha', id: 'khm'),
      Phrase(langCode: 'ar', value: 'كمبوديا', id: 'khm'),
      Phrase(langCode: 'en', value: 'Cambodia', id: 'khm'),
      Phrase(langCode: 'fr', value: 'Cambodge', id: 'khm'),
      Phrase(langCode: 'es', value: 'Camboya', id: 'khm'),
      Phrase(langCode: 'zh', value: '柬埔寨', id: 'khm'),
    ],
  ),

  Flag(
    id: 'cmr',
    iso2: 'CM',
    icon: '$_flagIconPath/flag_af_m_cameroon.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+237',
    capital: 'Yaounde',
    langCodes: 'en-CM,fr-CM',
    areaSqKm: 475440,
    population: 25216237,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kamerun', id: 'cmr'),
      Phrase(langCode: 'ar', value: 'الكاميرون', id: 'cmr'),
      Phrase(langCode: 'en', value: 'Cameroon', id: 'cmr'),
      Phrase(langCode: 'fr', value: 'Cameroun', id: 'cmr'),
      Phrase(langCode: 'es', value: 'Camerún', id: 'cmr'),
      Phrase(langCode: 'zh', value: '喀麦隆', id: 'cmr'),
    ],
  ),

  Flag(
    id: 'can',
    iso2: 'CA',
    icon: '$_flagIconPath/flag_na_n_canada.svg',
    region: 'Northern America',
    continent: 'North America',
    language: 'en',
    currencyID: 'CAD',
    phoneCode: '+1',
    capital: 'Ottawa',
    langCodes: 'en-CA,fr-CA,iu',
    areaSqKm: 9984670,
    population: 37057765,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kanada', id: 'can'),
      Phrase(langCode: 'ar', value: 'كندا', id: 'can'),
      Phrase(langCode: 'en', value: 'Canada', id: 'can'),
      Phrase(langCode: 'fr', value: 'Canada', id: 'can'),
      Phrase(langCode: 'es', value: 'Canadá', id: 'can'),
      Phrase(langCode: 'zh', value: '加拿大', id: 'can'),
    ],
  ),

  Flag(
    id: 'cym',
    iso2: 'KY',
    icon: '$_flagIconPath/flag_na_cr_cayman_islands.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'KYD',
    phoneCode: '+1',
    capital: 'George Town',
    langCodes: 'en-KY',
    areaSqKm: 262,
    population: 64174,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kaimaninseln', id: 'cym'),
      Phrase(langCode: 'ar', value: 'جزر كايمان', id: 'cym'),
      Phrase(langCode: 'en', value: 'Cayman Islands', id: 'cym'),
      Phrase(langCode: 'fr', value: 'Îles Caïmans', id: 'cym'),
      Phrase(langCode: 'es', value: 'Islas Caimán', id: 'cym'),
      Phrase(langCode: 'zh', value: '开曼群岛', id: 'cym'),
    ],
  ),

  Flag(
    id: 'caf',
    iso2: 'CF',
    icon: '$_flagIconPath/flag_af_m_central_african_republic.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+236',
    capital: 'Bangui',
    langCodes: 'fr-CF,sg,ln,kg',
    areaSqKm: 622984,
    population: 4666377,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Zentral­afrikanische Republik', id: 'caf'),
      Phrase(langCode: 'ar', value: 'جمهورية أفريقيا الوسطى', id: 'caf'),
      Phrase(langCode: 'en', value: 'Central African Republic', id: 'caf'),
      Phrase(langCode: 'fr', value: 'République centrafricaine', id: 'caf'),
      Phrase(langCode: 'es', value: 'República Centroafricana', id: 'caf'),
      Phrase(langCode: 'zh', value: '中非', id: 'caf'),
    ],
  ),

  Flag(
    id: 'tcd',
    iso2: 'TD',
    icon: '$_flagIconPath/flag_af_m_chad.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+235',
    capital: "N'Djamena",
    langCodes: 'fr-TD,ar-TD,sre',
    areaSqKm: 1284000,
    population: 15477751,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tschad', id: 'tcd'),
      Phrase(langCode: 'ar', value: 'تشاد', id: 'tcd'),
      Phrase(langCode: 'en', value: 'Chad', id: 'tcd'),
      Phrase(langCode: 'fr', value: 'Tchad', id: 'tcd'),
      Phrase(langCode: 'es', value: 'Chad', id: 'tcd'),
      Phrase(langCode: 'zh', value: '乍得', id: 'tcd'),
    ],
  ),

  Flag(
    id: 'chl',
    iso2: 'CL',
    icon: '$_flagIconPath/flag_sa_chile.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'CLP',
    phoneCode: '+56',
    capital: 'Santiago',
    langCodes: 'es-CL',
    areaSqKm: 756950,
    population: 18729160,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Chile', id: 'chl'),
      Phrase(langCode: 'ar', value: 'تشيلي', id: 'chl'),
      Phrase(langCode: 'en', value: 'Chile', id: 'chl'),
      Phrase(langCode: 'fr', value: 'Chili', id: 'chl'),
      Phrase(langCode: 'es', value: 'Chile', id: 'chl'),
      Phrase(langCode: 'zh', value: '智利', id: 'chl'),
    ],
  ),

  Flag(
    id: 'chn',
    iso2: 'CN',
    icon: '$_flagIconPath/flag_as_e_china.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'CNY',
    phoneCode: '+86',
    capital: 'Beijing',
    langCodes: 'zh-CN,yue,wuu,dta,ug,za',
    areaSqKm: 9596960,
    population: 1392730000,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Volksrepublik China', id: 'chn'),
      Phrase(langCode: 'ar', value: 'الصين', id: 'chn'),
      Phrase(langCode: 'en', value: 'China', id: 'chn'),
      Phrase(langCode: 'fr', value: 'Chine', id: 'chn'),
      Phrase(langCode: 'es', value: 'China', id: 'chn'),
      Phrase(langCode: 'zh', value: '中国', id: 'chn'),
    ],
  ),

  Flag(
    id: 'col',
    iso2: 'CO',
    icon: '$_flagIconPath/flag_sa_colombia.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'COP',
    phoneCode: '+57',
    capital: 'Bogota',
    langCodes: 'es-CO',
    areaSqKm: 1138910,
    population: 49648685,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kolumbien', id: 'col'),
      Phrase(langCode: 'ar', value: 'كولومبيا', id: 'col'),
      Phrase(langCode: 'en', value: 'Colombia', id: 'col'),
      Phrase(langCode: 'fr', value: 'Colombie', id: 'col'),
      Phrase(langCode: 'es', value: 'Colombia', id: 'col'),
      Phrase(langCode: 'zh', value: '哥伦比亚', id: 'col'),
    ],
  ),

  Flag(
    id: 'com',
    iso2: 'KM',
    icon: '$_flagIconPath/flag_af_e_comoros.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'KMF',
    phoneCode: '+269',
    capital: 'Moroni',
    langCodes: 'ar,fr-KM',
    areaSqKm: 2170,
    population: 832322,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Komoren', id: 'com'),
      Phrase(langCode: 'ar', value: 'جزر القمر', id: 'com'),
      Phrase(langCode: 'en', value: 'Comoros', id: 'com'),
      Phrase(langCode: 'fr', value: 'Comores (pays)', id: 'com'),
      Phrase(langCode: 'es', value: 'Comoras', id: 'com'),
      Phrase(langCode: 'zh', value: '科摩罗', id: 'com'),
    ],
  ),

  Flag(
    id: 'cog',
    iso2: 'CG',
    icon: '$_flagIconPath/flag_af_m_congo.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+242',
    capital: 'Brazzaville',
    langCodes: 'fr-CG,kg,ln-CG',
    areaSqKm: 342000,
    population: 5244363,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kongo, Republik', id: 'cog'),
      Phrase(langCode: 'ar', value: 'جمهورية الكونغو', id: 'cog'),
      Phrase(langCode: 'en', value: 'Congo (Brazzaville)', id: 'cog'),
      Phrase(langCode: 'fr', value: 'République du Congo', id: 'cog'),
      Phrase(langCode: 'es', value: 'República del Congo', id: 'cog'),
      Phrase(langCode: 'zh', value: '刚果共和国', id: 'cog'),
    ],
  ),

  Flag(
    id: 'cod',
    iso2: 'CD',
    icon: '$_flagIconPath/flag_af_m_congo2.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'CDF',
    phoneCode: '+243',
    capital: 'Kinshasa',
    langCodes: 'fr-CD,ln,kg',
    areaSqKm: 2345410,
    population: 84068091,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kongo, Demokratische Republik', id: 'cod'),
      Phrase(langCode: 'ar', value: 'جمهورية الكونغو الديمقراطية', id: 'cod'),
      Phrase(langCode: 'en', value: 'Congo (Kinshasa)', id: 'cod'),
      Phrase(langCode: 'fr', value: 'République démocratique du Congo', id: 'cod'),
      Phrase(langCode: 'es', value: 'República Democrática del Congo', id: 'cod'),
      Phrase(langCode: 'zh', value: '刚果民主共和国', id: 'cod'),
    ],
  ),

  Flag(
    id: 'cok',
    iso2: 'CK',
    icon: '$_flagIconPath/flag_oc_poly_cook_islands.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'NZD',
    phoneCode: '+682',
    capital: 'Avarua',
    langCodes: 'en-CK,mi',
    areaSqKm: 240,
    population: 17379,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Cookinseln', id: 'cok'),
      Phrase(langCode: 'ar', value: 'جزر كوك', id: 'cok'),
      Phrase(langCode: 'en', value: 'Cook Islands', id: 'cok'),
      Phrase(langCode: 'fr', value: 'Îles Cook', id: 'cok'),
      Phrase(langCode: 'es', value: 'Islas Cook', id: 'cok'),
      Phrase(langCode: 'zh', value: '库克群岛', id: 'cok'),
    ],
  ),

  Flag(
    id: 'cri',
    iso2: 'CR',
    icon: '$_flagIconPath/flag_sa_costa_rica.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'CRC',
    phoneCode: '+506',
    capital: 'San Jose',
    langCodes: 'es-CR,en',
    areaSqKm: 51100,
    population: 4999441,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Costa Rica', id: 'cri'),
      Phrase(langCode: 'ar', value: 'كوستاريكا', id: 'cri'),
      Phrase(langCode: 'en', value: 'Costa Rica', id: 'cri'),
      Phrase(langCode: 'fr', value: 'Costa Rica', id: 'cri'),
      Phrase(langCode: 'es', value: 'Costa Rica', id: 'cri'),
      Phrase(langCode: 'zh', value: '哥斯达黎加', id: 'cri'),
    ],
  ),

  Flag(
    id: 'civ',
    iso2: 'CI',
    icon: '$_flagIconPath/flag_af_w_cote_divoire.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+225',
    capital: 'Yamoussoukro',
    langCodes: 'fr-CI',
    areaSqKm: 322460,
    population: 25069229,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Elfenbeinküste', id: 'civ'),
      Phrase(langCode: 'ar', value: 'ساحل العاج', id: 'civ'),
      Phrase(langCode: 'en', value: 'Côte D’Ivoire', id: 'civ'),
      Phrase(langCode: 'fr', value: "Côte d'Ivoire", id: 'civ'),
      Phrase(langCode: 'es', value: 'Costa de Marfil', id: 'civ'),
      Phrase(langCode: 'zh', value: '科特迪瓦', id: 'civ'),
    ],
  ),

  Flag(
    id: 'hrv',
    iso2: 'HR',
    icon: '$_flagIconPath/flag_eu_s_croatia.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'HRK',
    phoneCode: '+385',
    capital: 'Zagreb',
    langCodes: 'hr-HR,sr',
    areaSqKm: 56542,
    population: 4087843,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kroatien', id: 'hrv'),
      Phrase(langCode: 'ar', value: 'كرواتيا', id: 'hrv'),
      Phrase(langCode: 'en', value: 'Croatia', id: 'hrv'),
      Phrase(langCode: 'fr', value: 'Croatie', id: 'hrv'),
      Phrase(langCode: 'es', value: 'Croacia', id: 'hrv'),
      Phrase(langCode: 'zh', value: '克罗地亚', id: 'hrv'),
    ],
  ),

  Flag(
    id: 'cub',
    iso2: 'CU',
    icon: '$_flagIconPath/flag_na_cr_cuba.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'CUP',
    phoneCode: '+53',
    capital: 'Havana',
    langCodes: 'es-CU',
    areaSqKm: 110860,
    population: 11338138,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kuba', id: 'cub'),
      Phrase(langCode: 'ar', value: 'كوبا', id: 'cub'),
      Phrase(langCode: 'en', value: 'Cuba', id: 'cub'),
      Phrase(langCode: 'fr', value: 'Cuba', id: 'cub'),
      Phrase(langCode: 'es', value: 'Cuba', id: 'cub'),
      Phrase(langCode: 'zh', value: '古巴', id: 'cub'),
    ],
  ),

  Flag(
    id: 'cuw',
    iso2: 'CW',
    icon: '$_flagIconPath/flag_na_cr_curacao.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'ANG',
    phoneCode: '+599',
    capital: 'Willemstad',
    langCodes: 'nl,pap',
    areaSqKm: 444,
    population: null,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Curaçao', id: 'cuw'),
      Phrase(langCode: 'ar', value: 'كوراساو', id: 'cuw'),
      Phrase(langCode: 'en', value: 'Curaçao', id: 'cuw'),
      Phrase(langCode: 'fr', value: 'Curaçao', id: 'cuw'),
      Phrase(langCode: 'es', value: 'Curazao', id: 'cuw'),
      Phrase(langCode: 'zh', value: '库拉索', id: 'cuw'),
    ],
  ),

  Flag(
    id: 'cyp',
    iso2: 'CY',
    icon: '$_flagIconPath/flag_as_w_cyprus.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+357',
    capital: 'Nicosia',
    langCodes: 'el-CY,tr-CY,en',
    areaSqKm: 9250,
    population: 1189265,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Zypern', id: 'cyp'),
      Phrase(langCode: 'ar', value: 'قبرص', id: 'cyp'),
      Phrase(langCode: 'en', value: 'Cyprus', id: 'cyp'),
      Phrase(langCode: 'fr', value: 'Chypre (pays)', id: 'cyp'),
      Phrase(langCode: 'es', value: 'Chipre', id: 'cyp'),
      Phrase(langCode: 'zh', value: '塞浦路斯', id: 'cyp'),
    ],
  ),

  Flag(
    id: 'cze',
    iso2: 'CZ',
    icon: '$_flagIconPath/flag_eu_e_czech_republic.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'CZK',
    phoneCode: '+420',
    capital: 'Prague',
    langCodes: 'cs,sk',
    areaSqKm: 78866,
    population: 10629928,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tschechien', id: 'cze'),
      Phrase(langCode: 'ar', value: 'جمهورية التشيك', id: 'cze'),
      Phrase(langCode: 'en', value: 'Czechia', id: 'cze'),
      Phrase(langCode: 'fr', value: 'Tchéquie', id: 'cze'),
      Phrase(langCode: 'es', value: 'República Checa', id: 'cze'),
      Phrase(langCode: 'zh', value: '捷克', id: 'cze'),
    ],
  ),

  Flag(
    id: 'dnk',
    iso2: 'DK',
    icon: '$_flagIconPath/flag_eu_n_denmark.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'DKK',
    phoneCode: '+45',
    capital: 'Copenhagen',
    langCodes: 'da-DK,en,fo,de-DK',
    areaSqKm: 43094,
    population: 5793636,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Dänemark', id: 'dnk'),
      Phrase(langCode: 'ar', value: 'الدنمارك', id: 'dnk'),
      Phrase(langCode: 'en', value: 'Denmark', id: 'dnk'),
      Phrase(langCode: 'fr', value: 'Danemark', id: 'dnk'),
      Phrase(langCode: 'es', value: 'Dinamarca', id: 'dnk'),
      Phrase(langCode: 'zh', value: '丹麦', id: 'dnk'),
    ],
  ),

  Flag(
    id: 'dji',
    iso2: 'DJ',
    icon: '$_flagIconPath/flag_af_e_djibouti.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'DJF',
    phoneCode: '+253',
    capital: 'Djibouti',
    langCodes: 'fr-DJ,ar,so-DJ,aa',
    areaSqKm: 23000,
    population: 958920,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Dschibuti', id: 'dji'),
      Phrase(langCode: 'ar', value: 'جيبوتي', id: 'dji'),
      Phrase(langCode: 'en', value: 'Djibouti', id: 'dji'),
      Phrase(langCode: 'fr', value: 'Djibouti', id: 'dji'),
      Phrase(langCode: 'es', value: 'Yibuti', id: 'dji'),
      Phrase(langCode: 'zh', value: '吉布提', id: 'dji'),
    ],
  ),

  Flag(
    id: 'dma',
    iso2: 'DM',
    icon: '$_flagIconPath/flag_na_cr_dominica.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: 'Roseau',
    langCodes: 'en-DM',
    areaSqKm: 754,
    population: 71625,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Dominica', id: 'dma'),
      Phrase(langCode: 'ar', value: 'دومينيكا', id: 'dma'),
      Phrase(langCode: 'en', value: 'Dominica', id: 'dma'),
      Phrase(langCode: 'fr', value: 'Dominique', id: 'dma'),
      Phrase(langCode: 'es', value: 'Dominica', id: 'dma'),
      Phrase(langCode: 'zh', value: '多米尼克', id: 'dma'),
    ],
  ),

  Flag(
    id: 'dom',
    iso2: 'DO',
    icon: '$_flagIconPath/flag_na_cr_dominican_republic.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'DOP',
    phoneCode: '+1',
    capital: 'Santo Domingo',
    langCodes: 'es-DO',
    areaSqKm: 48730,
    population: 10627165,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Dominikanische Republik', id: 'dom'),
      Phrase(langCode: 'ar', value: 'جمهورية الدومينيكان', id: 'dom'),
      Phrase(langCode: 'en', value: 'Dominican Republic', id: 'dom'),
      Phrase(langCode: 'fr', value: 'République dominicaine', id: 'dom'),
      Phrase(langCode: 'es', value: 'República Dominicana', id: 'dom'),
      Phrase(langCode: 'zh', value: '多米尼加', id: 'dom'),
    ],
  ),

  Flag(
    id: 'ecu',
    iso2: 'EC',
    icon: '$_flagIconPath/flag_sa_ecuador.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+593',
    capital: 'Quito',
    langCodes: 'es-EC',
    areaSqKm: 283560,
    population: 17084357,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ecuador', id: 'ecu'),
      Phrase(langCode: 'ar', value: 'الإكوادور', id: 'ecu'),
      Phrase(langCode: 'en', value: 'Ecuador', id: 'ecu'),
      Phrase(langCode: 'fr', value: 'Équateur (pays)', id: 'ecu'),
      Phrase(langCode: 'es', value: 'Ecuador', id: 'ecu'),
      Phrase(langCode: 'zh', value: '厄瓜多尔', id: 'ecu'),
    ],
  ),

  Flag(
    id: 'egy',
    iso2: 'EG',
    icon: '$_flagIconPath/flag_af_n_egypt.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'EGP',
    phoneCode: '+2',
    capital: 'Cairo',
    langCodes: 'ar-EG,en,fr',
    areaSqKm: 1001450,
    population: 98423595,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ägypten', id: 'egy'),
      Phrase(langCode: 'ar', value: 'مصر', id: 'egy'),
      Phrase(langCode: 'en', value: 'Egypt', id: 'egy'),
      Phrase(langCode: 'fr', value: 'Égypte', id: 'egy'),
      Phrase(langCode: 'es', value: 'Egipto', id: 'egy'),
      Phrase(langCode: 'zh', value: '埃及', id: 'egy'),
    ],
  ),

  Flag(
    id: 'slv',
    iso2: 'SV',
    icon: '$_flagIconPath/flag_na_c_el_salvador.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+503',
    capital: 'San Salvador',
    langCodes: 'es-SV',
    areaSqKm: 21040,
    population: 6420744,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'El Salvador', id: 'slv'),
      Phrase(langCode: 'ar', value: 'السلفادور', id: 'slv'),
      Phrase(langCode: 'en', value: 'El Salvador', id: 'slv'),
      Phrase(langCode: 'fr', value: 'Salvador', id: 'slv'),
      Phrase(langCode: 'es', value: 'El Salvador', id: 'slv'),
      Phrase(langCode: 'zh', value: '萨尔瓦多', id: 'slv'),
    ],
  ),

  Flag(
    id: 'gnq',
    iso2: 'GQ',
    icon: '$_flagIconPath/flag_af_m_equatorial_guinea.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+240',
    capital: 'Malabo',
    langCodes: 'es-GQ,fr',
    areaSqKm: 28051,
    population: 1308974,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Äquatorialguinea', id: 'gnq'),
      Phrase(langCode: 'ar', value: 'غينيا الاستوائية', id: 'gnq'),
      Phrase(langCode: 'en', value: 'Equatorial Guinea', id: 'gnq'),
      Phrase(langCode: 'fr', value: 'Guinée équatoriale', id: 'gnq'),
      Phrase(langCode: 'es', value: 'Guinea Ecuatorial', id: 'gnq'),
      Phrase(langCode: 'zh', value: '赤道几内亚', id: 'gnq'),
    ],
  ),

  Flag(
    id: 'eri',
    iso2: 'ER',
    icon: '$_flagIconPath/flag_af_e_eritrea.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'ERN',
    phoneCode: '+291',
    capital: 'Asmara',
    langCodes: 'aa-ER,ar,tig,kun,ti-ER',
    areaSqKm: 121320,
    population: 6213972,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Eritrea', id: 'eri'),
      Phrase(langCode: 'ar', value: 'إريتريا', id: 'eri'),
      Phrase(langCode: 'en', value: 'Eritrea', id: 'eri'),
      Phrase(langCode: 'fr', value: 'Érythrée', id: 'eri'),
      Phrase(langCode: 'es', value: 'Eritrea', id: 'eri'),
      Phrase(langCode: 'zh', value: '厄立特里亚', id: 'eri'),
    ],
  ),

  Flag(
    id: 'est',
    iso2: 'EE',
    icon: '$_flagIconPath/flag_eu_n_estonia.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+372',
    capital: 'Tallinn',
    langCodes: 'et,ru',
    areaSqKm: 45226,
    population: 1321977,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Estland', id: 'est'),
      Phrase(langCode: 'ar', value: 'إستونيا', id: 'est'),
      Phrase(langCode: 'en', value: 'Estonia', id: 'est'),
      Phrase(langCode: 'fr', value: 'Estonie', id: 'est'),
      Phrase(langCode: 'es', value: 'Estonia', id: 'est'),
      Phrase(langCode: 'zh', value: '爱沙尼亚', id: 'est'),
    ],
  ),

  Flag(
    id: 'swz',
    iso2: 'SZ',
    icon: '$_flagIconPath/flag_af_s_swaziland.svg',
    region: 'Southern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SZL',
    phoneCode: '+268',
    capital: 'Mbabane',
    langCodes: 'en-SZ,ss-SZ',
    areaSqKm: 17363,
    population: 1136191,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Eswatini', id: 'swz'),
      Phrase(langCode: 'ar', value: 'إسواتيني', id: 'swz'),
      Phrase(langCode: 'en', value: 'Swaziland', id: 'swz'),
      Phrase(langCode: 'fr', value: 'Eswatini', id: 'swz'),
      Phrase(langCode: 'es', value: 'Suazilandia', id: 'swz'),
      Phrase(langCode: 'zh', value: '斯威士兰', id: 'swz'),
    ],
  ),

  Flag(
    id: 'eth',
    iso2: 'ET',
    icon: '$_flagIconPath/flag_af_e_ethiopia.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'ETB',
    phoneCode: '+251',
    capital: 'Addis Ababa',
    langCodes: 'am,en-ET,om-ET,ti-ET,so-ET,sid',
    areaSqKm: 1127127,
    population: 109224559,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Äthiopien', id: 'eth'),
      Phrase(langCode: 'ar', value: 'إثيوبيا', id: 'eth'),
      Phrase(langCode: 'en', value: 'Ethiopia', id: 'eth'),
      Phrase(langCode: 'fr', value: 'Éthiopie', id: 'eth'),
      Phrase(langCode: 'es', value: 'Etiopía', id: 'eth'),
      Phrase(langCode: 'zh', value: '埃塞俄比亚', id: 'eth'),
    ],
  ),

  Flag(
    id: 'flk',
    iso2: 'FK',
    icon: '$_flagIconPath/flag_sa_falkland_islands.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'FKP',
    phoneCode: '+500',
    capital: 'Stanley',
    langCodes: 'en-FK',
    areaSqKm: 12173,
    population: 2840,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Falklandinseln', id: 'flk'),
      Phrase(langCode: 'ar', value: 'جزر فوكلاند', id: 'flk'),
      Phrase(langCode: 'en', value: 'Falkland Islands (Islas Malvinas)', id: 'flk'),
      Phrase(langCode: 'fr', value: 'Malouines', id: 'flk'),
      Phrase(langCode: 'es', value: 'Islas Malvinas', id: 'flk'),
      Phrase(langCode: 'zh', value: '福克兰群岛', id: 'flk'),
    ],
  ),

  Flag(
    id: 'fro',
    iso2: 'FO',
    icon: '$_flagIconPath/flag_eu_n_faroe_islands.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'DKK',
    phoneCode: '+298',
    capital: 'Torshavn',
    langCodes: 'fo,da-FO',
    areaSqKm: 1399,
    population: 48497,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Färöer', id: 'fro'),
      Phrase(langCode: 'ar', value: 'جزر فارو', id: 'fro'),
      Phrase(langCode: 'en', value: 'Faroe Islands', id: 'fro'),
      Phrase(langCode: 'fr', value: 'Îles Féroé', id: 'fro'),
      Phrase(langCode: 'es', value: 'Islas Feroe', id: 'fro'),
      Phrase(langCode: 'zh', value: '法罗群岛', id: 'fro'),
    ],
  ),

  Flag(
    id: 'fji',
    iso2: 'FJ',
    icon: '$_flagIconPath/flag_oc_melan_fiji.svg',
    region: 'Melanesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'FJD',
    phoneCode: '+679',
    capital: 'Suva',
    langCodes: 'en-FJ,fj',
    areaSqKm: 18270,
    population: 883483,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Fidschi', id: 'fji'),
      Phrase(langCode: 'ar', value: 'فيجي', id: 'fji'),
      Phrase(langCode: 'en', value: 'Fiji', id: 'fji'),
      Phrase(langCode: 'fr', value: 'Fidji', id: 'fji'),
      Phrase(langCode: 'es', value: 'Fiyi', id: 'fji'),
      Phrase(langCode: 'zh', value: '斐济', id: 'fji'),
    ],
  ),

  Flag(
    id: 'fin',
    iso2: 'FI',
    icon: '$_flagIconPath/flag_eu_n_finland.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+358',
    capital: 'Helsinki',
    langCodes: 'fi-FI,sv-FI,smn',
    areaSqKm: 337030,
    population: 5515525,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Finnland', id: 'fin'),
      Phrase(langCode: 'ar', value: 'فنلندا', id: 'fin'),
      Phrase(langCode: 'en', value: 'Finland', id: 'fin'),
      Phrase(langCode: 'fr', value: 'Finlande', id: 'fin'),
      Phrase(langCode: 'es', value: 'Finlandia', id: 'fin'),
      Phrase(langCode: 'zh', value: '芬兰', id: 'fin'),
    ],
  ),

  Flag(
    id: 'fra',
    iso2: 'FR',
    icon: '$_flagIconPath/flag_eu_w_france.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+33',
    capital: 'Paris',
    langCodes: 'fr-FR,frp,br,co,ca,eu,oc',
    areaSqKm: 547030,
    population: 66977107,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Frankreich', id: 'fra'),
      Phrase(langCode: 'ar', value: 'فرنسا', id: 'fra'),
      Phrase(langCode: 'en', value: 'France', id: 'fra'),
      Phrase(langCode: 'fr', value: 'France', id: 'fra'),
      Phrase(langCode: 'es', value: 'Francia', id: 'fra'),
      Phrase(langCode: 'zh', value: '法国', id: 'fra'),
    ],
  ),

  Flag(
    id: 'pyf',
    iso2: 'PF',
    icon: '$_flagIconPath/flag_oc_poly_french_polynesia.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'XPF',
    phoneCode: '+689',
    capital: 'Papeete',
    langCodes: 'fr-PF,ty',
    areaSqKm: 4167,
    population: 277679,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Französisch-Polynesien', id: 'pyf'),
      Phrase(langCode: 'ar', value: 'بولينزيا الفرنسية', id: 'pyf'),
      Phrase(langCode: 'en', value: 'French Polynesia', id: 'pyf'),
      Phrase(langCode: 'fr', value: 'Polynésie française', id: 'pyf'),
      Phrase(langCode: 'es', value: 'Polinesia Francesa', id: 'pyf'),
      Phrase(langCode: 'zh', value: '法属波利尼西亚', id: 'pyf'),
    ],
  ),

  Flag(
    id: 'gab',
    iso2: 'GA',
    icon: '$_flagIconPath/flag_af_m_gabon.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XAF',
    phoneCode: '+241',
    capital: 'Libreville',
    langCodes: 'fr-GA',
    areaSqKm: 267667,
    population: 2119275,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Gabun', id: 'gab'),
      Phrase(langCode: 'ar', value: 'الغابون', id: 'gab'),
      Phrase(langCode: 'en', value: 'Gabon', id: 'gab'),
      Phrase(langCode: 'fr', value: 'Gabon', id: 'gab'),
      Phrase(langCode: 'es', value: 'Gabón', id: 'gab'),
      Phrase(langCode: 'zh', value: '加蓬', id: 'gab'),
    ],
  ),

  Flag(
    id: 'gmb',
    iso2: 'GM',
    icon: '$_flagIconPath/flag_af_w_gambia.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'GMD',
    phoneCode: '+220',
    capital: 'Banjul',
    langCodes: 'en-GM,mnk,wof,wo,ff',
    areaSqKm: 11300,
    population: 2280102,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Gambia', id: 'gmb'),
      Phrase(langCode: 'ar', value: 'غامبيا', id: 'gmb'),
      Phrase(langCode: 'en', value: 'Gambia, The', id: 'gmb'),
      Phrase(langCode: 'fr', value: 'Gambie', id: 'gmb'),
      Phrase(langCode: 'es', value: 'Gambia', id: 'gmb'),
      Phrase(langCode: 'zh', value: '冈比亚', id: 'gmb'),
    ],
  ),

  Flag(
    id: 'geo',
    iso2: 'GE',
    icon: '$_flagIconPath/flag_as_w_georgia.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'GEL',
    phoneCode: '+995',
    capital: 'Tbilisi',
    langCodes: 'ka,ru,hy,az',
    areaSqKm: 69700,
    population: 3726549,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Georgien', id: 'geo'),
      Phrase(langCode: 'ar', value: 'جورجيا', id: 'geo'),
      Phrase(langCode: 'en', value: 'Georgia', id: 'geo'),
      Phrase(langCode: 'fr', value: 'Géorgie (pays)', id: 'geo'),
      Phrase(langCode: 'es', value: 'Georgia', id: 'geo'),
      Phrase(langCode: 'zh', value: '格鲁吉亚', id: 'geo'),
    ],
  ),

  Flag(
    id: 'deu',
    iso2: 'DE',
    icon: '$_flagIconPath/flag_eu_w_germany.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+49',
    capital: 'Berlin',
    langCodes: 'de',
    areaSqKm: 357021,
    population: 82905782,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Deutschland', id: 'deu'),
      Phrase(langCode: 'ar', value: 'ألمانيا', id: 'deu'),
      Phrase(langCode: 'en', value: 'Germany', id: 'deu'),
      Phrase(langCode: 'fr', value: 'Allemagne', id: 'deu'),
      Phrase(langCode: 'es', value: 'Alemania', id: 'deu'),
      Phrase(langCode: 'zh', value: '德国', id: 'deu'),
    ],
  ),

  Flag(
    id: 'gha',
    iso2: 'GH',
    icon: '$_flagIconPath/flag_af_w_ghana.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'GHS',
    phoneCode: '+233',
    capital: 'Accra',
    langCodes: 'en-GH,ak,ee,tw',
    areaSqKm: 239460,
    population: 29767108,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ghana', id: 'gha'),
      Phrase(langCode: 'ar', value: 'غانا', id: 'gha'),
      Phrase(langCode: 'en', value: 'Ghana', id: 'gha'),
      Phrase(langCode: 'fr', value: 'Ghana', id: 'gha'),
      Phrase(langCode: 'es', value: 'Ghana', id: 'gha'),
      Phrase(langCode: 'zh', value: '加纳', id: 'gha'),
    ],
  ),

  Flag(
    id: 'gib',
    iso2: 'GI',
    icon: '$_flagIconPath/flag_eu_s_gibraltar.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'GIP',
    phoneCode: '+350',
    capital: 'Gibraltar',
    langCodes: 'en-GI,es,it,pt',
    areaSqKm: 7,
    population: 33718,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Gibraltar', id: 'gib'),
      Phrase(langCode: 'ar', value: 'جبل طارق', id: 'gib'),
      Phrase(langCode: 'en', value: 'Gibraltar', id: 'gib'),
      Phrase(langCode: 'fr', value: 'Gibraltar', id: 'gib'),
      Phrase(langCode: 'es', value: 'Gibraltar', id: 'gib'),
      Phrase(langCode: 'zh', value: '直布罗陀', id: 'gib'),
    ],
  ),

  Flag(
    id: 'grc',
    iso2: 'GR',
    icon: '$_flagIconPath/flag_eu_s_greece.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+30',
    capital: 'Athens',
    langCodes: 'el-GR,en,fr',
    areaSqKm: 131940,
    population: 10731726,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Griechenland', id: 'grc'),
      Phrase(langCode: 'ar', value: 'اليونان', id: 'grc'),
      Phrase(langCode: 'en', value: 'Greece', id: 'grc'),
      Phrase(langCode: 'fr', value: 'Grèce', id: 'grc'),
      Phrase(langCode: 'es', value: 'Grecia', id: 'grc'),
      Phrase(langCode: 'zh', value: '希腊', id: 'grc'),
    ],
  ),

  Flag(
    id: 'grl',
    iso2: 'GL',
    icon: '$_flagIconPath/flag_na_n_greenland.svg',
    region: 'Northern America',
    continent: 'North America',
    language: 'en',
    currencyID: 'DKK',
    phoneCode: '+299',
    capital: 'Nuuk',
    langCodes: 'kl,da-GL,en',
    areaSqKm: 2166086,
    population: 56025,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Grönland', id: 'grl'),
      Phrase(langCode: 'ar', value: 'جرينلاند', id: 'grl'),
      Phrase(langCode: 'en', value: 'Greenland', id: 'grl'),
      Phrase(langCode: 'fr', value: 'Groenland', id: 'grl'),
      Phrase(langCode: 'es', value: 'Groenlandia', id: 'grl'),
      Phrase(langCode: 'zh', value: '格陵兰', id: 'grl'),
    ],
  ),

  Flag(
    id: 'grd',
    iso2: 'GD',
    icon: '$_flagIconPath/flag_na_cr_grenada.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: "St. George's",
    langCodes: 'en-GD',
    areaSqKm: 344,
    population: 111454,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Grenada', id: 'grd'),
      Phrase(langCode: 'ar', value: 'غرينادا', id: 'grd'),
      Phrase(langCode: 'en', value: 'Grenada', id: 'grd'),
      Phrase(langCode: 'fr', value: 'Grenade (pays)', id: 'grd'),
      Phrase(langCode: 'es', value: 'Granada', id: 'grd'),
      Phrase(langCode: 'zh', value: '格林纳达', id: 'grd'),
    ],
  ),

  Flag(
    id: 'gum',
    iso2: 'GU',
    icon: '$_flagIconPath/flag_oc_micro_guam.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'Hagatna',
    langCodes: 'en-GU,ch-GU',
    areaSqKm: 549,
    population: 165768,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Guam', id: 'gum'),
      Phrase(langCode: 'ar', value: 'غوام', id: 'gum'),
      Phrase(langCode: 'en', value: 'Guam', id: 'gum'),
      Phrase(langCode: 'fr', value: 'Guam', id: 'gum'),
      Phrase(langCode: 'es', value: 'Guam', id: 'gum'),
      Phrase(langCode: 'zh', value: '关岛', id: 'gum'),
    ],
  ),

  Flag(
    id: 'gtm',
    iso2: 'GT',
    icon: '$_flagIconPath/flag_na_c_guatemala.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'GTQ',
    phoneCode: '+502',
    capital: 'Guatemala City',
    langCodes: 'es-GT',
    areaSqKm: 108890,
    population: 17247807,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Guatemala', id: 'gtm'),
      Phrase(langCode: 'ar', value: 'غواتيمالا', id: 'gtm'),
      Phrase(langCode: 'en', value: 'Guatemala', id: 'gtm'),
      Phrase(langCode: 'fr', value: 'Guatemala', id: 'gtm'),
      Phrase(langCode: 'es', value: 'Guatemala', id: 'gtm'),
      Phrase(langCode: 'zh', value: '危地马拉', id: 'gtm'),
    ],
  ),

  Flag(
    id: 'gin',
    iso2: 'GN',
    icon: '$_flagIconPath/flag_af_w_guinea.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'GNF',
    phoneCode: '+224',
    capital: 'Conakry',
    langCodes: 'fr-GN',
    areaSqKm: 245857,
    population: 12414318,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Guinea', id: 'gin'),
      Phrase(langCode: 'ar', value: 'غينيا', id: 'gin'),
      Phrase(langCode: 'en', value: 'Guinea', id: 'gin'),
      Phrase(langCode: 'fr', value: 'Guinée', id: 'gin'),
      Phrase(langCode: 'es', value: 'Guinea', id: 'gin'),
      Phrase(langCode: 'zh', value: '几内亚', id: 'gin'),
    ],
  ),

  Flag(
    id: 'gnb',
    iso2: 'GW',
    icon: '$_flagIconPath/flag_af_w_guinea_bissau.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+245',
    capital: 'Bissau',
    langCodes: 'pt-GW,pov',
    areaSqKm: 36120,
    population: 1874309,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Guinea-Bissau', id: 'gnb'),
      Phrase(langCode: 'ar', value: 'غينيا بيساو', id: 'gnb'),
      Phrase(langCode: 'en', value: 'Guinea-Bissau', id: 'gnb'),
      Phrase(langCode: 'fr', value: 'Guinée-Bissau', id: 'gnb'),
      Phrase(langCode: 'es', value: 'Guinea-Bisáu', id: 'gnb'),
      Phrase(langCode: 'zh', value: '几内亚比绍', id: 'gnb'),
    ],
  ),

  Flag(
    id: 'guy',
    iso2: 'GY',
    icon: '$_flagIconPath/flag_sa_guyana.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'GYD',
    phoneCode: '+592',
    capital: 'Georgetown',
    langCodes: 'en-GY',
    areaSqKm: 214970,
    population: 779004,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Guyana', id: 'guy'),
      Phrase(langCode: 'ar', value: 'غيانا', id: 'guy'),
      Phrase(langCode: 'en', value: 'Guyana', id: 'guy'),
      Phrase(langCode: 'fr', value: 'Guyana', id: 'guy'),
      Phrase(langCode: 'es', value: 'Guyana', id: 'guy'),
      Phrase(langCode: 'zh', value: '圭亚那', id: 'guy'),
    ],
  ),

  Flag(
    id: 'hti',
    iso2: 'HT',
    icon: '$_flagIconPath/flag_na_cr_haiti.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'HTG',
    phoneCode: '+509',
    capital: 'Port-au-Prince',
    langCodes: 'ht,fr-HT',
    areaSqKm: 27750,
    population: 11123176,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Haiti', id: 'hti'),
      Phrase(langCode: 'ar', value: 'هايتي', id: 'hti'),
      Phrase(langCode: 'en', value: 'Haiti', id: 'hti'),
      Phrase(langCode: 'fr', value: 'Haïti', id: 'hti'),
      Phrase(langCode: 'es', value: 'Haití', id: 'hti'),
      Phrase(langCode: 'zh', value: '海地', id: 'hti'),
    ],
  ),

  Flag(
    id: 'vat',
    iso2: 'VA',
    icon: '$_flagIconPath/flag_eu_w_vatican_city.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+379',
    capital: 'Vatican City',
    langCodes: 'la,it,fr',
    areaSqKm: 0,
    population: 825,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vatikanstadt', id: 'vat'),
      Phrase(langCode: 'ar', value: 'الفاتيكان', id: 'vat'),
      Phrase(langCode: 'en', value: 'Vatican City', id: 'vat'),
      Phrase(langCode: 'fr', value: 'Saint-Siège (État de la Cité du Vatican)', id: 'vat'),
      Phrase(langCode: 'es', value: 'Vaticano, Ciudad del', id: 'vat'),
      Phrase(langCode: 'zh', value: '梵蒂冈', id: 'vat'),
    ],
  ),

  Flag(
    id: 'hnd',
    iso2: 'HN',
    icon: '$_flagIconPath/flag_na_c_honduras.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'HNL',
    phoneCode: '+504',
    capital: 'Tegucigalpa',
    langCodes: 'es-HN',
    areaSqKm: 112090,
    population: 9587522,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Honduras', id: 'hnd'),
      Phrase(langCode: 'ar', value: 'هندوراس', id: 'hnd'),
      Phrase(langCode: 'en', value: 'Honduras', id: 'hnd'),
      Phrase(langCode: 'fr', value: 'Honduras', id: 'hnd'),
      Phrase(langCode: 'es', value: 'Honduras', id: 'hnd'),
      Phrase(langCode: 'zh', value: '洪都拉斯', id: 'hnd'),
    ],
  ),

  Flag(
    id: 'hkg',
    iso2: 'HK',
    icon: '$_flagIconPath/flag_as_e_hong_kong.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'HKD',
    phoneCode: '+852',
    capital: 'Hong Kong',
    langCodes: 'zh-HK,yue,zh,en',
    areaSqKm: 1092,
    population: 7451000,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Hongkong', id: 'hkg'),
      Phrase(langCode: 'ar', value: 'هونغ كونغ', id: 'hkg'),
      Phrase(langCode: 'en', value: 'Hong Kong', id: 'hkg'),
      Phrase(langCode: 'fr', value: 'Hong Kong', id: 'hkg'),
      Phrase(langCode: 'es', value: 'Hong Kong', id: 'hkg'),
      Phrase(langCode: 'zh', value: '香港', id: 'hkg'),
    ],
  ),

  Flag(
    id: 'hun',
    iso2: 'HU',
    icon: '$_flagIconPath/flag_eu_e_hungary.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'HUF',
    phoneCode: '+36',
    capital: 'Budapest',
    langCodes: 'hu-HU',
    areaSqKm: 93030,
    population: 9775564,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ungarn', id: 'hun'),
      Phrase(langCode: 'ar', value: 'المجر', id: 'hun'),
      Phrase(langCode: 'en', value: 'Hungary', id: 'hun'),
      Phrase(langCode: 'fr', value: 'Hongrie', id: 'hun'),
      Phrase(langCode: 'es', value: 'Hungría', id: 'hun'),
      Phrase(langCode: 'zh', value: '匈牙利', id: 'hun'),
    ],
  ),

  Flag(
    id: 'isl',
    iso2: 'IS',
    icon: '$_flagIconPath/flag_eu_n_iceland.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'ISK',
    phoneCode: '+354',
    capital: 'Reykjavik',
    langCodes: 'is,en,de,da,sv,no',
    areaSqKm: 103000,
    population: 352721,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Island', id: 'isl'),
      Phrase(langCode: 'ar', value: 'آيسلندا', id: 'isl'),
      Phrase(langCode: 'en', value: 'Iceland', id: 'isl'),
      Phrase(langCode: 'fr', value: 'Islande', id: 'isl'),
      Phrase(langCode: 'es', value: 'Islandia', id: 'isl'),
      Phrase(langCode: 'zh', value: '冰岛', id: 'isl'),
    ],
  ),

  Flag(
    id: 'ind',
    iso2: 'IN',
    icon: '$_flagIconPath/flag_as_s_india.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'INR',
    phoneCode: '+91',
    capital: 'New Delhi',
    langCodes: 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,ks,ne,sd,kok,doi,mni,sit,sa,fr,lus,inc',
    areaSqKm: 3287590,
    population: 1352617328,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Indien', id: 'ind'),
      Phrase(langCode: 'ar', value: 'الهند', id: 'ind'),
      Phrase(langCode: 'en', value: 'India', id: 'ind'),
      Phrase(langCode: 'fr', value: 'Inde', id: 'ind'),
      Phrase(langCode: 'es', value: 'India', id: 'ind'),
      Phrase(langCode: 'zh', value: '印度', id: 'ind'),
    ],
  ),

  Flag(
    id: 'idn',
    iso2: 'ID',
    icon: '$_flagIconPath/flag_as_se_indonesia.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'IDR',
    phoneCode: '+62',
    capital: 'Jakarta',
    langCodes: 'id,en,nl,jv',
    areaSqKm: 1919440,
    population: 267663435,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Indonesien', id: 'idn'),
      Phrase(langCode: 'ar', value: 'إندونيسيا', id: 'idn'),
      Phrase(langCode: 'en', value: 'Indonesia', id: 'idn'),
      Phrase(langCode: 'fr', value: 'Indonésie', id: 'idn'),
      Phrase(langCode: 'es', value: 'Indonesia', id: 'idn'),
      Phrase(langCode: 'zh', value: '印尼', id: 'idn'),
    ],
  ),

  Flag(
    id: 'irn',
    iso2: 'IR',
    icon: '$_flagIconPath/flag_as_s_iran.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'IRR',
    phoneCode: '+98',
    capital: 'Tehran',
    langCodes: 'fa-IR,ku',
    areaSqKm: 1648000,
    population: 81800269,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Iran', id: 'irn'),
      Phrase(langCode: 'ar', value: 'إيران', id: 'irn'),
      Phrase(langCode: 'en', value: 'Iran', id: 'irn'),
      Phrase(langCode: 'fr', value: 'Iran', id: 'irn'),
      Phrase(langCode: 'es', value: 'Irán', id: 'irn'),
      Phrase(langCode: 'zh', value: '伊朗', id: 'irn'),
    ],
  ),

  Flag(
    id: 'irq',
    iso2: 'IQ',
    icon: '$_flagIconPath/flag_as_w_iraq.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'IQD',
    phoneCode: '+964',
    capital: 'Baghdad',
    langCodes: 'ar-IQ,ku,hy',
    areaSqKm: 437072,
    population: 38433600,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Irak', id: 'irq'),
      Phrase(langCode: 'ar', value: 'العراق', id: 'irq'),
      Phrase(langCode: 'en', value: 'Iraq', id: 'irq'),
      Phrase(langCode: 'fr', value: 'Irak', id: 'irq'),
      Phrase(langCode: 'es', value: 'Irak', id: 'irq'),
      Phrase(langCode: 'zh', value: '伊拉克', id: 'irq'),
    ],
  ),

  Flag(
    id: 'irl',
    iso2: 'IE',
    icon: '$_flagIconPath/flag_eu_n_ireland.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+353',
    capital: 'Dublin',
    langCodes: 'en-IE,ga-IE',
    areaSqKm: 70280,
    population: 4867309,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Irland', id: 'irl'),
      Phrase(langCode: 'ar', value: 'أيرلندا', id: 'irl'),
      Phrase(langCode: 'en', value: 'Ireland', id: 'irl'),
      Phrase(langCode: 'fr', value: 'Irlande (pays)', id: 'irl'),
      Phrase(langCode: 'es', value: 'Irlanda', id: 'irl'),
      Phrase(langCode: 'zh', value: '爱尔兰', id: 'irl'),
    ],
  ),

  Flag(
    id: 'imn',
    iso2: 'IM',
    icon: '$_flagIconPath/flag_eu_n_isle_of_man.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'GBP',
    phoneCode: '+44-1624',
    capital: 'Douglas, Isle of Man',
    langCodes: 'en,gv',
    areaSqKm: 572,
    population: null,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Insel Man', id: 'imn'),
      Phrase(langCode: 'ar', value: 'جزيرة مان', id: 'imn'),
      Phrase(langCode: 'en', value: 'Isle Of Man', id: 'imn'),
      Phrase(langCode: 'fr', value: 'Île de Man', id: 'imn'),
      Phrase(langCode: 'es', value: 'Isla de Man', id: 'imn'),
      Phrase(langCode: 'zh', value: '马恩岛', id: 'imn'),
    ],
  ),

  Flag(
    id: 'isr',
    iso2: 'IL',
    icon: '$_flagIconPath/flag_as_w_israel.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'ILS',
    phoneCode: '+972',
    capital: 'Jerusalem',
    langCodes: 'he,ar-IL,en-IL,',
    areaSqKm: 20770,
    population: 8882800,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Israel', id: 'isr'),
      Phrase(langCode: 'ar', value: 'إسرائيل', id: 'isr'),
      Phrase(langCode: 'en', value: 'Israel', id: 'isr'),
      Phrase(langCode: 'fr', value: 'Israël', id: 'isr'),
      Phrase(langCode: 'es', value: 'Israel', id: 'isr'),
      Phrase(langCode: 'zh', value: '以色列', id: 'isr'),
    ],
  ),

  Flag(
    id: 'ita',
    iso2: 'IT',
    icon: '$_flagIconPath/flag_eu_s_italy.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+39',
    capital: 'Rome',
    langCodes: 'it-IT,de-IT,fr-IT,sc,ca,co,sl',
    areaSqKm: 301230,
    population: 60421760,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Italien', id: 'ita'),
      Phrase(langCode: 'ar', value: 'إيطاليا', id: 'ita'),
      Phrase(langCode: 'en', value: 'Italy', id: 'ita'),
      Phrase(langCode: 'fr', value: 'Italie', id: 'ita'),
      Phrase(langCode: 'es', value: 'Italia', id: 'ita'),
      Phrase(langCode: 'zh', value: '意大利', id: 'ita'),
    ],
  ),

  Flag(
    id: 'jam',
    iso2: 'JM',
    icon: '$_flagIconPath/flag_na_cr_jamaica.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'JMD',
    phoneCode: '+1',
    capital: 'Kingston',
    langCodes: 'en-JM',
    areaSqKm: 10991,
    population: 2934855,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Jamaika', id: 'jam'),
      Phrase(langCode: 'ar', value: 'جامايكا', id: 'jam'),
      Phrase(langCode: 'en', value: 'Jamaica', id: 'jam'),
      Phrase(langCode: 'fr', value: 'Jamaïque', id: 'jam'),
      Phrase(langCode: 'es', value: 'Jamaica', id: 'jam'),
      Phrase(langCode: 'zh', value: '牙买加', id: 'jam'),
    ],
  ),

  Flag(
    id: 'jpn',
    iso2: 'JP',
    icon: '$_flagIconPath/flag_as_e_japan.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'JPY',
    phoneCode: '+81',
    capital: 'Tokyo',
    langCodes: 'ja',
    areaSqKm: 377835,
    population: 126529100,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Japan', id: 'jpn'),
      Phrase(langCode: 'ar', value: 'اليابان', id: 'jpn'),
      Phrase(langCode: 'en', value: 'Japan', id: 'jpn'),
      Phrase(langCode: 'fr', value: 'Japon', id: 'jpn'),
      Phrase(langCode: 'es', value: 'Japón', id: 'jpn'),
      Phrase(langCode: 'zh', value: '日本', id: 'jpn'),
    ],
  ),

  Flag(
    id: 'jey',
    iso2: 'JE',
    icon: '$_flagIconPath/flag_eu_n_jersey.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'GBP',
    phoneCode: '+44-1534',
    capital: 'Saint Helier',
    langCodes: 'en,pt',
    areaSqKm: 116,
    population: null,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Jersey (Kanalinsel)', id: 'jey'),
      Phrase(langCode: 'ar', value: 'جيرزي', id: 'jey'),
      Phrase(langCode: 'en', value: 'Jersey', id: 'jey'),
      Phrase(langCode: 'fr', value: 'Jersey', id: 'jey'),
      Phrase(langCode: 'es', value: 'Jersey', id: 'jey'),
      Phrase(langCode: 'zh', value: '泽西', id: 'jey'),
    ],
  ),

  Flag(
    id: 'jor',
    iso2: 'JO',
    icon: '$_flagIconPath/flag_as_w_jordan.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'JOD',
    phoneCode: '+962',
    capital: 'Amman',
    langCodes: 'ar-JO,en',
    areaSqKm: 92300,
    population: 9956011,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Jordanien', id: 'jor'),
      Phrase(langCode: 'ar', value: 'الأردن', id: 'jor'),
      Phrase(langCode: 'en', value: 'Jordan', id: 'jor'),
      Phrase(langCode: 'fr', value: 'Jordanie', id: 'jor'),
      Phrase(langCode: 'es', value: 'Jordania', id: 'jor'),
      Phrase(langCode: 'zh', value: '约旦', id: 'jor'),
    ],
  ),

  Flag(
    id: 'kaz',
    iso2: 'KZ',
    icon: '$_flagIconPath/flag_as_c_kazakhstan.svg',
    region: 'Central Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KZT',
    phoneCode: '+7',
    capital: 'Astana',
    langCodes: 'kk,ru',
    areaSqKm: 2717300,
    population: 18272430,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kasachstan', id: 'kaz'),
      Phrase(langCode: 'ar', value: 'كازاخستان', id: 'kaz'),
      Phrase(langCode: 'en', value: 'Kazakhstan', id: 'kaz'),
      Phrase(langCode: 'fr', value: 'Kazakhstan', id: 'kaz'),
      Phrase(langCode: 'es', value: 'Kazajistán', id: 'kaz'),
      Phrase(langCode: 'zh', value: '哈萨克斯坦', id: 'kaz'),
    ],
  ),

  Flag(
    id: 'ken',
    iso2: 'KE',
    icon: '$_flagIconPath/flag_af_e_kenya.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'KES',
    phoneCode: '+254',
    capital: 'Nairobi',
    langCodes: 'en-KE,sw-KE',
    areaSqKm: 582650,
    population: 51393010,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kenia', id: 'ken'),
      Phrase(langCode: 'ar', value: 'كينيا', id: 'ken'),
      Phrase(langCode: 'en', value: 'Kenya', id: 'ken'),
      Phrase(langCode: 'fr', value: 'Kenya', id: 'ken'),
      Phrase(langCode: 'es', value: 'Kenia', id: 'ken'),
      Phrase(langCode: 'zh', value: '肯尼亚', id: 'ken'),
    ],
  ),

  Flag(
    id: 'kir',
    iso2: 'KI',
    icon: '$_flagIconPath/flag_oc_micro_kiribati.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'AUD',
    phoneCode: '+686',
    capital: 'Tarawa',
    langCodes: 'en-KI,gil',
    areaSqKm: 811,
    population: 115847,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kiribati', id: 'kir'),
      Phrase(langCode: 'ar', value: 'كيريباتي', id: 'kir'),
      Phrase(langCode: 'en', value: 'Kiribati', id: 'kir'),
      Phrase(langCode: 'fr', value: 'Kiribati', id: 'kir'),
      Phrase(langCode: 'es', value: 'Kiribati', id: 'kir'),
      Phrase(langCode: 'zh', value: '基里巴斯', id: 'kir'),
    ],
  ),

  Flag(
    id: 'prk',
    iso2: 'KP',
    icon: '$_flagIconPath/flag_as_e_north_korea.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KPW',
    phoneCode: '+850',
    capital: 'Pyongyang',
    langCodes: 'ko-KP',
    areaSqKm: 120540,
    population: 25549819,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Korea, Nord', id: 'prk'),
      Phrase(langCode: 'ar', value: 'كوريا الشمالية', id: 'prk'),
      Phrase(langCode: 'en', value: 'Korea, North', id: 'prk'),
      Phrase(langCode: 'fr', value: 'Corée du Nord', id: 'prk'),
      Phrase(langCode: 'es', value: 'Corea del Norte', id: 'prk'),
      Phrase(langCode: 'zh', value: '朝鲜', id: 'prk'),
    ],
  ),

  Flag(
    id: 'kor',
    iso2: 'KR',
    icon: '$_flagIconPath/flag_as_e_south_korea.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KRW',
    phoneCode: '+82',
    capital: 'Seoul',
    langCodes: 'ko-KR,en',
    areaSqKm: 98480,
    population: 51606633,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Korea, Süd', id: 'kor'),
      Phrase(langCode: 'ar', value: 'كوريا الجنوبية', id: 'kor'),
      Phrase(langCode: 'en', value: 'Korea, South', id: 'kor'),
      Phrase(langCode: 'fr', value: 'Corée du Sud', id: 'kor'),
      Phrase(langCode: 'es', value: 'Corea del Sur', id: 'kor'),
      Phrase(langCode: 'zh', value: '韩国', id: 'kor'),
    ],
  ),

  Flag(
    id: 'kwt',
    iso2: 'KW',
    icon: '$_flagIconPath/flag_as_w_kuwait.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KWD',
    phoneCode: '+965',
    capital: 'Kuwait City',
    langCodes: 'ar-KW,en',
    areaSqKm: 17820,
    population: 4137309,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kuwait', id: 'kwt'),
      Phrase(langCode: 'ar', value: 'الكويت', id: 'kwt'),
      Phrase(langCode: 'en', value: 'Kuwait', id: 'kwt'),
      Phrase(langCode: 'fr', value: 'Koweït', id: 'kwt'),
      Phrase(langCode: 'es', value: 'Kuwait', id: 'kwt'),
      Phrase(langCode: 'zh', value: '科威特', id: 'kwt'),
    ],
  ),

  Flag(
    id: 'kgz',
    iso2: 'KG',
    icon: '$_flagIconPath/flag_as_c_kyrgyzstan.svg',
    region: 'Central Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'KGS',
    phoneCode: '+996',
    capital: 'Bishkek',
    langCodes: 'ky,uz,ru',
    areaSqKm: 198500,
    population: 6322800,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Kirgisistan', id: 'kgz'),
      Phrase(langCode: 'ar', value: 'قيرغيزستان', id: 'kgz'),
      Phrase(langCode: 'en', value: 'Kyrgyzstan', id: 'kgz'),
      Phrase(langCode: 'fr', value: 'Kirghizistan', id: 'kgz'),
      Phrase(langCode: 'es', value: 'Kirguistán', id: 'kgz'),
      Phrase(langCode: 'zh', value: '吉尔吉斯斯坦', id: 'kgz'),
    ],
  ),

  Flag(
    id: 'lao',
    iso2: 'LA',
    icon: '$_flagIconPath/flag_as_se_laos.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'LAK',
    phoneCode: '+856',
    capital: 'Vientiane',
    langCodes: 'lo,fr,en',
    areaSqKm: 236800,
    population: 7061507,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Laos', id: 'lao'),
      Phrase(langCode: 'ar', value: 'لاوس', id: 'lao'),
      Phrase(langCode: 'en', value: 'Laos', id: 'lao'),
      Phrase(langCode: 'fr', value: 'Laos', id: 'lao'),
      Phrase(langCode: 'es', value: 'Laos', id: 'lao'),
      Phrase(langCode: 'zh', value: '老挝', id: 'lao'),
    ],
  ),

  Flag(
    id: 'lva',
    iso2: 'LV',
    icon: '$_flagIconPath/flag_eu_n_latvia.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+371',
    capital: 'Riga',
    langCodes: 'lv,ru,lt',
    areaSqKm: 64589,
    population: 1927174,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Lettland', id: 'lva'),
      Phrase(langCode: 'ar', value: 'لاتفيا', id: 'lva'),
      Phrase(langCode: 'en', value: 'Latvia', id: 'lva'),
      Phrase(langCode: 'fr', value: 'Lettonie', id: 'lva'),
      Phrase(langCode: 'es', value: 'Letonia', id: 'lva'),
      Phrase(langCode: 'zh', value: '拉脱维亚', id: 'lva'),
    ],
  ),

  Flag(
    id: 'lbn',
    iso2: 'LB',
    icon: '$_flagIconPath/flag_as_w_lebanon.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'LBP',
    phoneCode: '+961',
    capital: 'Beirut',
    langCodes: 'ar-LB,fr-LB,en,hy',
    areaSqKm: 10400,
    population: 6848925,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Libanon', id: 'lbn'),
      Phrase(langCode: 'ar', value: 'لبنان', id: 'lbn'),
      Phrase(langCode: 'en', value: 'Lebanon', id: 'lbn'),
      Phrase(langCode: 'fr', value: 'Liban', id: 'lbn'),
      Phrase(langCode: 'es', value: 'Líbano', id: 'lbn'),
      Phrase(langCode: 'zh', value: '黎巴嫩', id: 'lbn'),
    ],
  ),

  Flag(
    id: 'lso',
    iso2: 'LS',
    icon: '$_flagIconPath/flag_af_s_lesotho.svg',
    region: 'Southern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'LSL',
    phoneCode: '+266',
    capital: 'Maseru',
    langCodes: 'en-LS,st,zu,xh',
    areaSqKm: 30355,
    population: 2108132,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Lesotho', id: 'lso'),
      Phrase(langCode: 'ar', value: 'ليسوتو', id: 'lso'),
      Phrase(langCode: 'en', value: 'Lesotho', id: 'lso'),
      Phrase(langCode: 'fr', value: 'Lesotho', id: 'lso'),
      Phrase(langCode: 'es', value: 'Lesoto', id: 'lso'),
      Phrase(langCode: 'zh', value: '莱索托', id: 'lso'),
    ],
  ),

  Flag(
    id: 'lbr',
    iso2: 'LR',
    icon: '$_flagIconPath/flag_af_w_liberia.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'LRD',
    phoneCode: '+231',
    capital: 'Monrovia',
    langCodes: 'en-LR',
    areaSqKm: 111370,
    population: 4818977,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Liberia', id: 'lbr'),
      Phrase(langCode: 'ar', value: 'ليبيريا', id: 'lbr'),
      Phrase(langCode: 'en', value: 'Liberia', id: 'lbr'),
      Phrase(langCode: 'fr', value: 'Liberia', id: 'lbr'),
      Phrase(langCode: 'es', value: 'Liberia', id: 'lbr'),
      Phrase(langCode: 'zh', value: '利比里亚', id: 'lbr'),
    ],
  ),

  Flag(
    id: 'lby',
    iso2: 'LY',
    icon: '$_flagIconPath/flag_af_n_libya.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'LYD',
    phoneCode: '+218',
    capital: 'Tripolis',
    langCodes: 'ar-LY,it,en',
    areaSqKm: 1759540,
    population: 6678567,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Libyen', id: 'lby'),
      Phrase(langCode: 'ar', value: 'ليبيا', id: 'lby'),
      Phrase(langCode: 'en', value: 'Libya', id: 'lby'),
      Phrase(langCode: 'fr', value: 'Libye', id: 'lby'),
      Phrase(langCode: 'es', value: 'Libia', id: 'lby'),
      Phrase(langCode: 'zh', value: '利比亚', id: 'lby'),
    ],
  ),

  Flag(
    id: 'lie',
    iso2: 'LI',
    icon: '$_flagIconPath/flag_eu_w_liechtenstein.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'CHF',
    phoneCode: '+423',
    capital: 'Vaduz',
    langCodes: 'de-LI',
    areaSqKm: 160,
    population: 37910,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Liechtenstein', id: 'lie'),
      Phrase(langCode: 'ar', value: 'ليختنشتاين', id: 'lie'),
      Phrase(langCode: 'en', value: 'Liechtenstein', id: 'lie'),
      Phrase(langCode: 'fr', value: 'Liechtenstein', id: 'lie'),
      Phrase(langCode: 'es', value: 'Liechtenstein', id: 'lie'),
      Phrase(langCode: 'zh', value: '列支敦士登', id: 'lie'),
    ],
  ),

  Flag(
    id: 'ltu',
    iso2: 'LT',
    icon: '$_flagIconPath/flag_eu_n_lithuania.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+370',
    capital: 'Vilnius',
    langCodes: 'lt,ru,pl',
    areaSqKm: 65200,
    population: 2801543,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Litauen', id: 'ltu'),
      Phrase(langCode: 'ar', value: 'ليتوانيا', id: 'ltu'),
      Phrase(langCode: 'en', value: 'Lithuania', id: 'ltu'),
      Phrase(langCode: 'fr', value: 'Lituanie', id: 'ltu'),
      Phrase(langCode: 'es', value: 'Lituania', id: 'ltu'),
      Phrase(langCode: 'zh', value: '立陶宛', id: 'ltu'),
    ],
  ),

  Flag(
    id: 'lux',
    iso2: 'LU',
    icon: '$_flagIconPath/flag_eu_w_luxembourg.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+352',
    capital: 'Luxembourg',
    langCodes: 'lb,de-LU,fr-LU',
    areaSqKm: 2586,
    population: 607950,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Luxemburg', id: 'lux'),
      Phrase(langCode: 'ar', value: 'لوكسمبورغ', id: 'lux'),
      Phrase(langCode: 'en', value: 'Luxembourg', id: 'lux'),
      Phrase(langCode: 'fr', value: 'Luxembourg (pays)', id: 'lux'),
      Phrase(langCode: 'es', value: 'Luxemburgo', id: 'lux'),
      Phrase(langCode: 'zh', value: '卢森堡', id: 'lux'),
    ],
  ),

  Flag(
    id: 'mac',
    iso2: 'MO',
    icon: '$_flagIconPath/flag_as_e_macao.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'MOP',
    phoneCode: '+853',
    capital: 'Macao',
    langCodes: 'zh,zh-MO,pt',
    areaSqKm: 254,
    population: 631636,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Macau', id: 'mac'),
      Phrase(langCode: 'ar', value: 'ماكاو', id: 'mac'),
      Phrase(langCode: 'en', value: 'Macau', id: 'mac'),
      Phrase(langCode: 'fr', value: 'Macao', id: 'mac'),
      Phrase(langCode: 'es', value: 'Macao', id: 'mac'),
      Phrase(langCode: 'zh', value: '澳门', id: 'mac'),
    ],
  ),

  Flag(
    id: 'mdg',
    iso2: 'MG',
    icon: '$_flagIconPath/flag_af_e_madagascar.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MGA',
    phoneCode: '+261',
    capital: 'Antananarivo',
    langCodes: 'fr-MG,mg',
    areaSqKm: 587040,
    population: 26262368,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Madagaskar', id: 'mdg'),
      Phrase(langCode: 'ar', value: 'مدغشقر', id: 'mdg'),
      Phrase(langCode: 'en', value: 'Madagascar', id: 'mdg'),
      Phrase(langCode: 'fr', value: 'Madagascar', id: 'mdg'),
      Phrase(langCode: 'es', value: 'Madagascar', id: 'mdg'),
      Phrase(langCode: 'zh', value: '马达加斯加', id: 'mdg'),
    ],
  ),

  Flag(
    id: 'mwi',
    iso2: 'MW',
    icon: '$_flagIconPath/flag_af_e_malawi.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MWK',
    phoneCode: '+265',
    capital: 'Lilongwe',
    langCodes: 'ny,yao,tum,swk',
    areaSqKm: 118480,
    population: 18143315,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Malawi', id: 'mwi'),
      Phrase(langCode: 'ar', value: 'مالاوي', id: 'mwi'),
      Phrase(langCode: 'en', value: 'Malawi', id: 'mwi'),
      Phrase(langCode: 'fr', value: 'Malawi', id: 'mwi'),
      Phrase(langCode: 'es', value: 'Malaui', id: 'mwi'),
      Phrase(langCode: 'zh', value: '马拉维', id: 'mwi'),
    ],
  ),

  Flag(
    id: 'mys',
    iso2: 'MY',
    icon: '$_flagIconPath/flag_as_se_malaysia.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'MYR',
    phoneCode: '+60',
    capital: 'Kuala Lumpur',
    langCodes: 'ms-MY,en,zh,ta,te,ml,pa,th',
    areaSqKm: 329750,
    population: 31528585,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Malaysia', id: 'mys'),
      Phrase(langCode: 'ar', value: 'ماليزيا', id: 'mys'),
      Phrase(langCode: 'en', value: 'Malaysia', id: 'mys'),
      Phrase(langCode: 'fr', value: 'Malaisie', id: 'mys'),
      Phrase(langCode: 'es', value: 'Malasia', id: 'mys'),
      Phrase(langCode: 'zh', value: '马来西亚', id: 'mys'),
    ],
  ),

  Flag(
    id: 'mdv',
    iso2: 'MV',
    icon: '$_flagIconPath/flag_as_s_maldives.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'MVR',
    phoneCode: '+960',
    capital: 'Male',
    langCodes: 'dv,en',
    areaSqKm: 300,
    population: 515696,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Malediven', id: 'mdv'),
      Phrase(langCode: 'ar', value: 'جزر المالديف', id: 'mdv'),
      Phrase(langCode: 'en', value: 'Maldives', id: 'mdv'),
      Phrase(langCode: 'fr', value: 'Maldives', id: 'mdv'),
      Phrase(langCode: 'es', value: 'Maldivas', id: 'mdv'),
      Phrase(langCode: 'zh', value: '马尔代夫', id: 'mdv'),
    ],
  ),

  Flag(
    id: 'mli',
    iso2: 'ML',
    icon: '$_flagIconPath/flag_af_w_mali.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+223',
    capital: 'Bamako',
    langCodes: 'fr-ML,bm',
    areaSqKm: 1240000,
    population: 19077690,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mali', id: 'mli'),
      Phrase(langCode: 'ar', value: 'مالي', id: 'mli'),
      Phrase(langCode: 'en', value: 'Mali', id: 'mli'),
      Phrase(langCode: 'fr', value: 'Mali', id: 'mli'),
      Phrase(langCode: 'es', value: 'Malí', id: 'mli'),
      Phrase(langCode: 'zh', value: '马里', id: 'mli'),
    ],
  ),

  Flag(
    id: 'mlt',
    iso2: 'MT',
    icon: '$_flagIconPath/flag_eu_s_malta.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+356',
    capital: 'Valletta',
    langCodes: 'mt,en-MT',
    areaSqKm: 316,
    population: 484630,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Malta', id: 'mlt'),
      Phrase(langCode: 'ar', value: 'مالطا', id: 'mlt'),
      Phrase(langCode: 'en', value: 'Malta', id: 'mlt'),
      Phrase(langCode: 'fr', value: 'Malte', id: 'mlt'),
      Phrase(langCode: 'es', value: 'Malta', id: 'mlt'),
      Phrase(langCode: 'zh', value: '马耳他', id: 'mlt'),
    ],
  ),

  Flag(
    id: 'mhl',
    iso2: 'MH',
    icon: '$_flagIconPath/flag_oc_micro_marshall_island.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+692',
    capital: 'Majuro',
    langCodes: 'mh,en-MH',
    areaSqKm: 181,
    population: 58413,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Marshallinseln', id: 'mhl'),
      Phrase(langCode: 'ar', value: 'جزر مارشال', id: 'mhl'),
      Phrase(langCode: 'en', value: 'Marshall Islands', id: 'mhl'),
      Phrase(langCode: 'fr', value: 'Îles Marshall (pays)', id: 'mhl'),
      Phrase(langCode: 'es', value: 'Islas Marshall', id: 'mhl'),
      Phrase(langCode: 'zh', value: '马绍尔群岛', id: 'mhl'),
    ],
  ),

  Flag(
    id: 'mrt',
    iso2: 'MR',
    icon: '$_flagIconPath/flag_af_w_mauritania.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MRU',
    phoneCode: '+222',
    capital: 'Nouakchott',
    langCodes: 'ar-MR,fuc,snk,fr,mey,wo',
    areaSqKm: 1030700,
    population: 4403319,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mauretanien', id: 'mrt'),
      Phrase(langCode: 'ar', value: 'موريتانيا', id: 'mrt'),
      Phrase(langCode: 'en', value: 'Mauritania', id: 'mrt'),
      Phrase(langCode: 'fr', value: 'Mauritanie', id: 'mrt'),
      Phrase(langCode: 'es', value: 'Mauritania', id: 'mrt'),
      Phrase(langCode: 'zh', value: '毛里塔尼亚', id: 'mrt'),
    ],
  ),

  Flag(
    id: 'mus',
    iso2: 'MU',
    icon: '$_flagIconPath/flag_af_e_mauritius.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MUR',
    phoneCode: '+230',
    capital: 'Port Louis',
    langCodes: 'en-MU,bho,fr',
    areaSqKm: 2040,
    population: 1265303,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mauritius', id: 'mus'),
      Phrase(langCode: 'ar', value: 'موريشيوس', id: 'mus'),
      Phrase(langCode: 'en', value: 'Mauritius', id: 'mus'),
      Phrase(langCode: 'fr', value: 'Maurice (pays)', id: 'mus'),
      Phrase(langCode: 'es', value: 'Mauricio', id: 'mus'),
      Phrase(langCode: 'zh', value: '毛里求斯', id: 'mus'),
    ],
  ),

  Flag(
    id: 'myt',
    iso2: 'YT',
    icon: '$_flagIconPath/flag_af_e_mayotte.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+262',
    capital: 'Mamoudzou',
    langCodes: 'fr-YT',
    areaSqKm: 374,
    population: 270372,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mayotte', id: 'myt'),
      Phrase(langCode: 'ar', value: 'مايوت', id: 'myt'),
      Phrase(langCode: 'en', value: 'Mayotte', id: 'myt'),
      Phrase(langCode: 'fr', value: 'Mayotte', id: 'myt'),
      Phrase(langCode: 'es', value: 'Mayotte', id: 'myt'),
      Phrase(langCode: 'zh', value: '马约特', id: 'myt'),
    ],
  ),

  Flag(
    id: 'mex',
    iso2: 'MX',
    icon: '$_flagIconPath/flag_na_c_mexico.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'MXN',
    phoneCode: '+52',
    capital: 'Mexico City',
    langCodes: 'es-MX',
    areaSqKm: 1972550,
    population: 126190788,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mexiko', id: 'mex'),
      Phrase(langCode: 'ar', value: 'المكسيك', id: 'mex'),
      Phrase(langCode: 'en', value: 'Mexico', id: 'mex'),
      Phrase(langCode: 'fr', value: 'Mexique', id: 'mex'),
      Phrase(langCode: 'es', value: 'México', id: 'mex'),
      Phrase(langCode: 'zh', value: '墨西哥', id: 'mex'),
    ],
  ),

  Flag(
    id: 'fsm',
    iso2: 'FM',
    icon: '$_flagIconPath/flag_oc_micro_micronesia.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+691',
    capital: 'Palikir',
    langCodes: 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg',
    areaSqKm: 702,
    population: 112640,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mikronesien', id: 'fsm'),
      Phrase(langCode: 'ar', value: 'ولايات ميكرونيسيا المتحدة', id: 'fsm'),
      Phrase(langCode: 'en', value: 'Micronesia, Federated States Of', id: 'fsm'),
      Phrase(langCode: 'fr', value: 'États fédérés de Micronésie (pays)', id: 'fsm'),
      Phrase(langCode: 'es', value: 'Micronesia', id: 'fsm'),
      Phrase(langCode: 'zh', value: '密克罗尼西亚联邦', id: 'fsm'),
    ],
  ),

  Flag(
    id: 'mda',
    iso2: 'MD',
    icon: '$_flagIconPath/flag_eu_e_moldova.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'MDL',
    phoneCode: '+373',
    capital: 'Chisinau',
    langCodes: 'ro,ru,gag,tr',
    areaSqKm: 33843,
    population: 2706049,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Moldau', id: 'mda'),
      Phrase(langCode: 'ar', value: 'مولدوفا', id: 'mda'),
      Phrase(langCode: 'en', value: 'Moldova', id: 'mda'),
      Phrase(langCode: 'fr', value: 'Moldavie', id: 'mda'),
      Phrase(langCode: 'es', value: 'Moldavia', id: 'mda'),
      Phrase(langCode: 'zh', value: '摩尔多瓦', id: 'mda'),
    ],
  ),

  Flag(
    id: 'mco',
    iso2: 'MC',
    icon: '$_flagIconPath/flag_eu_w_monaco.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+377',
    capital: 'Monaco',
    langCodes: 'fr-MC,en,it',
    areaSqKm: 2,
    population: 38682,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Monaco', id: 'mco'),
      Phrase(langCode: 'ar', value: 'موناكو', id: 'mco'),
      Phrase(langCode: 'en', value: 'Monaco', id: 'mco'),
      Phrase(langCode: 'fr', value: 'Monaco', id: 'mco'),
      Phrase(langCode: 'es', value: 'Mónaco', id: 'mco'),
      Phrase(langCode: 'zh', value: '摩纳哥', id: 'mco'),
    ],
  ),

  Flag(
    id: 'mng',
    iso2: 'MN',
    icon: '$_flagIconPath/flag_as_e_mongolia.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'MNT',
    phoneCode: '+976',
    capital: 'Ulan Bator',
    langCodes: 'mn,ru',
    areaSqKm: 1565000,
    population: 3170208,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mongolei', id: 'mng'),
      Phrase(langCode: 'ar', value: 'منغوليا', id: 'mng'),
      Phrase(langCode: 'en', value: 'Mongolia', id: 'mng'),
      Phrase(langCode: 'fr', value: 'Mongolie', id: 'mng'),
      Phrase(langCode: 'es', value: 'Mongolia', id: 'mng'),
      Phrase(langCode: 'zh', value: '蒙古国', id: 'mng'),
    ],
  ),

  Flag(
    id: 'mne',
    iso2: 'ME',
    icon: '$_flagIconPath/flag_eu_s_montenegro.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+382',
    capital: 'Podgorica',
    langCodes: 'sr,hu,bs,sq,hr,rom',
    areaSqKm: 14026,
    population: 631219,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Montenegro', id: 'mne'),
      Phrase(langCode: 'ar', value: 'الجبل الأسود', id: 'mne'),
      Phrase(langCode: 'en', value: 'Montenegro', id: 'mne'),
      Phrase(langCode: 'fr', value: 'Monténégro', id: 'mne'),
      Phrase(langCode: 'es', value: 'Montenegro', id: 'mne'),
      Phrase(langCode: 'zh', value: '黑山', id: 'mne'),
    ],
  ),

  Flag(
    id: 'mar',
    iso2: 'MA',
    icon: '$_flagIconPath/flag_af_n_morocco.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MAD',
    phoneCode: '+212',
    capital: 'Rabat',
    langCodes: 'ar-MA,fr',
    areaSqKm: 446550,
    population: 36029138,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Marokko', id: 'mar'),
      Phrase(langCode: 'ar', value: 'المغرب', id: 'mar'),
      Phrase(langCode: 'en', value: 'Morocco', id: 'mar'),
      Phrase(langCode: 'fr', value: 'Maroc', id: 'mar'),
      Phrase(langCode: 'es', value: 'Marruecos', id: 'mar'),
      Phrase(langCode: 'zh', value: '摩洛哥', id: 'mar'),
    ],
  ),

  Flag(
    id: 'moz',
    iso2: 'MZ',
    icon: '$_flagIconPath/flag_af_e_mozambique.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'MZN',
    phoneCode: '+258',
    capital: 'Maputo',
    langCodes: 'pt-MZ,vmw',
    areaSqKm: 801590,
    population: 29495962,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Mosambik', id: 'moz'),
      Phrase(langCode: 'ar', value: 'موزمبيق', id: 'moz'),
      Phrase(langCode: 'en', value: 'Mozambique', id: 'moz'),
      Phrase(langCode: 'fr', value: 'Mozambique', id: 'moz'),
      Phrase(langCode: 'es', value: 'Mozambique', id: 'moz'),
      Phrase(langCode: 'zh', value: '莫桑比克', id: 'moz'),
    ],
  ),

  Flag(
    id: 'mmr',
    iso2: 'MM',
    icon: '$_flagIconPath/flag_as_se_myanmar.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'MMK',
    phoneCode: '+95',
    capital: 'Nay Pyi Taw',
    langCodes: 'my',
    areaSqKm: 678500,
    population: 53708395,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Myanmar', id: 'mmr'),
      Phrase(langCode: 'ar', value: 'ميانمار', id: 'mmr'),
      Phrase(langCode: 'en', value: 'Burma', id: 'mmr'),
      Phrase(langCode: 'fr', value: 'Birmanie', id: 'mmr'),
      Phrase(langCode: 'es', value: 'Birmania', id: 'mmr'),
      Phrase(langCode: 'zh', value: '缅甸', id: 'mmr'),
    ],
  ),

  Flag(
    id: 'nam',
    iso2: 'NA',
    icon: '$_flagIconPath/flag_af_s_namibia.svg',
    region: 'Southern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'NAD',
    phoneCode: '+264',
    capital: 'Windhoek',
    langCodes: 'en-NA,af,de,hz,naq',
    areaSqKm: 825418,
    population: 2448255,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Namibia', id: 'nam'),
      Phrase(langCode: 'ar', value: 'ناميبيا', id: 'nam'),
      Phrase(langCode: 'en', value: 'Namibia', id: 'nam'),
      Phrase(langCode: 'fr', value: 'Namibie', id: 'nam'),
      Phrase(langCode: 'es', value: 'Namibia', id: 'nam'),
      Phrase(langCode: 'zh', value: '纳米比亚', id: 'nam'),
    ],
  ),

  Flag(
    id: 'npl',
    iso2: 'NP',
    icon: '$_flagIconPath/flag_as_s_nepal.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'NPR',
    phoneCode: '+977',
    capital: 'Kathmandu',
    langCodes: 'ne,en',
    areaSqKm: 140800,
    population: 28087871,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Nepal', id: 'npl'),
      Phrase(langCode: 'ar', value: 'نيبال', id: 'npl'),
      Phrase(langCode: 'en', value: 'Nepal', id: 'npl'),
      Phrase(langCode: 'fr', value: 'Népal', id: 'npl'),
      Phrase(langCode: 'es', value: 'Nepal', id: 'npl'),
      Phrase(langCode: 'zh', value: '尼泊尔', id: 'npl'),
    ],
  ),

  Flag(
    id: 'nld',
    iso2: 'NL',
    icon: '$_flagIconPath/flag_eu_w_netherlands.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+31',
    capital: 'Amsterdam',
    langCodes: 'nl-NL,fy-NL',
    areaSqKm: 41526,
    population: 17231624,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Niederlande', id: 'nld'),
      Phrase(langCode: 'ar', value: 'هولندا', id: 'nld'),
      Phrase(langCode: 'en', value: 'Netherlands', id: 'nld'),
      Phrase(langCode: 'fr', value: 'Pays-Bas', id: 'nld'),
      Phrase(langCode: 'es', value: 'Países Bajos', id: 'nld'),
      Phrase(langCode: 'zh', value: '荷兰', id: 'nld'),
    ],
  ),

  Flag(
    id: 'ncl',
    iso2: 'NC',
    icon: '$_flagIconPath/flag_eu_w_france.svg',
    region: 'Melanesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'XPF',
    phoneCode: '+687',
    capital: 'Noumea',
    langCodes: 'fr-NC',
    areaSqKm: 19060,
    population: 284060,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Neukaledonien', id: 'ncl'),
      Phrase(langCode: 'ar', value: 'كاليدونيا الجديدة', id: 'ncl'),
      Phrase(langCode: 'en', value: 'New Caledonia', id: 'ncl'),
      Phrase(langCode: 'fr', value: 'Nouvelle-Calédonie', id: 'ncl'),
      Phrase(langCode: 'es', value: 'Nueva Caledonia', id: 'ncl'),
      Phrase(langCode: 'zh', value: '新喀里多尼亚', id: 'ncl'),
    ],
  ),

  Flag(
    id: 'nzl',
    iso2: 'NZ',
    icon: '$_flagIconPath/flag_az_new_zealand.svg',
    region: 'Australia and New Zealand',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'NZD',
    phoneCode: '+64',
    capital: 'Wellington',
    langCodes: 'en-NZ,mi',
    areaSqKm: 268680,
    population: 4841000,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Neuseeland', id: 'nzl'),
      Phrase(langCode: 'ar', value: 'نيوزيلندا', id: 'nzl'),
      Phrase(langCode: 'en', value: 'New Zealand', id: 'nzl'),
      Phrase(langCode: 'fr', value: 'Nouvelle-Zélande', id: 'nzl'),
      Phrase(langCode: 'es', value: 'Nueva Zelanda', id: 'nzl'),
      Phrase(langCode: 'zh', value: '新西兰', id: 'nzl'),
    ],
  ),

  Flag(
    id: 'nic',
    iso2: 'NI',
    icon: '$_flagIconPath/flag_na_c_nicaragua.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'NIO',
    phoneCode: '+505',
    capital: 'Managua',
    langCodes: 'es-NI,en',
    areaSqKm: 129494,
    population: 6465513,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Nicaragua', id: 'nic'),
      Phrase(langCode: 'ar', value: 'نيكاراغوا', id: 'nic'),
      Phrase(langCode: 'en', value: 'Nicaragua', id: 'nic'),
      Phrase(langCode: 'fr', value: 'Nicaragua', id: 'nic'),
      Phrase(langCode: 'es', value: 'Nicaragua', id: 'nic'),
      Phrase(langCode: 'zh', value: '尼加拉瓜', id: 'nic'),
    ],
  ),

  Flag(
    id: 'ner',
    iso2: 'NE',
    icon: '$_flagIconPath/flag_af_w_niger.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+227',
    capital: 'Niamey',
    langCodes: 'fr-NE,ha,kr,dje',
    areaSqKm: 1267000,
    population: 22442948,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Niger', id: 'ner'),
      Phrase(langCode: 'ar', value: 'النيجر', id: 'ner'),
      Phrase(langCode: 'en', value: 'Niger', id: 'ner'),
      Phrase(langCode: 'fr', value: 'Niger', id: 'ner'),
      Phrase(langCode: 'es', value: 'Níger', id: 'ner'),
      Phrase(langCode: 'zh', value: '尼日尔', id: 'ner'),
    ],
  ),

  Flag(
    id: 'nga',
    iso2: 'NG',
    icon: '$_flagIconPath/flag_af_w_nigeria.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'NGN',
    phoneCode: '+234',
    capital: 'Abuja',
    langCodes: 'en-NG,ha,yo,ig,ff',
    areaSqKm: 923768,
    population: 195874740,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Nigeria', id: 'nga'),
      Phrase(langCode: 'ar', value: 'نيجيريا', id: 'nga'),
      Phrase(langCode: 'en', value: 'Nigeria', id: 'nga'),
      Phrase(langCode: 'fr', value: 'Nigeria', id: 'nga'),
      Phrase(langCode: 'es', value: 'Nigeria', id: 'nga'),
      Phrase(langCode: 'zh', value: '尼日利亚', id: 'nga'),
    ],
  ),

  Flag(
    id: 'mkd',
    iso2: 'MK',
    icon: '$_flagIconPath/flag_eu_s_macedonia.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'MKD',
    phoneCode: '+389',
    capital: 'Skopje',
    langCodes: 'mk,sq,tr,rmm,sr',
    areaSqKm: 25333,
    population: 2084367,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Nordmazedonien', id: 'mkd'),
      Phrase(langCode: 'ar', value: 'مقدونيا', id: 'mkd'),
      Phrase(langCode: 'en', value: 'Macedonia', id: 'mkd'),
      Phrase(langCode: 'fr', value: 'Macédoine du Nord', id: 'mkd'),
      Phrase(langCode: 'es', value: 'Macedonia del Norte', id: 'mkd'),
      Phrase(langCode: 'zh', value: '北马其顿', id: 'mkd'),
    ],
  ),

  Flag(
    id: 'mnp',
    iso2: 'MP',
    icon: '$_flagIconPath/flag_oc_micro_northern_marianas_islands.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'Saipan',
    langCodes: 'fil,tl,zh,ch-MP,en-MP',
    areaSqKm: 477,
    population: 56882,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Nördliche Marianen', id: 'mnp'),
      Phrase(langCode: 'ar', value: 'جزر ماريانا الشمالية', id: 'mnp'),
      Phrase(langCode: 'en', value: 'Northern Mariana Islands', id: 'mnp'),
      Phrase(langCode: 'fr', value: 'Îles Mariannes du Nord', id: 'mnp'),
      Phrase(langCode: 'es', value: 'Islas Marianas del Norte', id: 'mnp'),
      Phrase(langCode: 'zh', value: '北马里亚纳群岛', id: 'mnp'),
    ],
  ),

  Flag(
    id: 'nor',
    iso2: 'NO',
    icon: '$_flagIconPath/flag_eu_n_norway.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'NOK',
    phoneCode: '+47',
    capital: 'Oslo',
    langCodes: 'no,nb,nn,se,fi',
    areaSqKm: 324220,
    population: 5311916,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Norwegen', id: 'nor'),
      Phrase(langCode: 'ar', value: 'النرويج', id: 'nor'),
      Phrase(langCode: 'en', value: 'Norway', id: 'nor'),
      Phrase(langCode: 'fr', value: 'Norvège', id: 'nor'),
      Phrase(langCode: 'es', value: 'Noruega', id: 'nor'),
      Phrase(langCode: 'zh', value: '挪威', id: 'nor'),
    ],
  ),

  Flag(
    id: 'omn',
    iso2: 'OM',
    icon: '$_flagIconPath/flag_as_w_oman.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'OMR',
    phoneCode: '+968',
    capital: 'Muscat',
    langCodes: 'ar-OM,en,bal,ur',
    areaSqKm: 212460,
    population: 4829483,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Oman', id: 'omn'),
      Phrase(langCode: 'ar', value: 'عمان', id: 'omn'),
      Phrase(langCode: 'en', value: 'Oman', id: 'omn'),
      Phrase(langCode: 'fr', value: 'Oman', id: 'omn'),
      Phrase(langCode: 'es', value: 'Omán', id: 'omn'),
      Phrase(langCode: 'zh', value: '阿曼', id: 'omn'),
    ],
  ),

  Flag(
    id: 'pak',
    iso2: 'PK',
    icon: '$_flagIconPath/flag_as_s_pakistan.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'PKR',
    phoneCode: '+92',
    capital: 'Islamabad',
    langCodes: 'ur-PK,en-PK,pa,sd,ps,brh',
    areaSqKm: 803940,
    population: 212215030,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Pakistan', id: 'pak'),
      Phrase(langCode: 'ar', value: 'باكستان', id: 'pak'),
      Phrase(langCode: 'en', value: 'Pakistan', id: 'pak'),
      Phrase(langCode: 'fr', value: 'Pakistan', id: 'pak'),
      Phrase(langCode: 'es', value: 'Pakistán', id: 'pak'),
      Phrase(langCode: 'zh', value: '巴基斯坦', id: 'pak'),
    ],
  ),

  Flag(
    id: 'plw',
    iso2: 'PW',
    icon: '$_flagIconPath/flag_oc_micro_palau.svg',
    region: 'Micronesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+680',
    capital: 'Melekeok',
    langCodes: 'pau,sov,en-PW,tox,ja,fil,zh',
    areaSqKm: 458,
    population: 17907,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Palau', id: 'plw'),
      Phrase(langCode: 'ar', value: 'بالاو', id: 'plw'),
      Phrase(langCode: 'en', value: 'Palau', id: 'plw'),
      Phrase(langCode: 'fr', value: 'Palaos', id: 'plw'),
      Phrase(langCode: 'es', value: 'Palaos', id: 'plw'),
      Phrase(langCode: 'zh', value: '帕劳', id: 'plw'),
    ],
  ),

  Flag(
    id: 'pse',
    iso2: 'PS',
    icon: '$_flagIconPath/flag_as_w_palestine.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+970',
    capital: 'East Jerusalem',
    langCodes: 'ar-PS',
    areaSqKm: 5970,
    population: 4569087,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Palästina', id: 'pse'),
      Phrase(langCode: 'ar', value: 'فلسطين', id: 'pse'),
      Phrase(langCode: 'en', value: 'Palestine', id: 'pse'),
      Phrase(langCode: 'fr', value: 'Palestine', id: 'pse'),
      Phrase(langCode: 'es', value: 'Palestina', id: 'pse'),
      Phrase(langCode: 'zh', value: '巴勒斯坦', id: 'pse'),
    ],
  ),

  Flag(
    id: 'pan',
    iso2: 'PA',
    icon: '$_flagIconPath/flag_na_c_panama.svg',
    region: 'Central America',
    continent: 'South America',
    language: 'en',
    currencyID: 'PAB',
    phoneCode: '+507',
    capital: 'Panama City',
    langCodes: 'es-PA,en',
    areaSqKm: 78200,
    population: 4176873,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Panama', id: 'pan'),
      Phrase(langCode: 'ar', value: 'بنما', id: 'pan'),
      Phrase(langCode: 'en', value: 'Panama', id: 'pan'),
      Phrase(langCode: 'fr', value: 'Panama', id: 'pan'),
      Phrase(langCode: 'es', value: 'Panamá', id: 'pan'),
      Phrase(langCode: 'zh', value: '巴拿马', id: 'pan'),
    ],
  ),

  Flag(
    id: 'png',
    iso2: 'PG',
    icon: '$_flagIconPath/flag_oc_melan_papua_new_guinea.svg',
    region: 'Melanesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'PGK',
    phoneCode: '+675',
    capital: 'Port Moresby',
    langCodes: 'en-PG,ho,meu,tpi',
    areaSqKm: 462840,
    population: 8606316,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Papua-Neuguinea', id: 'png'),
      Phrase(langCode: 'ar', value: 'بابوا غينيا الجديدة', id: 'png'),
      Phrase(langCode: 'en', value: 'Papua New Guinea', id: 'png'),
      Phrase(langCode: 'fr', value: 'Papouasie-Nouvelle-Guinée', id: 'png'),
      Phrase(langCode: 'es', value: 'Papúa Nueva Guinea', id: 'png'),
      Phrase(langCode: 'zh', value: '巴布亚新几内亚', id: 'png'),
    ],
  ),

  Flag(
    id: 'pry',
    iso2: 'PY',
    icon: '$_flagIconPath/flag_sa_paraguay.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'PYG',
    phoneCode: '+595',
    capital: 'Asuncion',
    langCodes: 'es-PY,gn',
    areaSqKm: 406750,
    population: 6956071,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Paraguay', id: 'pry'),
      Phrase(langCode: 'ar', value: 'باراغواي', id: 'pry'),
      Phrase(langCode: 'en', value: 'Paraguay', id: 'pry'),
      Phrase(langCode: 'fr', value: 'Paraguay', id: 'pry'),
      Phrase(langCode: 'es', value: 'Paraguay', id: 'pry'),
      Phrase(langCode: 'zh', value: '巴拉圭', id: 'pry'),
    ],
  ),

  Flag(
    id: 'per',
    iso2: 'PE',
    icon: '$_flagIconPath/flag_sa_peru.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'PEN',
    phoneCode: '+51',
    capital: 'Lima',
    langCodes: 'es-PE,qu,ay',
    areaSqKm: 1285220,
    population: 31989256,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Peru', id: 'per'),
      Phrase(langCode: 'ar', value: 'بيرو', id: 'per'),
      Phrase(langCode: 'en', value: 'Peru', id: 'per'),
      Phrase(langCode: 'fr', value: 'Pérou', id: 'per'),
      Phrase(langCode: 'es', value: 'Perú', id: 'per'),
      Phrase(langCode: 'zh', value: '秘鲁', id: 'per'),
    ],
  ),

  Flag(
    id: 'phl',
    iso2: 'PH',
    icon: '$_flagIconPath/flag_as_se_philippines.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'PHP',
    phoneCode: '+63',
    capital: 'Manila',
    langCodes: 'tl,en-PH,fil',
    areaSqKm: 300000,
    population: 106651922,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Philippinen', id: 'phl'),
      Phrase(langCode: 'ar', value: 'الفلبين', id: 'phl'),
      Phrase(langCode: 'en', value: 'Philippines', id: 'phl'),
      Phrase(langCode: 'fr', value: 'Philippines', id: 'phl'),
      Phrase(langCode: 'es', value: 'Filipinas', id: 'phl'),
      Phrase(langCode: 'zh', value: '菲律宾', id: 'phl'),
    ],
  ),

  Flag(
    id: 'pol',
    iso2: 'PL',
    icon: '$_flagIconPath/flag_eu_e_poland.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'PLN',
    phoneCode: '+48',
    capital: 'Warsaw',
    langCodes: 'pl',
    areaSqKm: 312685,
    population: 37974750,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Polen', id: 'pol'),
      Phrase(langCode: 'ar', value: 'بولندا', id: 'pol'),
      Phrase(langCode: 'en', value: 'Poland', id: 'pol'),
      Phrase(langCode: 'fr', value: 'Pologne', id: 'pol'),
      Phrase(langCode: 'es', value: 'Polonia', id: 'pol'),
      Phrase(langCode: 'zh', value: '波兰', id: 'pol'),
    ],
  ),

  Flag(
    id: 'prt',
    iso2: 'PT',
    icon: '$_flagIconPath/flag_eu_s_portugal.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+351',
    capital: 'Lisbon',
    langCodes: 'pt-PT,mwl',
    areaSqKm: 92391,
    population: 10283822,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Portugal', id: 'prt'),
      Phrase(langCode: 'ar', value: 'البرتغال', id: 'prt'),
      Phrase(langCode: 'en', value: 'Portugal', id: 'prt'),
      Phrase(langCode: 'fr', value: 'Portugal', id: 'prt'),
      Phrase(langCode: 'es', value: 'Portugal', id: 'prt'),
      Phrase(langCode: 'zh', value: '葡萄牙', id: 'prt'),
    ],
  ),

  Flag(
    id: 'pri',
    iso2: 'PR',
    icon: '$_flagIconPath/flag_na_cr_puerto_rico.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'San Juan',
    langCodes: 'en-PR,es-PR',
    areaSqKm: 9104,
    population: 3195153,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Puerto Rico', id: 'pri'),
      Phrase(langCode: 'ar', value: 'بورتوريكو', id: 'pri'),
      Phrase(langCode: 'en', value: 'Puerto Rico', id: 'pri'),
      Phrase(langCode: 'fr', value: 'Porto Rico', id: 'pri'),
      Phrase(langCode: 'es', value: 'Puerto Rico', id: 'pri'),
      Phrase(langCode: 'zh', value: '波多黎各', id: 'pri'),
    ],
  ),

  Flag(
    id: 'qat',
    iso2: 'QA',
    icon: '$_flagIconPath/flag_as_w_qatar.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'QAR',
    phoneCode: '+974',
    capital: 'Doha',
    langCodes: 'ar-QA,es',
    areaSqKm: 11437,
    population: 2781677,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Katar', id: 'qat'),
      Phrase(langCode: 'ar', value: 'قطر', id: 'qat'),
      Phrase(langCode: 'en', value: 'Qatar', id: 'qat'),
      Phrase(langCode: 'fr', value: 'Qatar', id: 'qat'),
      Phrase(langCode: 'es', value: 'Catar', id: 'qat'),
      Phrase(langCode: 'zh', value: '卡塔尔', id: 'qat'),
    ],
  ),

  Flag(
    id: 'reu',
    iso2: 'RE',
    icon: '$_flagIconPath/flag_af_e_reunion.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+262',
    capital: 'Saint-Denis',
    langCodes: 'fr-RE',
    areaSqKm: 2517,
    population: 859959,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Réunion', id: 'reu'),
      Phrase(langCode: 'ar', value: 'لا ريونيون', id: 'reu'),
      Phrase(langCode: 'en', value: 'Reunion', id: 'reu'),
      Phrase(langCode: 'fr', value: 'La Réunion', id: 'reu'),
      Phrase(langCode: 'es', value: 'Reunión', id: 'reu'),
      Phrase(langCode: 'zh', value: '留尼汪', id: 'reu'),
    ],
  ),

  Flag(
    id: 'rou',
    iso2: 'RO',
    icon: '$_flagIconPath/flag_eu_e_romania.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'RON',
    phoneCode: '+40',
    capital: 'Bucharest',
    langCodes: 'ro,hu,rom',
    areaSqKm: 237500,
    population: 19466145,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Rumänien', id: 'rou'),
      Phrase(langCode: 'ar', value: 'رومانيا', id: 'rou'),
      Phrase(langCode: 'en', value: 'Romania', id: 'rou'),
      Phrase(langCode: 'fr', value: 'Roumanie', id: 'rou'),
      Phrase(langCode: 'es', value: 'Rumania', id: 'rou'),
      Phrase(langCode: 'zh', value: '罗马尼亚', id: 'rou'),
    ],
  ),

  Flag(
    id: 'rus',
    iso2: 'RU',
    icon: '$_flagIconPath/flag_eu_e_russia.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'RUB',
    phoneCode: '+7',
    capital: 'Moscow',
    langCodes: 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv,mdf,chm,ba,inh,tut,kbd,krc,ava,sah,nog',
    areaSqKm: 17100000,
    population: 144478050,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Russland', id: 'rus'),
      Phrase(langCode: 'ar', value: 'روسيا', id: 'rus'),
      Phrase(langCode: 'en', value: 'Russia', id: 'rus'),
      Phrase(langCode: 'fr', value: 'Russie', id: 'rus'),
      Phrase(langCode: 'es', value: 'Rusia', id: 'rus'),
      Phrase(langCode: 'zh', value: '俄罗斯', id: 'rus'),
    ],
  ),

  Flag(
    id: 'rwa',
    iso2: 'RW',
    icon: '$_flagIconPath/flag_af_e_rwanda.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'RWF',
    phoneCode: '+250',
    capital: 'Kigali',
    langCodes: 'rw,en-RW,fr-RW,sw',
    areaSqKm: 26338,
    population: 12301939,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ruanda', id: 'rwa'),
      Phrase(langCode: 'ar', value: 'رواندا', id: 'rwa'),
      Phrase(langCode: 'en', value: 'Rwanda', id: 'rwa'),
      Phrase(langCode: 'fr', value: 'Rwanda', id: 'rwa'),
      Phrase(langCode: 'es', value: 'Ruanda', id: 'rwa'),
      Phrase(langCode: 'zh', value: '卢旺达', id: 'rwa'),
    ],
  ),

  Flag(
    id: 'shn',
    iso2: 'SH',
    icon: '$_flagIconPath/flag_af_w_saint_helena.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SHP',
    phoneCode: '+290',
    capital: 'Jamestown',
    langCodes: 'en-SH',
    areaSqKm: 410,
    population: 6600,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'St. Helena, Ascension und Tristan da Cunha', id: 'shn'),
      Phrase(langCode: 'ar', value: 'سانت هيلانة وأسينشين وتريستان دا كونا', id: 'shn'),
      Phrase(langCode: 'en', value: 'Saint Helena, Ascension, And Tristan Da Cunha', id: 'shn'),
      Phrase(langCode: 'fr', value: 'Sainte-Hélène, Ascension et Tristan da Cunha', id: 'shn'),
      Phrase(langCode: 'es', value: 'Santa Elena, Ascensión y Tristán de Acuña', id: 'shn'),
      Phrase(langCode: 'zh', value: '圣赫勒拿、阿森松和特里斯坦-达库尼亚', id: 'shn'),
    ],
  ),

  Flag(
    id: 'kna',
    iso2: 'KN',
    icon: '$_flagIconPath/flag_na_cr_saint_kitts_and_nevis.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: 'Basseterre',
    langCodes: 'en-KN',
    areaSqKm: 261,
    population: 52441,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'St. Kitts und Nevis', id: 'kna'),
      Phrase(langCode: 'ar', value: 'سانت كيتس ونيفيس', id: 'kna'),
      Phrase(langCode: 'en', value: 'Saint Kitts And Nevis', id: 'kna'),
      Phrase(langCode: 'fr', value: 'Saint-Christophe-et-Niévès', id: 'kna'),
      Phrase(langCode: 'es', value: 'San Cristóbal y Nieves', id: 'kna'),
      Phrase(langCode: 'zh', value: '圣基茨和尼维斯', id: 'kna'),
    ],
  ),

  Flag(
    id: 'lca',
    iso2: 'LC',
    icon: '$_flagIconPath/flag_na_cr_saint_lucia.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: 'Castries',
    langCodes: 'en-LC',
    areaSqKm: 616,
    population: 181889,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'St. Lucia', id: 'lca'),
      Phrase(langCode: 'ar', value: 'سانت لوسيا', id: 'lca'),
      Phrase(langCode: 'en', value: 'Saint Lucia', id: 'lca'),
      Phrase(langCode: 'fr', value: 'Sainte-Lucie', id: 'lca'),
      Phrase(langCode: 'es', value: 'Santa Lucía', id: 'lca'),
      Phrase(langCode: 'zh', value: '圣卢西亚', id: 'lca'),
    ],
  ),

  Flag(
    id: 'vct',
    iso2: 'VC',
    icon: '$_flagIconPath/flag_na_cr_saint_vincent_and_the_grenadines.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'XCD',
    phoneCode: '+1',
    capital: 'Kingstown',
    langCodes: 'en-VC,fr',
    areaSqKm: 389,
    population: 110210,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'St. Vincent und die Grenadinen', id: 'vct'),
      Phrase(langCode: 'ar', value: 'سانت فينسنت والغرينادين', id: 'vct'),
      Phrase(langCode: 'en', value: 'Saint Vincent And The Grenadines', id: 'vct'),
      Phrase(langCode: 'fr', value: 'Saint-Vincent-et-les-Grenadines', id: 'vct'),
      Phrase(langCode: 'es', value: 'San Vicente y las Granadinas', id: 'vct'),
      Phrase(langCode: 'zh', value: '圣文森特和格林纳丁斯', id: 'vct'),
    ],
  ),

  Flag(
    id: 'wsm',
    iso2: 'WS',
    icon: '$_flagIconPath/flag_oc_poly_samoa.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'WST',
    phoneCode: '+685',
    capital: 'Apia',
    langCodes: 'sm,en-WS',
    areaSqKm: 2944,
    population: 196130,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Samoa', id: 'wsm'),
      Phrase(langCode: 'ar', value: 'ساموا', id: 'wsm'),
      Phrase(langCode: 'en', value: 'Samoa', id: 'wsm'),
      Phrase(langCode: 'fr', value: 'Samoa', id: 'wsm'),
      Phrase(langCode: 'es', value: 'Samoa', id: 'wsm'),
      Phrase(langCode: 'zh', value: '萨摩亚', id: 'wsm'),
    ],
  ),

  Flag(
    id: 'smr',
    iso2: 'SM',
    icon: '$_flagIconPath/flag_eu_s_san_marino.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+378',
    capital: 'San Marino',
    langCodes: 'it-SM',
    areaSqKm: 61,
    population: 33785,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'San Marino', id: 'smr'),
      Phrase(langCode: 'ar', value: 'سان مارينو', id: 'smr'),
      Phrase(langCode: 'en', value: 'San Marino', id: 'smr'),
      Phrase(langCode: 'fr', value: 'Saint-Marin', id: 'smr'),
      Phrase(langCode: 'es', value: 'San Marino', id: 'smr'),
      Phrase(langCode: 'zh', value: '圣马力诺', id: 'smr'),
    ],
  ),

  Flag(
    id: 'stp',
    iso2: 'ST',
    icon: '$_flagIconPath/flag_af_m_sao_tome_and_principe.svg',
    region: 'Middle Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'STN',
    phoneCode: '+239',
    capital: 'Sao Tome',
    langCodes: 'pt-ST',
    areaSqKm: 1001,
    population: 211028,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'São Tomé und Príncipe', id: 'stp'),
      Phrase(langCode: 'ar', value: 'ساو تومي وبرينسيب', id: 'stp'),
      Phrase(langCode: 'en', value: 'Sao Tome And Principe', id: 'stp'),
      Phrase(langCode: 'fr', value: 'Sao Tomé-et-Principe', id: 'stp'),
      Phrase(langCode: 'es', value: 'Santo Tomé y Príncipe', id: 'stp'),
      Phrase(langCode: 'zh', value: '圣多美和普林西比', id: 'stp'),
    ],
  ),

  Flag(
    id: 'sau',
    iso2: 'SA',
    icon: '$_flagIconPath/flag_as_w_saudi_arabia.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'SAR',
    phoneCode: '+966',
    capital: 'Riyadh',
    langCodes: 'ar-SA',
    areaSqKm: 1960582,
    population: 33699947,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Saudi-Arabien', id: 'sau'),
      Phrase(langCode: 'ar', value: 'السعودية', id: 'sau'),
      Phrase(langCode: 'en', value: 'Saudi Arabia', id: 'sau'),
      Phrase(langCode: 'fr', value: 'Arabie saoudite', id: 'sau'),
      Phrase(langCode: 'es', value: 'Arabia Saudita', id: 'sau'),
      Phrase(langCode: 'zh', value: '沙特阿拉伯', id: 'sau'),
    ],
  ),

  Flag(
    id: 'sen',
    iso2: 'SN',
    icon: '$_flagIconPath/flag_af_w_senegal.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+221',
    capital: 'Dakar',
    langCodes: 'fr-SN,wo,fuc,mnk',
    areaSqKm: 196190,
    population: 15854360,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Senegal', id: 'sen'),
      Phrase(langCode: 'ar', value: 'السنغال', id: 'sen'),
      Phrase(langCode: 'en', value: 'Senegal', id: 'sen'),
      Phrase(langCode: 'fr', value: 'Sénégal', id: 'sen'),
      Phrase(langCode: 'es', value: 'Senegal', id: 'sen'),
      Phrase(langCode: 'zh', value: '塞内加尔', id: 'sen'),
    ],
  ),

  Flag(
    id: 'srb',
    iso2: 'RS',
    icon: '$_flagIconPath/flag_eu_s_serbia.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'RSD',
    phoneCode: '+381',
    capital: 'Belgrade',
    langCodes: 'sr,hu,bs,rom',
    areaSqKm: 88361,
    population: 6963764,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Serbien', id: 'srb'),
      Phrase(langCode: 'ar', value: 'صربيا', id: 'srb'),
      Phrase(langCode: 'en', value: 'Serbia', id: 'srb'),
      Phrase(langCode: 'fr', value: 'Serbie', id: 'srb'),
      Phrase(langCode: 'es', value: 'Serbia', id: 'srb'),
      Phrase(langCode: 'zh', value: '塞尔维亚', id: 'srb'),
    ],
  ),

  Flag(
    id: 'syc',
    iso2: 'SC',
    icon: '$_flagIconPath/flag_af_e_seychelles.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SCR',
    phoneCode: '+248',
    capital: 'Victoria',
    langCodes: 'en-SC,fr-SC',
    areaSqKm: 455,
    population: 96762,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Seychellen', id: 'syc'),
      Phrase(langCode: 'ar', value: 'سيشل', id: 'syc'),
      Phrase(langCode: 'en', value: 'Seychelles', id: 'syc'),
      Phrase(langCode: 'fr', value: 'Seychelles', id: 'syc'),
      Phrase(langCode: 'es', value: 'Seychelles', id: 'syc'),
      Phrase(langCode: 'zh', value: '塞舌尔', id: 'syc'),
    ],
  ),

  Flag(
    id: 'sle',
    iso2: 'SL',
    icon: '$_flagIconPath/flag_af_w_sierra_leone.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SLL',
    phoneCode: '+232',
    capital: 'Freetown',
    langCodes: 'en-SL,men,tem',
    areaSqKm: 71740,
    population: 7650154,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Sierra Leone', id: 'sle'),
      Phrase(langCode: 'ar', value: 'سيراليون', id: 'sle'),
      Phrase(langCode: 'en', value: 'Sierra Leone', id: 'sle'),
      Phrase(langCode: 'fr', value: 'Sierra Leone', id: 'sle'),
      Phrase(langCode: 'es', value: 'Sierra Leona', id: 'sle'),
      Phrase(langCode: 'zh', value: '塞拉利昂', id: 'sle'),
    ],
  ),

  Flag(
    id: 'sgp',
    iso2: 'SG',
    icon: '$_flagIconPath/flag_as_se_singapore.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'SGD',
    phoneCode: '+65',
    capital: 'Singapore',
    langCodes: 'cmn,en-SG,ms-SG,ta-SG,zh-SG',
    areaSqKm: 693,
    population: 5638676,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Singapur', id: 'sgp'),
      Phrase(langCode: 'ar', value: 'سنغافورة', id: 'sgp'),
      Phrase(langCode: 'en', value: 'Singapore', id: 'sgp'),
      Phrase(langCode: 'fr', value: 'Singapour', id: 'sgp'),
      Phrase(langCode: 'es', value: 'Singapur', id: 'sgp'),
      Phrase(langCode: 'zh', value: '新加坡', id: 'sgp'),
    ],
  ),

  Flag(
    id: 'svk',
    iso2: 'SK',
    icon: '$_flagIconPath/flag_eu_e_slovakia.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+421',
    capital: 'Bratislava',
    langCodes: 'sk,hu',
    areaSqKm: 48845,
    population: 5446771,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Slowakei', id: 'svk'),
      Phrase(langCode: 'ar', value: 'سلوفاكيا', id: 'svk'),
      Phrase(langCode: 'en', value: 'Slovakia', id: 'svk'),
      Phrase(langCode: 'fr', value: 'Slovaquie', id: 'svk'),
      Phrase(langCode: 'es', value: 'Eslovaquia', id: 'svk'),
      Phrase(langCode: 'zh', value: '斯洛伐克', id: 'svk'),
    ],
  ),

  Flag(
    id: 'svn',
    iso2: 'SI',
    icon: '$_flagIconPath/flag_eu_s_slovenia.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+386',
    capital: 'Ljubljana',
    langCodes: 'sl,sh',
    areaSqKm: 20273,
    population: 2073894,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Slowenien', id: 'svn'),
      Phrase(langCode: 'ar', value: 'سلوفينيا', id: 'svn'),
      Phrase(langCode: 'en', value: 'Slovenia', id: 'svn'),
      Phrase(langCode: 'fr', value: 'Slovénie', id: 'svn'),
      Phrase(langCode: 'es', value: 'Eslovenia', id: 'svn'),
      Phrase(langCode: 'zh', value: '斯洛文尼亚', id: 'svn'),
    ],
  ),

  Flag(
    id: 'slb',
    iso2: 'SB',
    icon: '$_flagIconPath/flag_oc_melan_solomon_islands.svg',
    region: 'Melanesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'SBD',
    phoneCode: '+677',
    capital: 'Honiara',
    langCodes: 'en-SB,tpi',
    areaSqKm: 28450,
    population: 652858,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Salomonen', id: 'slb'),
      Phrase(langCode: 'ar', value: 'جزر سليمان', id: 'slb'),
      Phrase(langCode: 'en', value: 'Solomon Islands', id: 'slb'),
      Phrase(langCode: 'fr', value: 'Salomon', id: 'slb'),
      Phrase(langCode: 'es', value: 'Islas Salomón', id: 'slb'),
      Phrase(langCode: 'zh', value: '所罗门群岛', id: 'slb'),
    ],
  ),

  Flag(
    id: 'som',
    iso2: 'SO',
    icon: '$_flagIconPath/flag_af_e_somalia.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SOS',
    phoneCode: '+252',
    capital: 'Mogadishu',
    langCodes: 'so-SO,ar-SO,it,en-SO',
    areaSqKm: 637657,
    population: 15008154,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Somalia', id: 'som'),
      Phrase(langCode: 'ar', value: 'الصومال', id: 'som'),
      Phrase(langCode: 'en', value: 'Somalia', id: 'som'),
      Phrase(langCode: 'fr', value: 'Somalie', id: 'som'),
      Phrase(langCode: 'es', value: 'Somalia', id: 'som'),
      Phrase(langCode: 'zh', value: '索马里', id: 'som'),
    ],
  ),

  Flag(
    id: 'zaf',
    iso2: 'ZA',
    icon: '$_flagIconPath/flag_af_s_south_africa.svg',
    region: 'Southern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'ZAR',
    phoneCode: '+27',
    capital: 'Pretoria',
    langCodes: 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr',
    areaSqKm: 1219912,
    population: 57779622,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Südafrika', id: 'zaf'),
      Phrase(langCode: 'ar', value: 'جنوب أفريقيا', id: 'zaf'),
      Phrase(langCode: 'en', value: 'South Africa', id: 'zaf'),
      Phrase(langCode: 'fr', value: 'Afrique du Sud', id: 'zaf'),
      Phrase(langCode: 'es', value: 'Sudáfrica', id: 'zaf'),
      Phrase(langCode: 'zh', value: '南非', id: 'zaf'),
    ],
  ),

  Flag(
    id: 'ssd',
    iso2: 'SS',
    icon: '$_flagIconPath/flag_af_e_south_sudan.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SSP',
    phoneCode: '+211',
    capital: 'Juba',
    langCodes: 'en',
    areaSqKm: 644329,
    population: 10975920,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Südsudan', id: 'ssd'),
      Phrase(langCode: 'ar', value: 'جنوب السودان', id: 'ssd'),
      Phrase(langCode: 'en', value: 'South Sudan', id: 'ssd'),
      Phrase(langCode: 'fr', value: 'Soudan du Sud', id: 'ssd'),
      Phrase(langCode: 'es', value: 'Sudán del Sur', id: 'ssd'),
      Phrase(langCode: 'zh', value: '南苏丹', id: 'ssd'),
    ],
  ),

  Flag(
    id: 'esp',
    iso2: 'ES',
    icon: '$_flagIconPath/flag_eu_s_spain.svg',
    region: 'Southern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'EUR',
    phoneCode: '+34',
    capital: 'Madrid',
    langCodes: 'es-ES,ca,gl,eu,oc',
    areaSqKm: 504782,
    population: 46796540,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Spanien', id: 'esp'),
      Phrase(langCode: 'ar', value: 'إسبانيا', id: 'esp'),
      Phrase(langCode: 'en', value: 'Spain', id: 'esp'),
      Phrase(langCode: 'fr', value: 'Espagne', id: 'esp'),
      Phrase(langCode: 'es', value: 'España', id: 'esp'),
      Phrase(langCode: 'zh', value: '西班牙', id: 'esp'),
    ],
  ),

  Flag(
    id: 'lka',
    iso2: 'LK',
    icon: '$_flagIconPath/flag_as_s_sri_lanka.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'LKR',
    phoneCode: '+94',
    capital: 'Colombo',
    langCodes: 'si,ta,en',
    areaSqKm: 65610,
    population: 21670000,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Sri Lanka', id: 'lka'),
      Phrase(langCode: 'ar', value: 'سريلانكا', id: 'lka'),
      Phrase(langCode: 'en', value: 'Sri Lanka', id: 'lka'),
      Phrase(langCode: 'fr', value: 'Sri Lanka', id: 'lka'),
      Phrase(langCode: 'es', value: 'Sri Lanka', id: 'lka'),
      Phrase(langCode: 'zh', value: '斯里兰卡', id: 'lka'),
    ],
  ),

  Flag(
    id: 'sdn',
    iso2: 'SD',
    icon: '$_flagIconPath/flag_af_e_sudan.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'SDG',
    phoneCode: '+249',
    capital: 'Khartoum',
    langCodes: 'ar-SD,en,fia',
    areaSqKm: 1861484,
    population: 41801533,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Sudan', id: 'sdn'),
      Phrase(langCode: 'ar', value: 'السودان', id: 'sdn'),
      Phrase(langCode: 'en', value: 'Sudan', id: 'sdn'),
      Phrase(langCode: 'fr', value: 'Soudan', id: 'sdn'),
      Phrase(langCode: 'es', value: 'Sudán', id: 'sdn'),
      Phrase(langCode: 'zh', value: '苏丹', id: 'sdn'),
    ],
  ),

  Flag(
    id: 'sur',
    iso2: 'SR',
    icon: '$_flagIconPath/flag_sa_suriname.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'SRD',
    phoneCode: '+597',
    capital: 'Paramaribo',
    langCodes: 'nl-SR,en,srn,hns,jv',
    areaSqKm: 163270,
    population: 575991,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Suriname', id: 'sur'),
      Phrase(langCode: 'ar', value: 'سورينام', id: 'sur'),
      Phrase(langCode: 'en', value: 'Suriname', id: 'sur'),
      Phrase(langCode: 'fr', value: 'Suriname', id: 'sur'),
      Phrase(langCode: 'es', value: 'Surinam', id: 'sur'),
      Phrase(langCode: 'zh', value: '苏里南', id: 'sur'),
    ],
  ),

  Flag(
    id: 'swe',
    iso2: 'SE',
    icon: '$_flagIconPath/flag_eu_n_sweden.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'SEK',
    phoneCode: '+46',
    capital: 'Stockholm',
    langCodes: 'sv-SE,se,sma,fi-SE',
    areaSqKm: 449964,
    population: 10175214,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Schweden', id: 'swe'),
      Phrase(langCode: 'ar', value: 'السويد', id: 'swe'),
      Phrase(langCode: 'en', value: 'Sweden', id: 'swe'),
      Phrase(langCode: 'fr', value: 'Suède', id: 'swe'),
      Phrase(langCode: 'es', value: 'Suecia', id: 'swe'),
      Phrase(langCode: 'zh', value: '瑞典', id: 'swe'),
    ],
  ),

  Flag(
    id: 'che',
    iso2: 'CH',
    icon: '$_flagIconPath/flag_eu_w_switzerland.svg',
    region: 'Western Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'CHF',
    phoneCode: '+41',
    capital: 'Berne',
    langCodes: 'de-CH,fr-CH,it-CH,rm',
    areaSqKm: 41290,
    population: 8513227,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Schweiz', id: 'che'),
      Phrase(langCode: 'ar', value: 'سويسرا', id: 'che'),
      Phrase(langCode: 'en', value: 'Switzerland', id: 'che'),
      Phrase(langCode: 'fr', value: 'Suisse', id: 'che'),
      Phrase(langCode: 'es', value: 'Suiza', id: 'che'),
      Phrase(langCode: 'zh', value: '瑞士', id: 'che'),
    ],
  ),

  Flag(
    id: 'syr',
    iso2: 'SY',
    icon: '$_flagIconPath/flag_as_w_syria.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'SYP',
    phoneCode: '+963',
    capital: 'Damascus',
    langCodes: 'ar-SY,ku,hy,arc,fr,en',
    areaSqKm: 185180,
    population: 16906283,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Syrien', id: 'syr'),
      Phrase(langCode: 'ar', value: 'سوريا', id: 'syr'),
      Phrase(langCode: 'en', value: 'Syria', id: 'syr'),
      Phrase(langCode: 'fr', value: 'Syrie', id: 'syr'),
      Phrase(langCode: 'es', value: 'Siria', id: 'syr'),
      Phrase(langCode: 'zh', value: '叙利亚', id: 'syr'),
    ],
  ),

  Flag(
    id: 'twn',
    iso2: 'TW',
    icon: '$_flagIconPath/flag_as_e_taiwan.svg',
    region: 'Eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'TWD',
    phoneCode: '+886',
    capital: 'Taipei',
    langCodes: 'zh-TW,zh,nan,hak',
    areaSqKm: 35980,
    population: null,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Republik China', id: 'twn'),
      Phrase(langCode: 'ar', value: 'تايوان', id: 'twn'),
      Phrase(langCode: 'en', value: 'Taiwan', id: 'twn'),
      Phrase(langCode: 'fr', value: 'Taïwan / (République de Chine (Taïwan))', id: 'twn'),
      Phrase(langCode: 'es', value: 'Taiwán (República de China)', id: 'twn'),
      Phrase(langCode: 'zh', value: '中国台湾省', id: 'twn'),
    ],
  ),

  Flag(
    id: 'tjk',
    iso2: 'TJ',
    icon: '$_flagIconPath/flag_as_c_tajikistan.svg',
    region: 'Central Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'TJS',
    phoneCode: '+992',
    capital: 'Dushanbe',
    langCodes: 'tg,ru',
    areaSqKm: 143100,
    population: 9100837,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tadschikistan', id: 'tjk'),
      Phrase(langCode: 'ar', value: 'طاجيكستان', id: 'tjk'),
      Phrase(langCode: 'en', value: 'Tajikistan', id: 'tjk'),
      Phrase(langCode: 'fr', value: 'Tadjikistan', id: 'tjk'),
      Phrase(langCode: 'es', value: 'Tayikistán', id: 'tjk'),
      Phrase(langCode: 'zh', value: '塔吉克斯坦', id: 'tjk'),
    ],
  ),

  Flag(
    id: 'tza',
    iso2: 'TZ',
    icon: '$_flagIconPath/flag_af_e_tanzania.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'TZS',
    phoneCode: '+255',
    capital: 'Dodoma',
    langCodes: 'sw-TZ,en,ar',
    areaSqKm: 945087,
    population: 56318348,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tansania', id: 'tza'),
      Phrase(langCode: 'ar', value: 'تنزانيا', id: 'tza'),
      Phrase(langCode: 'en', value: 'Tanzania', id: 'tza'),
      Phrase(langCode: 'fr', value: 'Tanzanie', id: 'tza'),
      Phrase(langCode: 'es', value: 'Tanzania', id: 'tza'),
      Phrase(langCode: 'zh', value: '坦桑尼亚', id: 'tza'),
    ],
  ),

  Flag(
    id: 'tha',
    iso2: 'TH',
    icon: '$_flagIconPath/flag_as_se_thailand.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'THB',
    phoneCode: '+66',
    capital: 'Bangkok',
    langCodes: 'th,en',
    areaSqKm: 514000,
    population: 69428524,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Thailand', id: 'tha'),
      Phrase(langCode: 'ar', value: 'تايلاند', id: 'tha'),
      Phrase(langCode: 'en', value: 'Thailand', id: 'tha'),
      Phrase(langCode: 'fr', value: 'Thaïlande', id: 'tha'),
      Phrase(langCode: 'es', value: 'Tailandia', id: 'tha'),
      Phrase(langCode: 'zh', value: '泰国', id: 'tha'),
    ],
  ),

  Flag(
    id: 'tls',
    iso2: 'TL',
    icon: '$_flagIconPath/flag_as_se_timor_leste.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+670',
    capital: 'Dili',
    langCodes: 'tet,pt-TL,id,en',
    areaSqKm: 15007,
    population: null,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Osttimor', id: 'tls'),
      Phrase(langCode: 'ar', value: 'تيمور الشرقية', id: 'tls'),
      Phrase(langCode: 'en', value: 'Timor-Leste', id: 'tls'),
      Phrase(langCode: 'fr', value: 'Timor oriental', id: 'tls'),
      Phrase(langCode: 'es', value: 'Timor Oriental', id: 'tls'),
      Phrase(langCode: 'zh', value: '东帝汶', id: 'tls'),
    ],
  ),

  Flag(
    id: 'tgo',
    iso2: 'TG',
    icon: '$_flagIconPath/flag_af_w_togo.svg',
    region: 'Western Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'XOF',
    phoneCode: '+228',
    capital: 'Lome',
    langCodes: 'fr-TG,ee,hna,kbp,dag,ha',
    areaSqKm: 56785,
    population: 7889094,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Togo', id: 'tgo'),
      Phrase(langCode: 'ar', value: 'توغو', id: 'tgo'),
      Phrase(langCode: 'en', value: 'Togo', id: 'tgo'),
      Phrase(langCode: 'fr', value: 'Togo', id: 'tgo'),
      Phrase(langCode: 'es', value: 'Togo', id: 'tgo'),
      Phrase(langCode: 'zh', value: '多哥', id: 'tgo'),
    ],
  ),

  Flag(
    id: 'ton',
    iso2: 'TO',
    icon: '$_flagIconPath/flag_oc_poly_tonga.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'TOP',
    phoneCode: '+676',
    capital: "Nuku'alofa",
    langCodes: 'to,en-TO',
    areaSqKm: 748,
    population: 103197,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tonga', id: 'ton'),
      Phrase(langCode: 'ar', value: 'تونغا', id: 'ton'),
      Phrase(langCode: 'en', value: 'Tonga', id: 'ton'),
      Phrase(langCode: 'fr', value: 'Tonga', id: 'ton'),
      Phrase(langCode: 'es', value: 'Tonga', id: 'ton'),
      Phrase(langCode: 'zh', value: '汤加', id: 'ton'),
    ],
  ),

  Flag(
    id: 'tto',
    iso2: 'TT',
    icon: '$_flagIconPath/flag_na_cr_trinidad_and_tobago.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'TTD',
    phoneCode: '+1',
    capital: 'Port of Spain',
    langCodes: 'en-TT,hns,fr,es,zh',
    areaSqKm: 5128,
    population: 1389858,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Trinidad und Tobago', id: 'tto'),
      Phrase(langCode: 'ar', value: 'ترينيداد وتوباغو', id: 'tto'),
      Phrase(langCode: 'en', value: 'Trinidad And Tobago', id: 'tto'),
      Phrase(langCode: 'fr', value: 'Trinité-et-Tobago', id: 'tto'),
      Phrase(langCode: 'es', value: 'Trinidad y Tobago', id: 'tto'),
      Phrase(langCode: 'zh', value: '特立尼达和多巴哥', id: 'tto'),
    ],
  ),

  Flag(
    id: 'tun',
    iso2: 'TN',
    icon: '$_flagIconPath/flag_af_n_tunisia.svg',
    region: 'Northern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'TND',
    phoneCode: '+216',
    capital: 'Tunis',
    langCodes: 'ar-TN,fr',
    areaSqKm: 163610,
    population: 11565204,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tunesien', id: 'tun'),
      Phrase(langCode: 'ar', value: 'تونس', id: 'tun'),
      Phrase(langCode: 'en', value: 'Tunisia', id: 'tun'),
      Phrase(langCode: 'fr', value: 'Tunisie', id: 'tun'),
      Phrase(langCode: 'es', value: 'Túnez', id: 'tun'),
      Phrase(langCode: 'zh', value: '突尼斯', id: 'tun'),
    ],
  ),

  Flag(
    id: 'tur',
    iso2: 'TR',
    icon: '$_flagIconPath/flag_as_w_turkey.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'TRY',
    phoneCode: '+90',
    capital: 'Ankara',
    langCodes: 'tr-TR,ku,diq,az,av',
    areaSqKm: 780580,
    population: 82319724,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Türkei', id: 'tur'),
      Phrase(langCode: 'ar', value: 'تركيا', id: 'tur'),
      Phrase(langCode: 'en', value: 'Turkey', id: 'tur'),
      Phrase(langCode: 'fr', value: 'Turquie', id: 'tur'),
      Phrase(langCode: 'es', value: 'Turquía', id: 'tur'),
      Phrase(langCode: 'zh', value: '土耳其', id: 'tur'),
    ],
  ),

  Flag(
    id: 'tkm',
    iso2: 'TM',
    icon: '$_flagIconPath/flag_as_c_turkmenistan.svg',
    region: 'Central Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'TMT',
    phoneCode: '+993',
    capital: 'Ashgabat',
    langCodes: 'tk,ru,uz',
    areaSqKm: 488100,
    population: 5850908,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Turkmenistan', id: 'tkm'),
      Phrase(langCode: 'ar', value: 'تركمانستان', id: 'tkm'),
      Phrase(langCode: 'en', value: 'Turkmenistan', id: 'tkm'),
      Phrase(langCode: 'fr', value: 'Turkménistan', id: 'tkm'),
      Phrase(langCode: 'es', value: 'Turkmenistán', id: 'tkm'),
      Phrase(langCode: 'zh', value: '土库曼斯坦', id: 'tkm'),
    ],
  ),

  Flag(
    id: 'tca',
    iso2: 'TC',
    icon: '$_flagIconPath/flag_na_cr_turks_and_caicos.svg',
    region: 'Caribbean',
    continent: 'South America',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'Cockburn Town',
    langCodes: 'en-TC',
    areaSqKm: 430,
    population: 37665,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Turks- und Caicosinseln', id: 'tca'),
      Phrase(langCode: 'ar', value: 'جزر توركس وكايكوس', id: 'tca'),
      Phrase(langCode: 'en', value: 'Turks And Caicos Islands', id: 'tca'),
      Phrase(langCode: 'fr', value: 'Îles Turques-et-Caïques', id: 'tca'),
      Phrase(langCode: 'es', value: 'Islas Turcas y Caicos', id: 'tca'),
      Phrase(langCode: 'zh', value: '特克斯和凯科斯群岛', id: 'tca'),
    ],
  ),

  Flag(
    id: 'tuv',
    iso2: 'TV',
    icon: '$_flagIconPath/flag_oc_poly_tuvalu.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'AUD',
    phoneCode: '+688',
    capital: 'Funafuti',
    langCodes: 'tvl,en,sm,gil',
    areaSqKm: 26,
    population: 11508,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Tuvalu', id: 'tuv'),
      Phrase(langCode: 'ar', value: 'توفالو', id: 'tuv'),
      Phrase(langCode: 'en', value: 'Tuvalu', id: 'tuv'),
      Phrase(langCode: 'fr', value: 'Tuvalu', id: 'tuv'),
      Phrase(langCode: 'es', value: 'Tuvalu', id: 'tuv'),
      Phrase(langCode: 'zh', value: '图瓦卢', id: 'tuv'),
    ],
  ),

  Flag(
    id: 'uga',
    iso2: 'UG',
    icon: '$_flagIconPath/flag_af_e_uganda.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'UGX',
    phoneCode: '+256',
    capital: 'Kampala',
    langCodes: 'en-UG,lg,sw,ar',
    areaSqKm: 236040,
    population: 42723139,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Uganda', id: 'uga'),
      Phrase(langCode: 'ar', value: 'أوغندا', id: 'uga'),
      Phrase(langCode: 'en', value: 'Uganda', id: 'uga'),
      Phrase(langCode: 'fr', value: 'Ouganda', id: 'uga'),
      Phrase(langCode: 'es', value: 'Uganda', id: 'uga'),
      Phrase(langCode: 'zh', value: '乌干达', id: 'uga'),
    ],
  ),

  Flag(
    id: 'ukr',
    iso2: 'UA',
    icon: '$_flagIconPath/flag_eu_e_ukraine.svg',
    region: 'Eastern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'UAH',
    phoneCode: '+380',
    capital: 'Kiev',
    langCodes: 'uk,ru-UA,rom,pl,hu',
    areaSqKm: 603700,
    population: 44622516,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Ukraine', id: 'ukr'),
      Phrase(langCode: 'ar', value: 'أوكرانيا', id: 'ukr'),
      Phrase(langCode: 'en', value: 'Ukraine', id: 'ukr'),
      Phrase(langCode: 'fr', value: 'Ukraine', id: 'ukr'),
      Phrase(langCode: 'es', value: 'Ucrania', id: 'ukr'),
      Phrase(langCode: 'zh', value: '乌克兰', id: 'ukr'),
    ],
  ),

  Flag(
    id: 'are',
    iso2: 'AE',
    icon: '$_flagIconPath/flag_as_w_uae.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'AED',
    phoneCode: '+971',
    capital: 'Abu Dhabi',
    langCodes: 'ar-AE,fa,en,hi,ur',
    areaSqKm: 82880,
    population: 9630959,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vereinigte Arabische Emirate', id: 'are'),
      Phrase(langCode: 'ar', value: 'الإمارات العربية المتحدة', id: 'are'),
      Phrase(langCode: 'en', value: 'United Arab Emirates', id: 'are'),
      Phrase(langCode: 'fr', value: 'Émirats arabes unis', id: 'are'),
      Phrase(langCode: 'es', value: 'Emiratos Árabes Unidos', id: 'are'),
      Phrase(langCode: 'zh', value: '阿联酋', id: 'are'),
    ],
  ),

  Flag(
    id: 'gbr',
    iso2: 'GB',
    icon: '$_flagIconPath/flag_eu_n_united_kingdom.svg',
    region: 'Northern Europe',
    continent: 'Europe',
    language: 'en',
    currencyID: 'GBP',
    phoneCode: '+44',
    capital: 'London',
    langCodes: 'en-GB,cy-GB,gd',
    areaSqKm: 244820,
    population: 1885400,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vereinigtes Königreich', id: 'gbr'),
      Phrase(langCode: 'ar', value: 'المملكة المتحدة', id: 'gbr'),
      Phrase(langCode: 'en', value: 'United Kingdom', id: 'gbr'),
      Phrase(langCode: 'fr', value: 'Royaume-Uni', id: 'gbr'),
      Phrase(langCode: 'es', value: 'Reino Unido', id: 'gbr'),
      Phrase(langCode: 'zh', value: '英国', id: 'gbr'),
    ],
  ),

  Flag(
    id: 'usa',
    iso2: 'US',
    icon: '$_flagIconPath/flag_na_usa.svg',
    region: 'Northern America',
    continent: 'North America',
    language: 'en',
    currencyID: 'USD',
    phoneCode: '+1',
    capital: 'Washington',
    langCodes: 'en-US,es-US,haw,fr',
    areaSqKm: 9629091,
    population: 326687501,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vereinigte Staaten', id: 'usa'),
      Phrase(langCode: 'ar', value: 'الولايات المتحدة', id: 'usa'),
      Phrase(langCode: 'en', value: 'United States', id: 'usa'),
      Phrase(langCode: 'fr', value: 'États-Unis', id: 'usa'),
      Phrase(langCode: 'es', value: 'Estados Unidos', id: 'usa'),
      Phrase(langCode: 'zh', value: '美国', id: 'usa'),
    ],
  ),

  Flag(
    id: 'ury',
    iso2: 'UY',
    icon: '$_flagIconPath/flag_sa_uruguay.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'UYU',
    phoneCode: '+598',
    capital: 'Montevideo',
    langCodes: 'es-UY',
    areaSqKm: 176220,
    population: 3449299,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Uruguay', id: 'ury'),
      Phrase(langCode: 'ar', value: 'الأوروغواي', id: 'ury'),
      Phrase(langCode: 'en', value: 'Uruguay', id: 'ury'),
      Phrase(langCode: 'fr', value: 'Uruguay', id: 'ury'),
      Phrase(langCode: 'es', value: 'Uruguay', id: 'ury'),
      Phrase(langCode: 'zh', value: '乌拉圭', id: 'ury'),
    ],
  ),

  Flag(
    id: 'uzb',
    iso2: 'UZ',
    icon: '$_flagIconPath/flag_as_c_uzbekistn.svg',
    region: 'Central Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'UZS',
    phoneCode: '+998',
    capital: 'Tashkent',
    langCodes: 'uz,ru,tg',
    areaSqKm: 447400,
    population: 32955400,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Usbekistan', id: 'uzb'),
      Phrase(langCode: 'ar', value: 'أوزبكستان', id: 'uzb'),
      Phrase(langCode: 'en', value: 'Uzbekistan', id: 'uzb'),
      Phrase(langCode: 'fr', value: 'Ouzbékistan', id: 'uzb'),
      Phrase(langCode: 'es', value: 'Uzbekistán', id: 'uzb'),
      Phrase(langCode: 'zh', value: '乌兹别克斯坦', id: 'uzb'),
    ],
  ),

  Flag(
    id: 'vut',
    iso2: 'VU',
    icon: '$_flagIconPath/flag_oc_melan_vanuatu.svg',
    region: 'Melanesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'VUV',
    phoneCode: '+678',
    capital: 'Port Vila',
    langCodes: 'bi,en-VU,fr-VU',
    areaSqKm: 12200,
    population: 292680,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vanuatu', id: 'vut'),
      Phrase(langCode: 'ar', value: 'فانواتو', id: 'vut'),
      Phrase(langCode: 'en', value: 'Vanuatu', id: 'vut'),
      Phrase(langCode: 'fr', value: 'Vanuatu', id: 'vut'),
      Phrase(langCode: 'es', value: 'Vanuatu', id: 'vut'),
      Phrase(langCode: 'zh', value: '瓦努阿图', id: 'vut'),
    ],
  ),

  Flag(
    id: 'ven',
    iso2: 'VE',
    icon: '$_flagIconPath/flag_sa_venezuela.svg',
    region: 'South America',
    continent: 'South America',
    language: 'en',
    currencyID: 'VEF',
    phoneCode: '+58',
    capital: 'Caracas',
    langCodes: 'es-VE',
    areaSqKm: 912050,
    population: 28870195,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Venezuela', id: 'ven'),
      Phrase(langCode: 'ar', value: 'فنزويلا', id: 'ven'),
      Phrase(langCode: 'en', value: 'Venezuela', id: 'ven'),
      Phrase(langCode: 'fr', value: 'Venezuela', id: 'ven'),
      Phrase(langCode: 'es', value: 'Venezuela', id: 'ven'),
      Phrase(langCode: 'zh', value: '委内瑞拉', id: 'ven'),
    ],
  ),

  Flag(
    id: 'vnm',
    iso2: 'VN',
    icon: '$_flagIconPath/flag_as_se_vietnam.svg',
    region: 'South-eastern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'VND',
    phoneCode: '+84',
    capital: 'Hanoi',
    langCodes: 'vi,en,fr,zh,km',
    areaSqKm: 329560,
    population: 95540395,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Vietnam', id: 'vnm'),
      Phrase(langCode: 'ar', value: 'فيتنام', id: 'vnm'),
      Phrase(langCode: 'en', value: 'Vietnam', id: 'vnm'),
      Phrase(langCode: 'fr', value: 'Viêt Nam', id: 'vnm'),
      Phrase(langCode: 'es', value: 'Vietnam', id: 'vnm'),
      Phrase(langCode: 'zh', value: '越南', id: 'vnm'),
    ],
  ),

  Flag(
    id: 'wlf',
    iso2: 'WF',
    icon: '$_flagIconPath/flag_eu_w_france.svg',
    region: 'Polynesia',
    continent: 'Oceania',
    language: 'en',
    currencyID: 'XPF',
    phoneCode: '+681',
    capital: 'Mata Utu',
    langCodes: 'wls,fud,fr-WF',
    areaSqKm: 274,
    population: 15289,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Wallis und Futuna', id: 'wlf'),
      Phrase(langCode: 'ar', value: 'والس وفوتونا', id: 'wlf'),
      Phrase(langCode: 'en', value: 'Wallis And Futuna', id: 'wlf'),
      Phrase(langCode: 'fr', value: 'Wallis-et-Futuna', id: 'wlf'),
      Phrase(langCode: 'es', value: 'Wallis y Futuna', id: 'wlf'),
      Phrase(langCode: 'zh', value: '瓦利斯和富图纳', id: 'wlf'),
    ],
  ),

  Flag(
    id: 'yem',
    iso2: 'YE',
    icon: '$_flagIconPath/flag_as_w_yemen.svg',
    region: 'Western Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'YER',
    phoneCode: '+967',
    capital: 'Sanaa',
    langCodes: 'ar-YE',
    areaSqKm: 527970,
    population: 28498687,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Jemen', id: 'yem'),
      Phrase(langCode: 'ar', value: 'اليمن', id: 'yem'),
      Phrase(langCode: 'en', value: 'Yemen', id: 'yem'),
      Phrase(langCode: 'fr', value: 'Yémen', id: 'yem'),
      Phrase(langCode: 'es', value: 'Yemen', id: 'yem'),
      Phrase(langCode: 'zh', value: '也门', id: 'yem'),
    ],
  ),

  Flag(
    id: 'zmb',
    iso2: 'ZM',
    icon: '$_flagIconPath/flag_af_e_zambia.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'ZMW',
    phoneCode: '+260',
    capital: 'Lusaka',
    langCodes: 'en-ZM,bem,loz,lun,lue,ny,toi',
    areaSqKm: 752614,
    population: 17351822,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Sambia', id: 'zmb'),
      Phrase(langCode: 'ar', value: 'زامبيا', id: 'zmb'),
      Phrase(langCode: 'en', value: 'Zambia', id: 'zmb'),
      Phrase(langCode: 'fr', value: 'Zambie', id: 'zmb'),
      Phrase(langCode: 'es', value: 'Zambia', id: 'zmb'),
      Phrase(langCode: 'zh', value: '赞比亚', id: 'zmb'),
    ],
  ),

  Flag(
    id: 'zwe',
    iso2: 'ZW',
    icon: '$_flagIconPath/flag_af_e_zimbabwe.svg',
    region: 'Eastern Africa',
    continent: 'Africa',
    language: 'en',
    currencyID: 'ZWL',
    phoneCode: '+263',
    capital: 'Harare',
    langCodes: 'en-ZW,sn,nr,nd',
    areaSqKm: 390580,
    population: 14439018,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Simbabwe', id: 'zwe'),
      Phrase(langCode: 'ar', value: 'زيمبابوي', id: 'zwe'),
      Phrase(langCode: 'en', value: 'Zimbabwe', id: 'zwe'),
      Phrase(langCode: 'fr', value: 'Zimbabwe', id: 'zwe'),
      Phrase(langCode: 'es', value: 'Zimbabue', id: 'zwe'),
      Phrase(langCode: 'zh', value: '津巴布韦', id: 'zwe'),
    ],
  ),

  Flag(
    id: 'afg',
    iso2: 'AF',
    icon: '$_flagIconPath/flag_as_s_afghanistan.svg',
    region: 'Southern Asia',
    continent: 'Asia',
    language: 'en',
    currencyID: 'AFN',
    phoneCode: '+93',
    capital: 'Kabul',
    langCodes: 'fa-AF,ps,uz-AF,tk',
    areaSqKm: 647500,
    population: 37172386,
    phrases: <Phrase>[
      Phrase(langCode: 'de', value: 'Afghanistan', id: 'afg'),
      Phrase(langCode: 'ar', value: 'أفغانستان', id: 'afg'),
      Phrase(langCode: 'en', value: 'Afghanistan', id: 'afg'),
      Phrase(langCode: 'fr', value: 'Afghanistan', id: 'afg'),
      Phrase(langCode: 'es', value: 'Afganistán', id: 'afg'),
      Phrase(langCode: 'zh', value: '阿富汗', id: 'afg'),
    ],
  ),

];

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

/// => TAMAM
@immutable
class Phrase {
  /// --------------------------------------------------------------------------
  const Phrase({
    @required this.value,
    @required this.id,
    this.langCode,
    this.trigram,
  });
  /// --------------------------------------------------------------------------
  final String id;
  final String langCode;
  final String value;
  final List<String> trigram;
  // -----------------------------------------------------------------------------

  /// CLONING

  // --------------------
  /// TESTED : WORKS PERFECT
  Phrase copyWith({
    String id,
    String langCode,
    String value,
    List<String> trigram,
  }){
    return Phrase(
      id: id ?? this.id,
      langCode: langCode ?? this.langCode,
      value: value ?? this.value,
      trigram: trigram ?? this.trigram,
    );
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  Phrase completeTrigram(){

    Phrase _phrase = Phrase(
      id: id,
      value: value,
      langCode: langCode,
      trigram: trigram,
    );

    if (Mapper.checkCanLoopList(trigram) == false){

      _phrase = _phrase.copyWith(
        trigram: Stringer.createTrigram(input: value),
      );

    }

    return _phrase;
  }
  // -----------------------------------------------------------------------------

  /// Default Map CYPHER

  // --------------------
  /// DEFAULT MAP LOOKS LIKE THIS:
  /// {
  ///   'id': id,
  ///   'langCode': langCode,
  ///   'value': value,
  ///   'trigram': trigram,
  /// }
  // --------------------
  /// TESTED : WORKS PERFECT
  Map<String, dynamic> toDefaultMap({
    @required bool includeID,
    bool includeTrigram = false,
    bool includeLangCode = false,
    String overrideLangCode,
  }) {

    /// START MAP
    Map<String, dynamic> _map = <String, dynamic>{
      /// 'id' : id, DO NOT put id in the single phrase map, will be used as phrases map key
      'value': value,
    };

    /// WHEN INCLUDES ID
    if (includeID == true){
      _map = Mapper.insertPairInMap(
        map: _map,
        key: 'id',
        value: id,
      );

    }

    /// WHEN INCLUDING LANGUAGE CODE
    if (includeLangCode == true){

      /// ADD LANG CODE IF EXISTED
      if (langCode != null){
        _map = Mapper.insertPairInMap(
          map: _map,
          key: 'langCode',
          value: overrideLangCode ?? langCode,
        );
      }

    }

    /// WHEN INCLUDING TRIGRAM
    if (includeTrigram == true){

      final bool _trigramExists = Mapper.checkCanLoopList(trigram);

      _map = Mapper.insertPairInMap(
        map: _map,
        key: 'trigram',
        value: _trigramExists ?
        trigram
            :
        Stringer.createTrigram(input: value),
      );
    }

    return _map;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Phrase decipherPhraseDefaultMap({
    @required String id,
    @required Map<String, dynamic> map,
    String langCodeOverride,
    bool includeTrigram,
  }) {

    final List<String> _trigram = _getTrigramIfIncluded(
      includeTrigram: includeTrigram,
      existingTrigram: Stringer.getStringsFromDynamics(dynamics: map['trigram']),
      originalString: map['value'],
    );

    return Phrase(
      id: id ?? map['id'],
      value: map['value'],
      langCode: langCodeOverride ?? map['langCode'],
      trigram: _trigram,
    );

  }
  // -----------------------------------------------------------------------------

  /// Phids Map CYPHER

  // --------------------
  /// PHIDS MAP LOOKS LIKE THIS:
  /// {
  ///   'phid_1': value1,
  ///   'phid_2': value2,
  /// }
  // --------------------
  ///  TESTED : WORKS PERFECT
  static Map<String, dynamic> cipherPhrasesToPhidsMap(List<Phrase> phrases){

    Map<String, dynamic> _map;

    if (Mapper.checkCanLoopList(phrases) == true){
      _map = {};

      for (final Phrase phrase in phrases){

        _map = Mapper.insertPairInMap(
          map: _map,
          key: phrase.id,
          value: phrase.value,
        );

      }

    }

    return _map;
  }
  // --------------------
  ///  TESTED : WORKS PERFECT
  static List<Phrase> decipherPhrasesFromPhidsMap({
    @required String langCode,
    @required Map<String, dynamic> map,
    bool includeTrigram = true,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (map != null){

      final List<String> _keys = map.keys.toList();

      if (Mapper.checkCanLoopList(_keys) == true){

        for (final String key in _keys){

          final List<String> _trigram =
          includeTrigram == true ?
          Stringer.createTrigram(
            input: map[key],
            // removeSpaces: false,
          )
              :
          null;

          final Phrase _phrase = Phrase(
            id: key,
            value: map[key],
            langCode: langCode,
            trigram: _trigram,
          );

          _output.add(_phrase);

        }

      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// Langs Map CYPHER

  // --------------------
  /// LANGS MAP LOOKS LIKE THIS:
  /// {
  ///   'langCode_1': value1,
  ///   'langCode_2': value2,
  ///   'en' : 'countryName',
  ///   'ar' : 'الاسم',
  /// }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Map<String, dynamic> cipherPhrasesToLangsMap(List<Phrase> phrases){
    Map<String, dynamic> _output = {};

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        _output = Mapper.insertPairInMap(
          map: _output,
          key: phrase.langCode,
          value: phrase.value,
        );

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> decipherPhrasesLangsMap({
    @required Map<String, dynamic> langsMap,
    @required String phid,
  }){

    final List<Phrase> _output = <Phrase>[];

    if (langsMap != null){

      final List<String> _keys = langsMap.keys.toList(); // lang codes

      if (Mapper.checkCanLoopList(_keys) == true){

        for (final String key in _keys){

          final String _value = langsMap[key];

          final Phrase _phrase = Phrase(
            id: phid,
            langCode: key,
            value: _value,
            trigram: Stringer.createTrigram(
              input: TextMod.fixCountryName(_value),
            ),
          );

          _output.add(_phrase);

        }

      }


    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// MIXED LANGS SINGLE MAP CYPHER

  // --------------------
  /// MIXED LANGS SINGLE MAP LOOKS LIKE THIS:
  /// {
  ///  'langCode_1': {
  ///     'id': id, <----- duplicate ID
  ///     'langCode': en, <----- different lang code
  ///     'value': valueEN,
  ///     'trigram': trigramEN,
  ///  },
  ///  'langCode_2': {
  ///     'id': id, <----- duplicate ID
  ///     'langCode': en, <----- different lang code
  ///     'value': valueAR,
  ///     'trigram': trigramAR,
  ///  },
  // --------------------
  /// TESTED : WORKS PERFECT
  static Map<String, dynamic> cipherMixedLangPhrasesToMap({
    @required List<Phrase> phrases,
  }){
    Map<String, dynamic> _output = {};

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        _output = Mapper.insertPairInMap(
          map: _output,
          key: phrase.langCode,
          value: phrase.toDefaultMap(
            includeID: true,
            includeLangCode: true,
            includeTrigram: true,
          ),
        );

      }
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> decipherMixedLangPhrasesFromMap({
    @required Map<String, dynamic> map,
  }){
    final List<Phrase> _phrases = <Phrase>[];

    if (map != null){

      final List<String> _keys = map.keys.toList();

      if (Mapper.checkCanLoopList(_keys) == true){

        for (final String langCode in _keys){

          final Map<String, dynamic> _defaultPhraseMap = map[langCode];

          _phrases.add(decipherPhraseDefaultMap(
              id: _defaultPhraseMap['id'],
              map: _defaultPhraseMap,
          ));

        }

      }

    }

    return _phrases;

  }
  // -----------------------------------------------------------------------------

  /// MIXED LANGS MAPS CYPHER

  // --------------------
  /// MIXED LANGS LOOKS LIKE THIS:
  /// {
  ///   'id': id, <----- duplicate ID
  ///   'langCode': en, <----- different lang code
  ///   'value': valueEN,
  ///   'trigram': trigramEN,
  /// }
  /// {
  ///   'id': id, <----- duplicate ID
  ///   'langCode': ar, <----- different lang code
  ///   'value': valueAR,
  ///   'trigram': trigramAR,
  /// }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Map<String, dynamic>> cipherMixedLangPhrasesToMaps({
    @required List<Phrase> phrases,
    bool includeTrigrams = true,
  }){
    final List<Map<String, dynamic>> _maps = <Map<String, dynamic>>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        Map<String, dynamic> _map = phrase.toDefaultMap(
          includeID: true,
          includeTrigram: includeTrigrams,
          overrideLangCode: phrase.langCode,
          includeLangCode: true,
        );

        /// used as primary key, due to duplicates in both ids and langCodes
        _map = Mapper.insertPairInMap(
          map: _map,
          key: 'primaryKey',//'id_langCode',
          value: createPhraseLDBPrimaryKey(
            phid: phrase.id,
            langCode: phrase.langCode,
          ),
        );

        _maps.add(_map);

      }

    }

    return _maps;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String createPhraseLDBPrimaryKey({
    @required String phid,
    @required String langCode,
  }){
    return '${phid}_$langCode';
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> decipherMixedLangPhrasesFromMaps({
    @required List<dynamic> maps,
  }){
    final List<Phrase> _phrases = <Phrase>[];

    if (Mapper.checkCanLoopList(maps) == true){

      for (final Map<String, dynamic> map in maps){

        final Phrase _phrase = decipherPhraseDefaultMap(
          id: map['id'],
          map: map,
          langCodeOverride: map['langCode'],
          includeTrigram: true,
        );

        _phrases.add(_phrase);

      }

    }

    return _phrases;
  }
  // -----------------------------------------------------------------------------
  /// DEPRECATED
  /*
  /// TESTED : WORKS PERFECT : used to upload to firebase
  static Map<String, dynamic> cipherOneLangPhrasesToMap({
    @required List<Phrase> phrases,
    bool addTrigrams = false,
    bool includeLangCode = false,
    String overrideLangCode,
  }) {
    Map<String, dynamic> _phrasesMap = <String, dynamic>{};

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        _phrasesMap = Mapper.insertPairInMap(
          map: _phrasesMap,
          key: phrase.id,
          value: phrase.toDefaultMap(
            includeID: false,
            includeTrigram: addTrigrams,
            includeLangCode: includeLangCode,
            overrideLangCode: overrideLangCode,
          ),

        );
      }

    }

    return _phrasesMap;
  }
   */
  // --------------------
  /// DEPRECATED
  /*
  /// used to store in LDB
  static List<Map<String, dynamic>> cipherOneLangPhrasesToMapsX({
    @required List<Phrase> phrases,
    bool addTrigrams = false,
    bool includeLangCode = false,
    String overrideLangCode,
  }){

    final List<Map<String, dynamic>> _maps = <Map<String,dynamic>>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        final Map<String, dynamic> _map = phrase.toDefaultMap(
          includeID: true,
          includeTrigram: addTrigrams,
          includeLangCode: includeLangCode,
          overrideLangCode: overrideLangCode,
        );

        _maps.add(_map);

      }

    }

    return _maps;
  }
   */
  // --------------------
  /// DEPRECATED
  /*
  /// TESTED : WORKS PERFECT
  static List<Phrase> decipherOneLangPhrasesMapX({
    @required Map<String, dynamic> map,
    String addLangCodeOverride,
    bool includeTrigrams = false,
  }){
    final List<Phrase> _phrases = <Phrase>[];

    final List<String> _keys = map?.keys?.toList();

    if (Mapper.checkCanLoopList(_keys)){

      for (int i = 0; i<_keys.length; i++){

        final String _key = _keys[i];
        final Phrase _phrase = decipherPhraseDefaultMap(
          id: _key,
          map: map[_key],
          langCodeOverride: addLangCodeOverride,
          includeTrigram: includeTrigrams,
        );
        _phrases.add(_phrase);

      }

    }

    return _phrases;
  }
   */
  // --------------------
  /// DEPRECATED
  /*
  /// TESTED : WORKS PERFECT
  static List<Phrase> decipherOneLangPhrasesMapsX({
    @required List<Map<String, dynamic>> maps,
    String langCodeOverride,
    bool includeTrigrams = false,
  }){

    final List<Phrase> _phrases = <Phrase>[];

    if (Mapper.checkCanLoopList(maps) == true){

      for (int i = 0; i< maps.length; i++){

        final Map<String, dynamic> _map = maps[i];

        final Phrase _phrase = decipherPhraseDefaultMap(
          id: _map['id'],
          map: _map,
          langCodeOverride: langCodeOverride,
          includeTrigram: includeTrigrams,
        );

        _phrases.add(_phrase);
      }

    }

    return _phrases;
  }
   */
  // -----------------------------------------------------------------------------

  /// STREAMING

  // --------------------
  /// DEPRECATED
  /*
  static List<Phrase> getPhrasesFromStream({
    @required DocumentSnapshot<Object> doc,
    @required String langCode,
  }) {

    final Map<String, dynamic> _map = Mapper.getMapFromDocumentSnapshot(
      docSnapshot: doc,
      addDocSnapshot: false,
      addDocID: false,
    );

    final List<Phrase> _models = Phrase.decipherOneLangPhrasesMap(
      map: _map,
      addLangCodeOverride: langCode,
    );

    return _models;
  }
   */
  // -----------------------------------------------------------------------------

  /// BLOGGERS

  // --------------------
  /// TESTED : WORKS PERFECT
  void blogPhrase({String invoker = ''}){
    blog('PHRASE $invoker : langCode : $langCode : id : $id : $value : trigram(${trigram?.length})');
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void blogPhrases(List<Phrase> phrases){

    int _count = 1;

    if (Mapper.checkCanLoopList(phrases)){

      for (final Phrase phrase in phrases){
        blog(
            '  #$_count : '
                'id : [ ${phrase.id} ] : '
                'langCode : [ ${phrase.langCode} ] : '
                'name : [ ${phrase.value} ] : '
                'trigramLength : ${phrase.trigram?.length}'
        );
        _count++;
      }

    }
    else {
      blog('phrases ARE FUCKING NULL');
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static void blogPhrasesListsDifferences({
    @required List<Phrase> phrases1,
    @required String phrases1Name,
    @required List<Phrase> phrases2,
    @required String phrases2Name,
    bool sortBeforeCompare = true,
  }){

    if (Mapper.checkCanLoopList(phrases1) == true && Mapper.checkCanLoopList(phrases2) == true){

      List<Phrase> _phrases1;
      List<Phrase> _phrases2;

      if (sortBeforeCompare == true){

        _phrases1 = Phrase.sortPhrasesByIDAndLang(phrases: phrases1);
        _phrases2 = Phrase.sortPhrasesByIDAndLang(phrases: phrases2);
      }
      else {
        _phrases1 = phrases1;
        _phrases2 = phrases2;
      }

      final List<String> _list1 = Phrase.transformPhrasesToStrings(_phrases1);
      final List<String> _list2 = Phrase.transformPhrasesToStrings(_phrases2);

      Stringer.blogStringsListsDifferences(
        strings1: _list1,
        list1Name: phrases1Name,
        strings2: _list2,
        list2Name: phrases2Name,
      );

    }

  }
  // -----------------------------------------------------------------------------

  /// GETTERS

  // --------------------
  /// DEPRECATED IN FAVOR TO [getLangCodes]
  /*
  static List<String> _getLingCodesFromPhrases(List<Phrase> phrases){

    final List<String> _langCodes = <String>[];

    if (Mapper.checkCanLoopList(phrases)){

      for (final Phrase phrase in phrases){
        _langCodes.add(phrase.langCode);
      }

    }

    return _langCodes;
  }
   */
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> getPhrasesIDs(List<Phrase> phrases){

    List<String> _output = <String>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        _output = Stringer.addStringToListIfDoesNotContainIt(
          strings: _output,
          stringToAdd: phrase.id,
        );

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> getLangCodes(List<Phrase> phrases){
     List<String> _codes = <String>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase _phrase in phrases){

        _codes = Stringer.addStringToListIfDoesNotContainIt(
            strings: _codes,
            stringToAdd: _phrase.langCode,
        );

      }

    }

    return _codes;
  }
  // -----------------------------------------------------------------------------

  /// SEARCHERS

  // --------------------
  /// BY ID
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesByID({
    @required List<Phrase> phrases,
    @required String phid,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true && phid != null){

      final List<Phrase> _phrases = phrases.where((ph) => ph.id == phid).toList();

      if (Mapper.checkCanLoopList(_phrases) == true){
        _output.addAll(_phrases);
      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesByIDs({
    @required List<Phrase> phrases,
    @required List<String> phids,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true && Mapper.checkCanLoopList(phids) == true){

      for (final String phid in phids){

        final List<Phrase> _phrases = searchPhrasesByID(
          phrases: phrases,
          phid: phid,
        );

        if (Mapper.checkCanLoopList(_phrases) == true){
          _output.addAll(_phrases);
        }

      }

    }

    return _output;
  }
  // --------------------
  /// BY ID + LANG
  // --------------------
  /// TESTED : WORKS PERFECT
  static Phrase searchPhraseByIDAndLangCode({
    @required List<Phrase> phrases,
    @required String phid,
    @required String langCode,
  }){
    Phrase _phrase;

    if (Mapper.checkCanLoopList(phrases) == true && TextCheck.isEmpty(phid) == false){

      /// SEARCH PHRASES

      final List<Phrase> _phrasesByID = searchPhrasesByID(
        phrases: phrases,
        phid: phid,
      );

      if (langCode == null){
        _phrase = searchFirstPhraseByLang(
          phrases: _phrasesByID,
          langCode: 'en',
        );
      }
      else {
        _phrase = searchFirstPhraseByLang(
          phrases: _phrasesByID,
          langCode: langCode,
        );
      }




      // _phrase = phrases.firstWhere((ph){
      //
      //   bool _found = false;
      //
      //   if (ph.id == id){
      //     _found = true;
      //   }
      //
      //   if (searchLangCode != null){
      //
      //     if (ph.langCode == searchLangCode){
      //       _found = true;
      //     }
      //     else {
      //       _found = false;
      //     }
      //
      //   }
      //
      //
      //   return _found;
      // });


    }

    return _phrase;
  }
  // --------------------
  /// BY LANG
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesByLang({
    @required List<Phrase> phrases,
    @required String langCode,
  }){
    List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){
      _output = phrases.where((phr) => phr?.langCode == langCode).toList();
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Phrase searchFirstPhraseByLang({
    @required List<Phrase> phrases,
    @required String langCode,
  }){

    Phrase _phrase;

    if (Mapper.checkCanLoopList(phrases) == true) {

      _phrase = phrases.firstWhere(
              (Phrase phrase) => phrase.langCode == langCode,
          orElse: () => null
      );


    }

    return _phrase;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesByLangs({
    @required List<Phrase> phrases,
    @required List<String> langCodes,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true && Mapper.checkCanLoopList(langCodes) == true){

      for (final Phrase phrase in phrases){

        final bool _contains = Stringer.checkStringsContainString(
          strings: langCodes,
          string: phrase.langCode,
        );

        if (_contains == true){

          _output.add(phrase);

        }

      }

    }

    return _output;
  }
  // --------------------
  /// BY VALUE / TRIGRAM ( SEARCH )
  // --------------------
  static Phrase searchPhraseByIdenticalValue({
    @required List<Phrase> phrases,
    @required String value,
  }){
    Phrase _phrase;

    if (Mapper.checkCanLoopList(phrases) == true && TextCheck.isEmpty(value) == false){

      for (final Phrase phrase in phrases){

        if (phrase.value  == value){
          _phrase = phrase;
          break;
        }

      }

    }

    return _phrase;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesRegExp({
    @required List<Phrase> phrases,
    @required String text,
    bool lookIntoIDs = true,
    bool lookIntoValues = false,
  }){
    final List<Phrase> _result = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) && text.isNotEmpty){

      if (lookIntoIDs == true){

        final List<Phrase> _byID = phrases.where((ph){

          return
            TextCheck.stringContainsSubStringRegExp(
              string: ph.id,
              subString: text,
            ) == true;

        }).toList();

        _result.addAll(_byID);
      }

      if (lookIntoValues == true){

        final List<Phrase> _byValue = phrases.where((ph){

          return
            TextCheck.stringContainsSubStringRegExp(
              string: ph.value,
              subString: text,
            ) == true;

        }).toList();

        _result.addAll(_byValue);
      }

    }

    // blog('found those phrases');
    // Phrase.blogPhrases(_result,);

    return cleanIdenticalPhrases(_result);
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> searchPhrasesTrigrams({
    @required List<Phrase> sourcePhrases,
    @required String inputText,
  }){
    final List<Phrase> _foundPhrases = <Phrase>[];
    final String _fixedString = TextMod.fixCountryName(inputText);

    for (final Phrase source in sourcePhrases){

      final List<String> _trigram = source?.trigram;

      final bool _trigramContains = Stringer.checkStringsContainString(
          strings: _trigram,
          string: _fixedString
      );

      if (_trigramContains == true){
        _foundPhrases.add(source);
      }

    }

    return _foundPhrases;
  }
  // -----------------------------------------------------------------------------

  /// SYMMETRY

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> symmetrizePhrase({
    @required Phrase phrase,
    @required List<Phrase> allMixedPhrases,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (phrase != null && Mapper.checkCanLoopList(allMixedPhrases) == true){
      if (phrase.langCode != null){

        final String _secondLang = phrase.langCode == 'en' ? 'ar' : 'en';

        final Phrase _otherLangPhrase = searchPhraseByIDAndLangCode(
          phrases: allMixedPhrases,
          phid: phrase.id,
          langCode: _secondLang,
        );

        if (_otherLangPhrase != null){
          _output.addAll(<Phrase>[
            phrase,
            _otherLangPhrase,
          ]);
        }

      }
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> symmetrizePhrases({
    @required List<Phrase> phrasesToSymmetrize,
    @required List<Phrase> allMixedPhrases,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrasesToSymmetrize) == true){

      for (final Phrase phrase in phrasesToSymmetrize){

        final List<Phrase> _pair = symmetrizePhrase(
            phrase: phrase,
            allMixedPhrases: allMixedPhrases
        );

        if (Mapper.checkCanLoopList(_pair) == true){
          _output.addAll(_pair);
        }

      }

    }

    return cleanIdenticalPhrases(_output);
  }
  // -----------------------------------------------------------------------------

  /// CHECKERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkPhrasesIncludeIdenticalPhrase({
    @required List<Phrase> phrases,
    @required Phrase firstPhrase,
  }){
    bool _include = false;

    if (Mapper.checkCanLoopList(phrases) == true && firstPhrase != null){

      for (final Phrase secondPhrase in phrases){

        final bool _found =
                firstPhrase?.id == secondPhrase?.id
                &&
                firstPhrase?.value  == secondPhrase?.value
                &&
                firstPhrase?.langCode == secondPhrase?.langCode;

        if (_found == true){
          _include = true;
          break;
        }

      }

    }

    return _include;
  }
  // --------------------
  /// loops phrases for any phrase of this lang code
  static bool checkPhrasesIncludeValueForThisLanguage({
    @required List<Phrase> phrases,
    @required String langCode,
  }){

    bool _phraseInclude = false;

    if (Mapper.checkCanLoopList(phrases)){

      for (final Phrase phrase in phrases){

        if (phrase.langCode == langCode){
          if (phrase.value != null){

            _phraseInclude = true;
            break;

          }
        }

      }

    }


    return _phraseInclude;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkPhrasesIncludeThisID({
    @required List<Phrase> phrases,
    @required String id,
  }){
    bool _include = false;

    if (Mapper.checkCanLoopList(phrases) == true && TextCheck.isEmpty(id) == false){

      for (final Phrase phrase in phrases){

        if (phrase.id == id){
          _include = true;
          break;
        }

      }

    }

    return _include;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkPhrasesIncludeThisValue({
    @required List<Phrase> phrases,
    @required String value,
  }){
    bool _include = false;

    if (Mapper.checkCanLoopList(phrases) == true && TextCheck.isEmpty(value) == false){

      for (final Phrase phrase in phrases){

        if (phrase.value == value){
          _include = true;
          break;
        }

      }

    }

    return _include;
  }
  // -----------------------------------------------------------------------------

  /// SORTING

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> sortNamesAlphabetically(List<Phrase> phrases){

    if (Mapper.checkCanLoopList(phrases)){
      phrases.sort((Phrase a, Phrase b) => a.value.compareTo(b.value));
    }

    return phrases;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> sortPhrasesByIDAndLang({
    @required List<Phrase> phrases,
  }){
    List<Phrase> _output = <Phrase>[];

    final List<String> _langs = getLangCodes(phrases);

    if (Mapper.checkCanLoopList(_langs) == true){

      /// MAP OF {langCode : <Phrase>[]}
      for (final String _langCode in _langs){

        final List<Phrase> _langPhrases = searchPhrasesByLang(
            phrases: phrases,
            langCode: _langCode,
        );

        final List<Phrase> _sortedIDs = sortPhrasesByID(phrases: _langPhrases);

        _output = <Phrase>[..._output, ..._sortedIDs];
      }

    }

    return _output;
  }
  // -------------------------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> sortPhrasesByID({
    @required List<Phrase> phrases,
  }){

    if (Mapper.checkCanLoopList(phrases)){
      phrases.sort((Phrase a, Phrase b) => a.id.compareTo(b.id));
    }

    return phrases;
  }
  // -----------------------------------------------------------------------------

  /// INSERT

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> insertPhrase({
    @required List<Phrase> phrases,
    @required Phrase phrase,
    @required bool overrideDuplicateID,
    String addLanguageCode,
  }){
    final List<Phrase> _output = <Phrase>[...?phrases];

    if (phrase != null){

      final Phrase _phraseToInsert = phrase.copyWith(
        langCode: addLanguageCode ?? phrase.langCode,
      );

      final bool _idIsTaken = checkPhrasesIncludeThisID(
        phrases: _output,
        id: phrase.id,
      );

      /// PHRASES DO NOT HAVE THIS ID
      if (_idIsTaken == false){
        _output.add(_phraseToInsert);
      }

      /// PHRASE HAS THIS ID
      else {

        if (overrideDuplicateID == true){

          final int _existingPhraseIndex = _output.indexWhere((ph) => ph.id == phrase.id);
          if (_existingPhraseIndex != -1){
            _output.removeAt(_existingPhraseIndex);
            _output.insert(_existingPhraseIndex, _phraseToInsert);
          }

        }

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> insertPhrases({
    @required List<Phrase> insertIn,
    @required List<Phrase> phrasesToInsert,
    @required bool overrideDuplicateID,
    String addLanguageCode,
    bool allowDuplicateIDs,
  }){

    List<Phrase> _output = <Phrase>[];

    if (allowDuplicateIDs == true){
      _output = _combinePhrasesListsAndAllowDuplicateIDs(
        insertIn: insertIn,
        phrasesToInsert: phrasesToInsert,
        addLanguageCodeToInsertedPhrases: addLanguageCode,
      );
    }

    else {
      _output = _combinePhrasesWithoutDuplicateIDs(
        phrasesToInsert: phrasesToInsert,
        insertIn: insertIn,
        overrideDuplicateID: overrideDuplicateID,
        addLanguageCode: addLanguageCode,
      );
    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> _combinePhrasesListsAndAllowDuplicateIDs({
    @required List<Phrase> insertIn,
    @required List<Phrase> phrasesToInsert,
    String addLanguageCodeToInsertedPhrases,
  }){

    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(insertIn) == true){
      _output.addAll(insertIn);
    }

    if (Mapper.checkCanLoopList(phrasesToInsert) == true){

      List<Phrase> _phrasesToInsert = <Phrase>[...phrasesToInsert];

      if (TextCheck.isEmpty(addLanguageCodeToInsertedPhrases) == false){
        _phrasesToInsert = _addLangCodeToPhrases(
          phrases: phrasesToInsert,
          langCode: addLanguageCodeToInsertedPhrases,
        );
      }

      _output.addAll(_phrasesToInsert);
    }

    // blog('THE FUCKINGGGGGGGGGGG THING IS :');
    // blogPhrases(_output);

    return cleanIdenticalPhrases(_output);
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> _addLangCodeToPhrases({
    @required String langCode,
    @required List<Phrase> phrases,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        final Phrase _phrase = Phrase(
          value: phrase.value,
          id: phrase.id,
          langCode: langCode,
          trigram: phrase.trigram,
        );

        _output.add(_phrase);

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> _combinePhrasesWithoutDuplicateIDs({
    @required List<Phrase> insertIn,
    @required List<Phrase> phrasesToInsert,
    @required bool overrideDuplicateID,
    String addLanguageCode,
  }){

    List<Phrase> _output = <Phrase>[...?insertIn];

    if (Mapper.checkCanLoopList(phrasesToInsert) == true){

      for (final Phrase phrase in phrasesToInsert){

        _output = insertPhrase(
          phrases: _output,
          phrase: phrase,
          overrideDuplicateID: overrideDuplicateID,
          addLanguageCode: addLanguageCode,
        );

      }

    }

    // blog('_combinePhrasesWithoutDuplicateIDs : output phrases inserted are : ${_output.length} phrases ');
    // Phrase.blogPhrases(_output);

    return _output;

  }
  // -----------------------------------------------------------------------------

  /// MODIFIERS

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> replacePhraseByLangCode({
    @required List<Phrase> phrases,
    @required Phrase phrase,
  }){
   List<Phrase> _output = <Phrase>[];

   if (Mapper.checkCanLoopList(phrases) == true){

     _output.addAll(phrases);

     if (phrase != null){

       Map<String, dynamic> _langsMap = cipherPhrasesToLangsMap(_output);

       _langsMap = Mapper.insertPairInMap(
         map: _langsMap,
         key: phrase.langCode,
         value: phrase.value,
         overrideExisting: true,
       );

       _output = decipherPhrasesLangsMap(
           langsMap: _langsMap,
           phid: phrase.id,
       );

     }

   }

   return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> removePhraseByLangCode({
    @required List<Phrase> phrases,
    @required String langCode,
  }){
    final List<Phrase> _output = [];

    if (phrases != null && langCode != null){
      _output.addAll(phrases);

      final int _index = _output.indexWhere((ph) => ph.langCode == langCode);

      if (_index != -1){
        _output.removeAt(_index);
      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// CLEANING

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> cleanIdenticalPhrases(List<Phrase> phrases){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase firstPhrase in phrases){

        final bool _contains = checkPhrasesIncludeIdenticalPhrase(
          phrases: _output,
          firstPhrase: firstPhrase,
        );

        if (_contains == false){
          _output.add(firstPhrase);
        }

      }

    }

    // blog('phrases have become this after clean up');
    //   blogPhrases(_output);

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> cleanDuplicateIDs({
    @required List<Phrase> phrases,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        final bool _contains = checkPhrasesIncludeThisID(
            phrases: _output,
            id: phrase.id
        );

        if (_contains == false){
          _output.add(phrase);
        }

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> removeTrigramsFromPhrases(List<Phrase> phrases){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        final Phrase _cleaned = Phrase(
          id: phrase.id,
          value: phrase.value,
          langCode: phrase.langCode,
        );

        _output.add(_cleaned);

      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// DELETING

  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> deletePhidFromPhrases({
    @required List<Phrase> phrases,
    @required String phid,
  }){

    List<Phrase> _output = <Phrase>[];

    if (
    Mapper.checkCanLoopList(phrases) == true
        &&
        TextCheck.isEmpty(phid) == false
    ){

      _output = <Phrase>[...phrases];

      for (int i = 0; i< phrases.length; i++){

        if (phrases[i].id == phid){
          // _output.removeAt(i);
          _output.remove(phrases[i]);
          // blog('deletePhidFromPhrases : deleted : $i : id  ${phrases[i].id} : ${phrases[i].value} : lang : ${phrases[i].langCode}');
        }

      }

    }

    // blog('deletePhidFromPhrases : list had ${phrases.length} : but now has : ${_output.length} phrases');

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<Phrase> onlyIncludeIDAndValue({
    @required List<Phrase> phrases,
  }){
    final List<Phrase> _output = <Phrase>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){

        final Phrase _phrase = Phrase(
          id: phrase.id,
          value: phrase.value,
        );

        _output.add(_phrase);

      }

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static List<String> _getTrigramIfIncluded({
    @required bool includeTrigram,
    @required List<String> existingTrigram,
    @required String originalString,
  }){
    List<String> _output;

    if (includeTrigram == true){

      final bool _hasExitingOne = Mapper.checkCanLoopList(existingTrigram);

      if (_hasExitingOne == true){
        _output = existingTrigram;
      }
      else {
        _output = Stringer.createTrigram(input: originalString);
      }

    }

    return _output;
  }
  // -----------------------------------------------------------------------------

  /// EQUALITY

  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkPhrasesAreIdentical({
    @required Phrase phrase1,
    @required Phrase phrase2,
  }){

    bool _areIdentical = false;

    if (phrase1 != null && phrase2 != null){

      if (phrase1.id == phrase2.id){

        if (phrase1.langCode == phrase2.langCode){

          if (phrase1.value == phrase2.value){

            if (Mapper.checkListsAreIdentical(list1: phrase1.trigram, list2: phrase2.trigram)){

              _areIdentical = true;

            }

          }

        }

      }

    }

    return _areIdentical;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static bool checkPhrasesListsAreIdentical({
    @required List<Phrase> phrases1,
    @required List<Phrase> phrases2,
  }){

    bool _listsAreIdentical = false;

    if (phrases1 == null && phrases2 == null){
      _listsAreIdentical = true;
    }
    else if (phrases1?.isEmpty == true && phrases2?.isEmpty == true){
      _listsAreIdentical = true;
    }

    else if (Mapper.checkCanLoopList(phrases1) == true && Mapper.checkCanLoopList(phrases2) == true){

      if (phrases1.length == phrases2.length){

        // final List<String> codes = _getLingCodesFromPhrases(phrases1);

        bool _allLangCodesAreIdentical = true;

        for (int i = 0; i < phrases1.length; i++){

          final Phrase _phrase1 = phrases1[i];
          final Phrase _phrase2 = phrases2[i];

          if (Phrase.checkPhrasesAreIdentical(phrase1: _phrase1, phrase2: _phrase2) == true){
            _allLangCodesAreIdentical = true;
          }

          else {
            _allLangCodesAreIdentical = false;
            break;
          }

        }

        if (_allLangCodesAreIdentical == true){
          _listsAreIdentical = true;
        }

      }

    }

    return _listsAreIdentical;
  }
  // -----------------------------------------------------------------------------

  /// OVERRIDES

  // --------------------
   @override
   String toString() => 'id: $id : langCode : $langCode : value : $value : trigram.length : ${trigram?.length}';
  // --------------------
  @override
  bool operator == (Object other){

    if (identical(this, other)) {
      return true;
    }

    bool _areIdentical = false;
    if (other is Phrase){
      _areIdentical = checkPhrasesAreIdentical(
        phrase1: this,
        phrase2: other,
      );
    }

    return _areIdentical;
  }
  // --------------------
  @override
  int get hashCode =>
      value.hashCode^
      id.hashCode^
      langCode.hashCode^
      trigram.hashCode;
  // -----------------------------------------------------------------------------
  static List<String> transformPhrasesToStrings(List<Phrase> phrases){
    final List<String> _strings = <String>[];

    if (Mapper.checkCanLoopList(phrases) == true){

      for (final Phrase phrase in phrases){
        final String _string = phrase.toString();
        _strings.add(_string);
      }

    }

    return _strings;
  }

}
