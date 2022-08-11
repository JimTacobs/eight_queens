import '../../core/models/models.dart';

List<int> calculateConflictedFields(List<Queen> queens, int invalidQueen) {
  /// The index of the invalidQueen can be found in the threatenedFields of one
  /// or more queens.
  final attackingQueens = queens
      .where((queen) => queen.threatenedFields.contains(invalidQueen))
      .toList();

  /// Get the index of every attacking queen.
  final attackingQueensIndexes = [];
  for (final queen in attackingQueens) {
    attackingQueensIndexes.add(queen.location);
  }

  /// Calculate the direction
  List<int> attackedFieldsInBetween = [];
  for (final queen in attackingQueensIndexes) {
    final sameRow = (queen / 8).ceil() == (invalidQueen / 8).ceil();
    final sameColumn = queen % 8 == invalidQueen % 8;
    final descDiagonal = (queen - invalidQueen).abs() % 9 == 0;
    final ascDiagonal = !sameRow && !descDiagonal && !sameColumn;

    final invalidQueenHasLowerIndex = queen > invalidQueen;
    final floor = invalidQueenHasLowerIndex ? invalidQueen : queen;
    final ceil = invalidQueenHasLowerIndex ? queen : invalidQueen;

    if (sameRow) {
      attackedFieldsInBetween =
          attackedFieldsInBetween + [for (var i = floor + 1; i < ceil; i++) i];
    }

    if (sameColumn) {
      attackedFieldsInBetween = attackedFieldsInBetween +
          [for (var i = floor + 8; i < ceil; i += 8) i];
    }

    if (descDiagonal) {
      attackedFieldsInBetween = attackedFieldsInBetween +
          [for (var i = floor + 9; i < ceil; i += 9) i];
    }

    if (ascDiagonal) {
      attackedFieldsInBetween = attackedFieldsInBetween +
          [for (var i = floor + 7; i < ceil; i += 7) i];
    }
  }

  return [invalidQueen, ...attackingQueensIndexes, ...attackedFieldsInBetween];
}
