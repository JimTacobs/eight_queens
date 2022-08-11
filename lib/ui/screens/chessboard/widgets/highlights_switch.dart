import 'package:flutter/material.dart';

class HighlightsSwitch extends StatelessWidget {
  const HighlightsSwitch({
    required this.highlightFields,
    required this.toggleCb,
    Key? key,
  }) : super(key: key);

  final bool highlightFields;
  final void Function(bool) toggleCb;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Highlight threatened fields'),
          Switch(
            value: highlightFields,
            onChanged: (val) {
              toggleCb(val);
            },
          ),
        ],
      ),
    );
  }
}
