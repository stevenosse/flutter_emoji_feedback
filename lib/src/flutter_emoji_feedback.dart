import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef EmojiBuilder = Widget Function(int, EmojiModel);

class EmojiFeedback extends StatefulWidget {
  EmojiFeedback({
    Key? key,
    this.onChanged,
    this.emojiPreset = classicEmojiPreset,
    this.presetBuilder,
    this.showLabel = true,
    this.labelTextStyle,
    this.animDuration = const Duration(milliseconds: 150),
    this.customLabels,
    this.inactiveElementBlendColor,
    this.inactiveElementScale,
    this.elementSize,
    this.curve,
  })  : assert(emojiPreset.isNotEmpty),
        assert(
          () {
            if (customLabels != null) {
              return customLabels.length == emojiPreset.length;
            }
            return true;
          }(),
          'Please, emojiPreset and customLabels should have the same length',
        ),
        super(key: key);

  /// Function called when an item is selected.
  /// Values goes from 1 to `preset.length`
  ///
  /// For the classicEmojiPresset, which length is 5, the values will go from 0 to 5
  final ValueChanged<int>? onChanged;

  /// List of emojis
  /// Defaults to `classicEmojiPreset`
  final List<EmojiModel> emojiPreset;

  /// Duration of the scale animation
  /// Defaults to `const Duration(milliseconds: 150)`
  final Duration animDuration;

  /// Custom emoji widget builder
  final EmojiBuilder? presetBuilder;

  /// Wether the label should be displayed or not
  /// Defaults to `true`
  final bool showLabel;

  /// Style of the emoji label
  final TextStyle? labelTextStyle;

  /// Define your custom labels using this attribute.
  /// Useful if you wish to use the predefined emojis with custom labels
  final List<String>? customLabels;

  /// Custom blend color for inactive elements
  /// Defaults to `Colors.grey`
  final Color? inactiveElementBlendColor;

  /// Scale factor of inactiveElements
  /// Defaults to `0.7`
  final double? inactiveElementScale;

  /// Size of emoji elements
  /// Default value is calculated so each element occupate the same amount of space
  /// Formula: `(maxWidth / emojiCount) - spaceBetweenItems`
  final double? elementSize;

  /// Scale animation curve
  final Curve? curve;

  @override
  State<EmojiFeedback> createState() => _EmojiFeedbackState();
}

class _EmojiFeedbackState extends State<EmojiFeedback> {
  int? activeItemIndex;

  setActiveItem(int index) {
    setState(() {
      activeItemIndex = index;
      widget.onChanged?.call(index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double spaceBetween = 10.0;
        final double inactiveElementScale = widget.inactiveElementScale ?? .7;
        final double elementSize =
            widget.elementSize ?? (constraints.maxWidth / widget.emojiPreset.length) - spaceBetween;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.from(
            widget.emojiPreset.mapIndexed(widget.presetBuilder ??
                (index, element) {
                  final isItemActive = activeItemIndex == index;

                  final child = SvgPicture.asset(
                    element.src,
                    width: elementSize,
                    package: element.package,
                  );

                  return AnimatedScale(
                    scale: isItemActive ? 1 : inactiveElementScale,
                    duration: widget.animDuration,
                    curve: widget.curve ?? Curves.linear,
                    child: Column(
                      children: [
                        isItemActive
                            ? child
                            : GestureDetector(
                                onTap: () {
                                  setActiveItem(index);
                                },
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                    color: widget.inactiveElementBlendColor ?? Colors.grey,
                                    backgroundBlendMode: BlendMode.saturation,
                                  ),
                                  child: child,
                                ),
                              ),
                        if (widget.showLabel) ...[
                          const SizedBox(height: 5.0),
                          Text(
                            widget.customLabels?.elementAt(index) ?? element.label,
                            style: widget.labelTextStyle,
                          ),
                        ]
                      ],
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
