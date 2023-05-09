extension IntExt on int {
  String spaceSeparateNumbers() {
    final result = toString().replaceAllMapped(
        RegExp(r'(\d{3})(?=(\d{4})+(?!\d))'), (Match m) => '${m[1]} ');
    return result;
  }
}
