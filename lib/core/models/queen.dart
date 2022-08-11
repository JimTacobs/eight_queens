import 'package:eight_queens_puzzle/core/enums/enums.dart';

class Queen {
  const Queen({
    required this.location,
    required this.threatenedFields,
    required this.directions,
  });

  final int location;
  /// I keep a separate list of threatenedFields to remove the need to loop
  /// through all 4 directions every time you want to figure out whether this
  /// particular queen threatens the currently selected field.
  final List<int> threatenedFields;
  final List<Map<Directions, List<int>>> directions;
}
