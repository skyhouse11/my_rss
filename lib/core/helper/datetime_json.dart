class DatetimeJson {
  static DateTime? dateTimeFromIso(String? s) =>
      s == null ? null : DateTime.parse(s);
  static String? dateTimeToIso(DateTime? d) => d?.toIso8601String();
}
