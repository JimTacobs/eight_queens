import 'package:eight_queens_puzzle/core/enums/enums.dart';
import 'package:eight_queens_puzzle/util/state/state.dart';

import '../../core/models/models.dart';

Queen calculateFields(int queen) {
  List<int> horizontal;
  List<int> vertical;
  List<int> diagonalDescending;
  List<int> diagonalAscending;
  List<int> threatenedFields = [];

  horizontal = calculateRow(queen);
  vertical = calculateColumn(queen);
  diagonalDescending = calculateDescDiagonal(queen);
  diagonalAscending = calculateAscDiagonal(queen);

  threatenedFields =
      (horizontal + vertical + diagonalAscending + diagonalDescending)..sort();

  return Queen(
    location: queen,
    threatenedFields: threatenedFields,
    directions: [
      {Directions.horizontal: horizontal},
      {Directions.vertical: vertical},
      {Directions.diagonalAscending: diagonalAscending},
      {Directions.diagonalDescending: diagonalDescending},
    ],
  );
}
