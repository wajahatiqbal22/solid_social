extension StringExtensions on String {
  String get capitalizeFirstLetter {
    // assert(length == 0, "Cannot apply $capitalizeFirstLetter with empty string");
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get initals {
    if (this.isEmpty) return this;
    final nameSplit = split(" ");
    final firstWord = nameSplit.first;
    final secondWord = nameSplit.length > 1 ? nameSplit[1] : "";

    return "${firstWord[0].toUpperCase()}${secondWord.isNotEmpty ? secondWord[0].toUpperCase() : ""}";
  }

  bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  bool get isURL => hasMatch(this,
      r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$");
}
