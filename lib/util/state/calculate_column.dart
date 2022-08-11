List<int> calculateColumn(int queen) {
  final firstFieldOfColumn = queen % 8 == 0 ? queen ~/ 8 : queen % 8;

  return [for (var i = firstFieldOfColumn; i <= 64; i += 8) i]..remove(queen);
}
