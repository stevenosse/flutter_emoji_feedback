import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:flutter_emoji_feedback/gen/assets.gen.dart';

// Classic emoji preset
const classicEmojiPreset = StaticEmojiPreset([
  EmojiModel(
    src: Assets.classicTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.classicBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.classicGood,
    label: 'Good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.classicVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.classicAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
]);

const handDrawnEmojiPreset = StaticEmojiPreset([
  EmojiModel(
    src: Assets.hdTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.hdBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.hdGood,
    label: 'Good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.hdVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.hdAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
]);

const flatEmojiPreset = StaticEmojiPreset([
  EmojiModel(
    src: Assets.flatTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.flatBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.flatGood,
    label: 'Good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.flatVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.flatAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
]);

const threeDEmojiPreset = StaticEmojiPreset([
  EmojiModel(
    src: Assets.threeDTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.threeDBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.threeDGood,
    label: 'Good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.threeDVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.threeDAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
]);

const notoEmojis = StaticEmojiPreset([
  EmojiModel(
    src: Assets.notoTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.notoBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.notoNeutral,
    label: 'Ok',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.notoVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.notoAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
]);

const AnimatedEmojiPreset notoAnimatedEmojis = AnimatedEmojiPreset(emojis: [
  EmojiModel(
    src: Assets.animatedTerrible,
    label: 'Terrible',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.animatedBad,
    label: 'Bad',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.animatedNeutral,
    label: 'Ok',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.animatedVeryGood,
    label: 'Very good',
    package: 'flutter_emoji_feedback',
  ),
  EmojiModel(
    src: Assets.animatedAwesome,
    label: 'Awesome',
    package: 'flutter_emoji_feedback',
  ),
], idleEmojis: notoEmojis);
