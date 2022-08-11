import 'package:flutter/material.dart';

class PuzzleCompleteDialog extends StatelessWidget {
  const PuzzleCompleteDialog({
    required this.resetBoardCb,
    Key? key,
  }) : super(key: key);

  final VoidCallback resetBoardCb;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('A winner is you!'),
      content: const Text('Goed hoor, heel knap!'),
      actions: [
        TextButton(
          onPressed: () {
            resetBoardCb();
            Navigator.of(context).pop();
          },
          child: const Text('Opnieuw!'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Hoezee!'),
        ),
      ],
    );
  }
}
