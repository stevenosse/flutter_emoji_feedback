import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_emoji_feedback/src/emoji.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef EmojiBuilder = Widget Function(int, EmojiModel, bool);

/// A fully customizable widget to receive feedback from your users.
/// Can be used to get user's mood or evaluate experience (and more !)
///
/// The widget is a row of emojis. Each emoji is a `SvgPicture` widget.
/// The `EmojiBuilder` function is used to build the emoji.
///
/// The `EmojiBuilder` function takes 3 parameters:
/// - `index`: The index of the emoji in the `emojiPreset` list
/// - `emoji`: The emoji model
/// - `isActive`: Whether the emoji is active or not
///
/// The `emojiPreset` list can be customized with the `EmojiModel` class.
/// If you wish to use custom labels, you can use the `customLabels` attribute
class EmojiFeedback extends StatefulWidget {
  const EmojiFeedback({
    super.key,
    required this.onChanged,
    this.emojiPreset = notoAnimatedEmojis,
    this.presetBuilder,
    this.showLabel = true,
    this.labelTextStyle,
    this.animDuration = const Duration(milliseconds: 150),
    this.customLabels,
    this.inactiveElementBlendColor,
    this.inactiveElementScale = 0.7,
    this.elementSize,
    this.curve = Curves.linear,
    this.spaceBetweenItems = 10,
    this.labelPadding = const EdgeInsets.only(top: 5.0),
    this.enableFeedback = false,
    this.minRating = 1,
    this.maxRating = 5,
    this.onChangeWaitForAnimation = false,
  })  : assert(minRating <= maxRating && maxRating <= emojiPreset.length),
        assert(
            customLabels == null || customLabels.length == emojiPreset.length,
            'emojiPreset and customLabels should have the same length');

  /// Function called when an item is selected.
  /// Values goes from 1 to `preset.length`
  ///
  /// For the classicEmojiPresset, which length is 5, the values will go from 0 to 5
  final ValueChanged<int?>? onChanged;

  /// List of emojis
  /// Defaults to `classicEmojiPreset`
  ///
  /// Available presets: `classicEmojiPreset`, `flatEmojiPreset`, `threeDEmojiPreset`
  ///
  /// You can create your own presets with the `EmojiModel` class.
  /// If you wish to use custom labels, you can use the `customLabels` attribute
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
  ///
  /// Defaults to `TextStyle(fontSize: 12, color: Colors.black)`
  final TextStyle? labelTextStyle;

  /// Define your custom labels using this attribute.
  /// Useful if you wish to use the predefined emojis with custom labels
  final List<String>? customLabels;

  /// Custom blend color for inactive elements
  /// Defaults to `Colors.grey`
  final Color? inactiveElementBlendColor;

  /// Scale factor of inactiveElements
  /// Range from `0.0` to `1.0`
  /// Defaults to `0.7`
  final double inactiveElementScale;

  /// Space between items
  /// Defaults to `10.0`
  final double spaceBetweenItems;

  /// Size of emoji elements
  /// Default value is calculated so each element occupate the same amount of space
  ///
  /// Formula: `(maxWidth / emojiCount) - spaceBetweenItems`
  final double? elementSize;

  /// Label padding
  /// Defaults to `EdgeInsets.only(top: 5.0)`
  final EdgeInsetsGeometry labelPadding;

  /// Scale animation curve
  /// Defaults to `Curves.linear`
  ///
  /// See [Curves](https://api.flutter.dev/flutter/animation/Curves-class.html)
  final Curve curve;

  /// Enable haptic feedback
  /// Defaults to `false`
  final bool enableFeedback;

  /// Minimum rating
  /// Defaults to `1`
  final int minRating;

  /// Maximum rating
  /// Defaults to `5`
  final int maxRating;

  /// If true, the onChange callback will be called after the animation is completed.
  /// If false, the onChange callback will be called immediately.
  final bool onChangeWaitForAnimation;

  @override
  State<EmojiFeedback> createState() => _EmojiFeedbackStatefulState();
}

class _EmojiFeedbackStatefulState extends State<EmojiFeedback> {
  int? rating;

  @override
  void initState() {
    super.initState();
    rating = widget.minRating;
  }

  void _handleTap(int index) {
    widget.onChanged?.call(rating);

    if (widget.enableFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double elementSize = widget.elementSize ??
            (constraints.maxWidth / widget.emojiPreset.length) -
                widget.spaceBetweenItems;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.emojiPreset
              .take(widget.maxRating - widget.minRating + 1)
              .mapIndexed((index, element) => EmojiItem(
                    emoji: element,
                    index: index,
                    isActive: rating == index + widget.minRating,
                    onTap: _handleTap,
                    builder: widget.presetBuilder,
                    showLabel: widget.showLabel,
                    labelTextStyle: widget.labelTextStyle,
                    customLabel: widget.customLabels?.elementAt(index),
                    inactiveElementBlendColor: widget.inactiveElementBlendColor,
                    inactiveElementScale: widget.inactiveElementScale,
                    elementSize: elementSize,
                    labelPadding: widget.labelPadding,
                    animDuration: widget.animDuration,
                    curve: widget.curve,
                    onChangeWaitForAnimation: widget.onChangeWaitForAnimation,
                    onSelected: () {
                      setState(() {
                        rating = index + widget.minRating;
                      });
                    },
                  ))
              .toList(),
        );
      },
    );
  }
}
