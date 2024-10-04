class Team {
  final String name;
  final int total;

  Team({required this.name, required this.total});

  @override
  String toString() {
    return 'Avaluation(team: $name, total: $total)';
  }
}
