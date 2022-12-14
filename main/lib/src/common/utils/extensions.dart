extension StringExt on String? {
  String orEmpty() {
    return this ?? "";
  }

  String unescape() {
    return orEmpty()
        .replaceAll(r"\'''", r"'''")
        .replaceAll(r"\\", r"\")
        .replaceAll(r"[\r\n'\\]", "");
  }

  String toCapitalized() => orEmpty().isNotEmpty
      ? '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}'
      : '';

  String toTitleCase() => orEmpty()
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  String toSingleStringWithComa() {
    return (this ?? "").replaceAll('[', '').replaceAll(']', '');
  }
}

extension NumExt on num? {
  num orZero() {
    return this ?? 0;
  }

  num byteToKb() {
    if (this == null) {
      return 0;
    } else {
      return (this!.toDouble() / 1024);
    }
  }

  num byteToMb() {
    if (this == null) {
      return 0;
    } else {
      return (this!.byteToKb() / 1024);
    }
  }

  String roundByteToMb() {
    return byteToMb().toStringAsFixed(2);
  }

  String roundByteToKb() {
    return byteToKb().toStringAsFixed(2);
  }
}

extension BoolExt on bool? {
  bool orFalse() {
    return this ?? false;
  }
}
