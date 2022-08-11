import 'package:collection/collection.dart';

List<int> calculateDescDiagonal(int queen) {
  final firstColumn = [for (var i = 1; i <= 64; i += 8) i];
  final lastColumn = [for (var i = 8; i <= 64; i += 8) i];

  /// Start by finding the starting point of the descending diagonal, and
  /// calculate all fields from this starting point up to the queen.
  /// Note that any queen placed left of the main diagonal (1 to 64) has its
  /// starting point in the first column, whereas any queen placed right of this
  /// main diagonal, has its starting point in the first row.

  /// smallerFields stores the correct list for any queen right of the main
  /// diagonal without needing to remove any values
  List<int> smallerFields = [for (var i = queen; i >= 1; i -= 9) i];

  /// To fix any overflow for queens left of the main diagonal, we find where
  /// the diagonal crosses the first column, and remove all values up to this
  /// point
  final firstColumnValue =
      smallerFields.firstWhereOrNull((field) => firstColumn.contains(field));

  if (firstColumnValue != null) {
    smallerFields.removeWhere((field) => field < firstColumnValue);
  }

  /// Now to find the final field of the descending diagonal, and then
  /// calculating all the fields between this final field and the queen.
  /// Note that any queen placed left of the main diagonal has its ending point
  /// in the final row, whereas any queen placed right of the main diagonal has
  /// its ending point in the final column.

  /// largerFields stores the correct list for any queen left of the main
  /// diagonal without needing to remove any values
  List<int> largerFields = [for (var i = queen; i <= 64; i += 9) i];

  final lastColumnValue =
      largerFields.firstWhereOrNull((field) => lastColumn.contains(field));

  /// Fix overflow for queens right of the main diagonal by removing any values
  /// that exceed this diagonal's value in the last column
  if (lastColumnValue != null) {
    largerFields.removeWhere((field) => field > lastColumnValue);
  }

  /// Remove the queen's index from both lists
  smallerFields.remove(queen);
  largerFields.remove(queen);

  return (smallerFields + largerFields)..sort();
}
