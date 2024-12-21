import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';

abstract class EmojiPreset {
  final List<EmojiModel> emojis;

  const EmojiPreset(this.emojis);
}