/// Extending the bool class with a new method called `toNumber()`
extension ToSql on bool {
  int toNumber() => this ? 1 : 0;
}

/// Extending the int class with a new method called `toBool()`
extension FromSql on int? {
  bool toBool() => this == null ? false : this == 1;
}

extension SqlMap on Map<String, dynamic> {
  Map<String, dynamic> toSqlMap() {
    return map<String, dynamic>((key, value) {
      if (value is bool) {
        return MapEntry(key, value.toNumber());
      }
      return MapEntry(key, value);
    });
  }
}

extension SqlMapList on List<Map<String, dynamic>> {
  List<Map<String, dynamic>> toSqlMapList() {
    return map<Map<String, dynamic>>((e) => e.toSqlMap()).toList();
  }
}

extension ThenSqlMapList on Future<List<Map<String, dynamic>>> {
  Future<List<Map<String, dynamic>>> thenSqlMapList() async {
    return (await this).toSqlMapList();
  }
}
