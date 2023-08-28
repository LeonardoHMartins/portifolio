enum LogClassType {
  cow,
  allotment,
  semenBank;

  String get prettyName {
    switch (this) {
      case LogClassType.cow:
        return 'Vaca';
      case LogClassType.allotment:
        return 'Lote';
      case LogClassType.semenBank:
        return 'Banco de Sêmen';
    }
  }

  String get name {
    switch (this) {
      case LogClassType.cow:
        return 'vaca';
      case LogClassType.allotment:
        return 'lote';
      case LogClassType.semenBank:
        return 'semen';
    }
  }

  factory LogClassType.fromString(String name) {
    switch (name) {
      case 'vaca':
        return LogClassType.cow;
      case 'lote':
        return LogClassType.allotment;
      case 'semen':
        return LogClassType.semenBank;
      default:
        throw Exception('Invalid name');
    }
  }
}
