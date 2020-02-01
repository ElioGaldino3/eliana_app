class DateFormatPortuguese {
  static getString(DateTime date) {
    String day;
    String month;
    String year = date.year.toString();
    if (date.day <= 9)
      day = "0${date.day}";
    else
      day = date.day.toString();

    switch (date.month) {
      case 1:
        month = "Janeiro";
        break;
      case 2:
        month = "Fevereiro";
        break;
      case 3:
        month = "Março";
        break;
      case 4:
        month = "Abril";
        break;
      case 5:
        month = "Maio";
        break;
      case 6:
        month = "Junho";
        break;
      case 7:
        month = "Julho";
        break;
      case 8:
        month = "Agosto";
        break;
      case 9:
        month = "Setembro";
        break;
      case 10:
        month = "Outubro";
        break;
      case 11:
        month = "Novembro";
        break;
      default:
        month = "Dezembro";
        break;
    }



    return "$day de $month de $year";
  }
}
