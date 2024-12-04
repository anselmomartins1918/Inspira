double truncateDouble(double total) {
  double value = total / 3;
  return (value * 100).truncateToDouble() / 100;
}
