import 'dart:convert';
import "dart:developer" as dev;

class AppLogs {
  void printJson(dynamic jsonData) {
    if (jsonData == null) {
      print("Os dados JSON são nulos");
      dev.log("Os dados JSON são nulos");
      return;
    }

    try {
      final jsonString = jsonEncode(jsonData);
      print(jsonString);
      dev.log(jsonString);
    } catch (e) {
      print("Erro ao converter dados para JSON: ${e.toString()}");
      dev.log("Erro ao converter dados para JSON: ${e.toString()}");
    }
  }

  void error(String message, [StackTrace? stacktrace]) {
    print("❌ ERROR: $message");
    if (stacktrace != null) {
      print("🔍 Stacktrace: $stacktrace");
    }
  }

  void info(String message) {
    print("==>Info: $message");
  }
}
