import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class EmojiItem extends StatefulWidget {
  const EmojiItem(
      {super.key,
      required this.emoji,
      required this.index,
      required this.isActive,
      required this.onTap,
      this.builder,
      required this.showLabel,
      this.labelTextStyle,
      this.customLabel,
      this.inactiveElementBlendColor,
      required this.inactiveElementScale,
      required this.elementSize,
      required this.labelPadding,
      required this.animDuration,
      required this.curve,
      required this.onChangeWaitForAnimation,
      required this.onSelected,
      required this.idleEmoji,
      required this.tapScale});

  final EmojiModel emoji;
  final int index;
  final bool isActive;
  final ValueChanged<int> onTap;
  final EmojiBuilder? builder;
  final bool showLabel;
  final TextStyle? labelTextStyle;
  final String? customLabel;
  final Color? inactiveElementBlendColor;
  final double inactiveElementScale;
  final double elementSize;
  final EdgeInsetsGeometry labelPadding;
  final Duration animDuration;
  final Curve curve;
  final bool onChangeWaitForAnimation;
  final VoidCallback onSelected;
  final EmojiModel? idleEmoji;
  final double tapScale;

  @override
  State<StatefulWidget> createState() => _EmojiItemState();
}

class _EmojiItemState extends State<EmojiItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Duration? _animationDuration;
  bool _isTapped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    if (widget.emoji.src.endsWith(".json")) {
      _initializeAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeAnimation() async {
    if (widget.emoji.src.endsWith(".json")) {
      await Future.delayed(Duration.zero); // Wait for the widget to load
      final composition =
          await AssetLottie(widget.emoji.src, package: widget.emoji.package)
              .load();
      setState(() {
        _animationDuration = composition.duration;
        _controller.duration = composition.duration;
      });
    }
  }

  Future<void> _playAnimation() async {
    if (_animationDuration != null) {
      _controller.reset();
      await _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant EmojiItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.isActive && !oldWidget.isActive) {
    //   _initializeAnimation().then((_) => _playAnimation());
    // } else
    if (!widget.isActive && oldWidget.isActive) {
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    var child =
        widget.builder?.call(widget.index, widget.emoji, widget.isActive) ??
            (widget.emoji.src.endsWith(".json")
                ? Lottie.asset(
                    widget.emoji.src,
                    width: widget.elementSize,
                    package: widget.emoji.package,
                    controller: _controller,
                  )
                : SvgPicture.asset(
                    widget.emoji.src,
                    width: widget.elementSize,
                    package: widget.emoji.package,
                  ));

    final idleEmoji = widget.idleEmoji;
    if (idleEmoji != null && widget.isActive) {
      child = Lottie.asset(
        widget.emoji.src,
        width: widget.elementSize,
        package: widget.emoji.package,
        controller: _controller,
      );
    } else if (idleEmoji != null) {
      child = SvgPicture.asset(
        idleEmoji.src,
        width: widget.elementSize,
        package: idleEmoji.package,
      );
    }

    return AnimatedScale(
      scale: (widget.isActive
          ? 1
          : (_isTapped ? widget.tapScale : widget.inactiveElementScale)),
      duration: widget.animDuration,
      curve: widget.curve,
      child: Column(
        children: [
          GestureDetector(
            onTapDown: (details) {
              setState(() {
                _isTapped = true;
              });
            },
            onTapUp: (details) {
              setState(() {
                _isTapped = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isTapped = false;
              });
            },
            onTap: () async {
              widget.onSelected();

              // Initialize the animation regardless of the mode.
              await _initializeAnimation();

              // Check animation mode and play accordingly.
              if (widget.onChangeWaitForAnimation) {
                await _playAnimation(); // Wait for animation to complete.
              } else {
                _playAnimation(); // Play animation without waiting.
              }

              // Trigger the onTap callback after animation logic.
              widget.onTap(widget.index);
            },
            child: widget.isActive
                ? child
                : Container(
                    foregroundDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.inactiveElementBlendColor ?? Colors.grey,
                      backgroundBlendMode: BlendMode.saturation,
                    ),
                    child: child,
                  ),
          ),
          if (widget.showLabel)
            Padding(
              padding: widget.labelPadding,
              child: Text(
                widget.customLabel ?? widget.emoji.label,
                style: widget.labelTextStyle,
              ),
            ),
        ],
      ),
    );
  }
}
