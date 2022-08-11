import 'package:eight_queens_puzzle/util/state/state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculate ', () {
    test(
        'row should include all indexes of that row, excluding the given argument', () {
      expect(calculateRow(3), [1, 2, 4, 5, 6, 7, 8]);
      expect(calculateRow(38), [33, 34, 35, 36, 37, 39, 40]);
      expect(calculateRow(62), [57, 58, 59, 60, 61, 63, 64]);
    });

    test(
        'column should include all indexes of that column, excluding the given argument', () {
      expect(calculateColumn(4), [12, 20, 28, 36, 44, 52, 60]);
      expect(calculateColumn(24), [8, 16, 32, 40, 48, 56, 64]);
      expect(calculateColumn(57), [1, 9, 17, 25, 33, 41, 49]);
    });

    test(
        'descending diagonal should include all indexes of that diagonal, excluding the given argument', () {
      expect(calculateDescDiagonal(8), []);
      expect(calculateDescDiagonal(57), []);
      expect(calculateDescDiagonal(10), [1, 19, 28, 37, 46, 55, 64]);
      expect(calculateDescDiagonal(14), [5, 23, 32]);
      expect(calculateDescDiagonal(44), [17, 26, 35, 53, 62]);
    });

    test('ascending diagonal should include all indexes of that diagonal, excluding the given argument', () {
      expect(calculateAscDiagonal(1), []);
      expect(calculateAscDiagonal(64), []);
      expect(calculateAscDiagonal(50), [8, 15, 22, 29, 36, 43, 57]);
      expect(calculateAscDiagonal(21), [7, 14, 28, 35, 42, 49]);
      expect(calculateAscDiagonal(46), [32, 39, 53, 60]);
    });
  });
}