class Utils {
  static bool validateAccessCode(String code) {
    bool result = false;
    try {
      if (1 <= int.parse(code) && int.parse(code) <= 10) {
        result = true;
      }
    } catch (e) {
      print(e.toString());
      result = false;
    }
    return result;
  }
}