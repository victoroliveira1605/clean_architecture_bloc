enum OriginalLanguage { EN, JA, IT, SV }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "it": OriginalLanguage.IT,
  "ja": OriginalLanguage.JA,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    return map.map((k, v) => new MapEntry(v, k));
  }
}
