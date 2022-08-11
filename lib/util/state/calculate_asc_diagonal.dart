import 'package:collection/collection.dart';

List<int> calculateAscDiagonal(int queen) {
  final firstColumn = [for (var i = 1; i <= 64; i += 8) i];
  final lastColumn = [for (var i = 8; i <= 64; i += 8) i];

  /// Calculating the ascending diagonals works much the same as the descending
  /// diagonal, with some flipped logic and a main diagonal from 8 to 57.

  /// smallerFields stores the correct list for any queen left of the main
  /// diagonal.
  List<int> smallerFields = [for (var i = queen; i >= 1; i -= 7) i];

  /// To fix any overflow for queens right of the main diagonal, we find where
  /// the diagonal crosses the last column and remove all values up to this
  /// point.
  final lastColumnValue =
      smallerFields.firstWhereOrNull((field) => lastColumn.contains(field));

  if (lastColumnValue != null) {
    smallerFields.removeWhere((field) => field < lastColumnValue);
  }

  /// largerFields stores the correct list for any queen right of the main
  /// diagonal
  List<int> largerFields = [for (var i = queen; i <= 64; i += 7) i];

  /// Fix overflow for queens left of the main diagonal by removing any values
  /// that exceed this diagonal's value in the first column.
  final firstColumnValue =
      largerFields.firstWhereOrNull((field) => firstColumn.contains(field));

  if (firstColumnValue != null) {
    largerFields.removeWhere((field) => field > firstColumnValue);
  }

  /// Remove the queen's index from both lists
  smallerFields.remove(queen);
  largerFields.remove(queen);

  return (smallerFields + largerFields)..sort();
}
