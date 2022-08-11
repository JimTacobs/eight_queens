List<int> calculateRow(int queen) {
  final row = (queen / 8).ceil();

  final finalFieldOfRow = row * 8;
  final firstFieldOfRow = finalFieldOfRow - 7;

  return [for (var i = firstFieldOfRow; i <= finalFieldOfRow; i++) i]
    ..remove(queen);
}
