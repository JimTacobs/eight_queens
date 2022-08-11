import 'package:eight_queens_puzzle/ui/screens/chessboard/widgets/chessboard_widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/models/models.dart';
import '../../../util/state/state.dart';

class ChessboardScreen extends StatefulWidget {
  const ChessboardScreen({Key? key}) : super(key: key);

  @override
  State<ChessboardScreen> createState() => _ChessboardScreenState();
}

class _ChessboardScreenState extends State<ChessboardScreen> {
  List<int> threatenedFields = [];
  List<int> queenLocations = [];
  List<Queen> queens = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    int row = 1;

    void setQueenCallback(int newQueen) {
      setState(() {
        queens.add(calculateFields(newQueen));
        threatenedFields = (threatenedFields + queens.last.threatenedFields)
          ..sort();
        queenLocations.add(newQueen);
      });
    }

    void removeQueenCallback(int placedQueen) {
      setState(() {
        queenLocations.remove(placedQueen);
      });
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .02,
          vertical: height * .03,
        ),
        child: GridView.count(
          crossAxisCount: 8,
          children: List.generate(
            64,
            (i) {
              /// The first tile of every new row is always the opposite of
              /// the first tile of the previous row.
              /// This is achieved by keeping track of the current row in the
              /// iteration, and changing the color of the first tile of the
              /// row based on the row being odd or even.

              if (i % 8 == 0) {
                row = i ~/ 8 + 1;
              }

              final lightTile =
                  row.isOdd && i % 2 == 0 || row.isEven && i % 2 != 0;
              final tileNumber = i + 1;

              return Field(
                color: lightTile
                    ? const Color(0xffF1D9B5)
                    : const Color(0xffB58965),
                tileNumber: tileNumber,
                hasQueen: queenLocations.contains(tileNumber),
                setQueenCb: setQueenCallback,
                removeQueenCb: removeQueenCallback,
              );
            },
          ),
        ),
      ),
    );
  }
}
