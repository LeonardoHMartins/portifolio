enum LogType {
  allotment,
  nobryo;

  String get prettyName {
    switch (this) {
      case LogType.allotment:
        return 'Lote';
      case LogType.nobryo:
        return 'Nobryo';
    }
  }

  String get name {
    switch (this) {
      case LogType.allotment:
        return 'lote';
      case LogType.nobryo:
        return 'nobryo';
    }
  }

  factory LogType.fromString(String name) {
    switch (name) {
      case 'lote':
        return LogType.allotment;
      case 'nobryo':
        return LogType.nobryo;
      default:
        throw Exception('Invalid name');
    }
  }
}
