  String formatDateToReadableString(DateTime date) {
    const months = [
      "JAN",
      "FEV",
      "MAR",
      "ABR",
      "MAI",
      "JUN",
      "JUL",
      "AGO",
      "SET",
      "OUT",
      "NOV",
      "DEZ"
    ];
    String day = date.day.toString().padLeft(2, '0');
    String month = months[date.month - 1];
    String year = date.year.toString();
    return "$day $month $year";
  }

