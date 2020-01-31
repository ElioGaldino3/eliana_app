class PortugueseLocale {
  final DateTime date;

  PortugueseLocale(this.date);

  String formatDay() {
    if (date.day < 10) {
      return "0${date.day}";
    }else {
      return date.day.toString();
    }
  }

  String formatMounth() {
    switch (date.month) {
      case 1:
        return "Janeiro";
        break;
      case 2:
        return "Fevereiro";
        break;
      case 3:
        return "Março";
        break;
      case 4:
        return "Abril";
        break;
      case 5:
        return "Maio";
        break;
      case 6:
        return "Junho";
        break;
      case 7:
        return "Julho";
        break;
      case 8:
        return "Agosto";
        break;
      case 9:
        return "Setembro";
        break;
      case 10:
        return "Outubro";
        break;
      case 11:
        return "Novembro";
        break;
      case 12:
        return "Dezembro";
        break;
    }
  }

  String getDate() {
    return formatDay()+" de "+formatMounth()+" de "+date.year.toString();
  }
}
