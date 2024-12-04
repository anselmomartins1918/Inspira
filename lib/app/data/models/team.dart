class Team {
  final String name;
  final double total;

  Team({required this.name, required this.total});

  @override
  String toString() {
    return 'Avaluation(team: $name, total: $total)';
  }
}
