class ReverseGeocoding {
  String name;
  LocalNames? localNames;
  double lat;
  double lon;
  String country;

  ReverseGeocoding({
    required this.name,
    this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
  });

  factory ReverseGeocoding.fromJson(Map<String, dynamic> json) => ReverseGeocoding(
    name: json["name"] ?? "Unknown",
    localNames: json["local_names"] != null
        ? LocalNames.fromJson(json["local_names"])
        : null,
    lat: json["lat"]?.toDouble() ?? 0.0,
    lon: json["lon"]?.toDouble() ?? 0.0,
    country: json["country"] ?? "Unknown",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "local_names": localNames?.toJson(),
    "lat": lat,
    "lon": lon,
    "country": country,
  };
}

class LocalNames {
  String? ar;
  String? ascii;
  String? bg;
  String? ca;
  String? de;
  String? el;
  String? en;
  String? fa;
  String? featureName;
  String? fi;
  String? fr;
  String? gl;
  String? he;
  String? hi;
  String? id;
  String? it;
  String? ja;
  String? la;
  String? lt;
  String? pt;
  String? ru;
  String? sr;
  String? th;
  String? tr;
  String? vi;
  String? zu;
  String? af;
  String? az;
  String? da;
  String? eu;
  String? hr;
  String? hu;
  String? mk;
  String? nl;
  String? no;
  String? pl;
  String? ro;
  String? sk;
  String? sl;

  LocalNames({
    this.ar,
    this.ascii,
    this.bg,
    this.ca,
    this.de,
    this.el,
    this.en,
    this.fa,
    this.featureName,
    this.fi,
    this.fr,
    this.gl,
    this.he,
    this.hi,
    this.id,
    this.it,
    this.ja,
    this.la,
    this.lt,
    this.pt,
    this.ru,
    this.sr,
    this.th,
    this.tr,
    this.vi,
    this.zu,
    this.af,
    this.az,
    this.da,
    this.eu,
    this.hr,
    this.hu,
    this.mk,
    this.nl,
    this.no,
    this.pl,
    this.ro,
    this.sk,
    this.sl,
  });

  factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
    ar: json["ar"],
    ascii: json["ascii"],
    bg: json["bg"],
    ca: json["ca"],
    de: json["de"],
    el: json["el"],
    en: json["en"],
    fa: json["fa"],
    featureName: json["feature_name"],
    fi: json["fi"],
    fr: json["fr"],
    gl: json["gl"],
    he: json["he"],
    hi: json["hi"],
    id: json["id"],
    it: json["it"],
    ja: json["ja"],
    la: json["la"],
    lt: json["lt"],
    pt: json["pt"],
    ru: json["ru"],
    sr: json["sr"],
    th: json["th"],
    tr: json["tr"],
    vi: json["vi"],
    zu: json["zu"],
    af: json["af"],
    az: json["az"],
    da: json["da"],
    eu: json["eu"],
    hr: json["hr"],
    hu: json["hu"],
    mk: json["mk"],
    nl: json["nl"],
    no: json["no"],
    pl: json["pl"],
    ro: json["ro"],
    sk: json["sk"],
    sl: json["sl"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "ascii": ascii,
    "bg": bg,
    "ca": ca,
    "de": de,
    "el": el,
    "en": en,
    "fa": fa,
    "feature_name": featureName,
    "fi": fi,
    "fr": fr,
    "gl": gl,
    "he": he,
    "hi": hi,
    "id": id,
    "it": it,
    "ja": ja,
    "la": la,
    "lt": lt,
    "pt": pt,
    "ru": ru,
    "sr": sr,
    "th": th,
    "tr": tr,
    "vi": vi,
    "zu": zu,
    "af": af,
    "az": az,
    "da": da,
    "eu": eu,
    "hr": hr,
    "hu": hu,
    "mk": mk,
    "nl": nl,
    "no": no,
    "pl": pl,
    "ro": ro,
    "sk": sk,
    "sl": sl,
  };
}