import 'base.dart';
import 'emoji_model.dart';

class StaticEmojiPreset implements EmojiPreset {
  @override
  final List<EmojiModel> emojis;

  const StaticEmojiPreset(this.emojis);
}

class AnimatedEmojiPreset implements EmojiPreset {
  @override
  final List<EmojiModel> emojis;
  final StaticEmojiPreset? idleEmojis;

  const AnimatedEmojiPreset({required this.emojis, this.idleEmojis});
}
