extension ToStringTreated on double {
  String toStringTreated() => toStringAsFixed(2).replaceAll('.', ',');
}
