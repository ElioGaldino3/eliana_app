class TimeToDeliver{

  static String timeToDeliver(DateTime date) {
  int diffHours = date.difference(DateTime.now()).inHours;
  int diffDay = date.difference(DateTime.now()).inDays;
  if (diffHours <= 0 && diffHours >= -24) {
    return "Entregar hoje!";
  } else if (diffHours < -24) {
    return "Entrega atrasada!";
  } else if (diffHours <= 24) {
    return "Entregar amanha!";
  } else {
    return "Falta ${diffDay + 1} dias para entregar!";
  }
}

}
