import 'package:flutter/material.dart';

import '../utils/enums.dart';
import '../utils/static_functions.dart';

class ExpandableText extends StatefulWidget {
  String text;
  String expandedText;
  String collapsedText;
  int maxLines;
  TextStyle textStyle;
  TextStyle? readMoreStyle;

  ExpandableText(
      {Key? key,
      required this.text,
      required this.maxLines,
      required this.textStyle,
      required this.collapsedText,
      required this.expandedText,
      this.readMoreStyle})
      : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final text = widget.text;
        final textStyle = widget.textStyle;
        final readMoreTextStyle = widget.readMoreStyle == null
            ? textStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: StaticFunctions.getColor(
                  context,
                  ColorEnum.themeColor,
                ),
              )
            : widget.readMoreStyle;
        final span = TextSpan(
          text: text,
          style: textStyle,
        );
        var tp = TextPainter(
            text: span,
            textDirection: TextDirection.ltr,
            maxLines: widget.maxLines);
        tp.layout(maxWidth: constraints.maxWidth, minWidth: 0);
        if (tp.didExceedMaxLines) {
          return Wrap(
            alignment: WrapAlignment.start,
            direction: Axis.horizontal,
            children: [
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                crossFadeState: !_isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstCurve: Curves.easeIn,
                secondCurve: Curves.easeOutExpo,
                firstChild: Text(
                  text,
                  style: textStyle,
                  maxLines: widget.maxLines,
                ),
                secondChild: Text(
                  text,
                  style: textStyle,
                ),
              ),
              InkWell(
                onTap: () => setState(() {
                  _isExpanded = !_isExpanded;
                }),
                child: Text(
                  _isExpanded ? widget.expandedText : widget.collapsedText,
                  style: readMoreTextStyle,
                ),
              )
            ],
          );
        } else {
          return Text(
            text,
            style: textStyle,
          );
        }
      },
    );
  }
}
