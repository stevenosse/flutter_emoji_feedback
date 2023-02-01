import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef PresetBuilder = Widget Function(int, EmojiModel);

class EmojiFeedback extends StatefulWidget {
  EmojiFeedback({
    Key? key,
    this.onChanged,
    this.preset = classicEmojiPreset,
    this.presetBuilder,
    this.showLabel = true,
    this.labelTextStyle,
    this.animDuration = const Duration(milliseconds: 150),
  })  : assert(preset.isNotEmpty),
        super(key: key);

  /// Function called when an item is selected.
  /// Values goes from 1 to `preset.length` 
  /// 
  /// For the classicEmojiPresset, which length is 5, the values will go from 0 to 5
  final ValueChanged<int>? onChanged;

  /// List of emojis
  /// Defaults to `classicEmojiPreset`
  final List<EmojiModel> preset;

  /// Duration of the scale animation
  /// Defaults to `const Duration(milliseconds: 150)`
  final Duration animDuration;

  /// Custom emoji widget builder
  final PresetBuilder? presetBuilder;

  /// Wether the label should be displayed or not
  /// Defaults to `true`
  final bool showLabel;

  /// Style of the emoji label
  final TextStyle? labelTextStyle;

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
        const double inactiveElementScale = .7;
        final double elementSize = (constraints.maxWidth / widget.preset.length) - spaceBetween;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.from(
            widget.preset.mapIndexed(widget.presetBuilder ??
                (index, element) {
                  final isItemActive = activeItemIndex == index;

                  final child = SvgPicture.asset(
                    element.src,
                    width: elementSize,
                    package: element.package,
                    colorBlendMode: isItemActive ? BlendMode.saturation : BlendMode.srcIn,
                  );

                  return AnimatedScale(
                    scale: isItemActive ? 1 : inactiveElementScale,
                    duration: widget.animDuration,
                    child: Column(
                      children: [
                        isItemActive
                            ? child
                            : GestureDetector(
                                onTap: () {
                                  setActiveItem(index);
                                },
                                child: Container(
                                  foregroundDecoration: const BoxDecoration(
                                    color: Colors.grey,
                                    backgroundBlendMode: BlendMode.saturation,
                                  ),
                                  child: child,
                                ),
                              ),
                        if (widget.showLabel) ...[
                          const SizedBox(height: 5.0),
                          Text(element.label, style: widget.labelTextStyle),
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
