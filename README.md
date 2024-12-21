# flutter_emoji_feedback 
[![pub package](https://img.shields.io/pub/v/flutter_emoji_feedback.svg)](https://pub.dartlang.org/packages/flutter_emoji_feedback)
[![GitHub CI](https://github.com/stevenosse/flutter_emoji_feedback/actions/workflows/test.yml/badge.svg)](https://github.com/stevenosse/flutter_emoji_feedback/actions)

A fully customizable widget to receive feedback from your users. Useful to get  the user's mood, evaluate their experience, and more!

<div align="center">
<img src="https://github.com/stevenosse/flutter_emoji_feedback/blob/main/demo.gif" style="border-radius: 15px;"/>
</div>

## 📺 What's new?
You can now use animated lottie files (json files only) for emoji presets, or the provided [`notoAnimatedEmojis`](https://googlefonts.github.io/noto-emoji-animation/) preset. (see [#3](https://github.com/stevenosse/flutter_emoji_feedback/pull/3))

### ⚠️ Breaking changes
- `rating` is now no longer needed, the package handles that internally. If you need to set an intial rating, see [Parameters](#parameters).
- Presets must be defined as either a `StaticEmojiPreset` or a `AnimatedEmojiPreset`, see [Defining Presets](#-defining-presets)

## 🚀 Getting started
### Install from pub

```shell
flutter pub add flutter_emoji_feedback
```

## 📔 Usage 

Import `flutter_emoji_feedback`:

```dart
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
```

```dart
EmojiFeedback(
  initialRating: 4, // Set to null (default) for no initial rating
  animDuration: const Duration(milliseconds: 300), // Duration of the animation
  curve: Curves.bounceIn, // Curve of the animation
  inactiveElementScale: .5, // Scale of the inactive element
  onChanged: (value) {
    // Callback when the user change the value of the emoji
  },
  onChangeWaitForAnimation: true, // Wait for the animation of the emoji to complete before calling `#onChanged`
  // Other parameters
);
```

### Parameters
| Parameter name | Description | Type |
| --- | --- | --- |
| `onChangeWaitForAnimation` | If true, the emoji's animation will finish before calling `#onChange`  | `bool` |
| `initialRating` | Sets the initial rating, if null, there will be no initial rating | `int?` |
| `tapScale` | The scale for when the user holds down the emoji, set to `inactiveElementScale` for none | `double` |
| `animDuration` | Duration of the animation | `Duration` |
| `curve` | Curve of the animation | `Curve` |
| `inactiveElementScale` | Scale of the inactive element | `double` |
| `onChanged` | Function called when an item is selected. Values goes from 1 to `preset.length` | `ValueChanged<int?>?` |
| `emojiPreset` | List of emojis. Available presets: `classicEmojiPreset`, `flatEmojiPreset`, `threeDEmojiPreset`, `notoAnimatedEmojis`, `notoEmojis`. You can create your own presets, see [Defining Presets](#-defining-presets). | `EmojiPreset` |
| `presetBuilder` | Custom emoji widget builder | `EmojiBuilder?` |
| `showLabel` | Whether the label should be displayed or not | `bool` |
| `labelTextStyle` | Style of the emoji label | `TextStyle?` |
| `customLabels` | Define your custom labels. Useful if you wish to use the predefined emojis with custom labels | `List<String>?` |
| `inactiveElementBlendColor` | Custom blend color for inactive elements | `Color?` |
| `spaceBetweenItems` | Space between items | `double` |
| `elementSize` | Size of emoji elements | `double?` |
| `labelPadding` | Label padding | `EdgeInsetsGeometry` |
| `enableFeedback` | Enable haptic feedback | `bool` |
| `minRating` | Minimum rating | `int` |
| `maxRating` | Maximum rating | `int` |
| `onChangeWaitForAnimation` | If true, the onChange callback will be called after the animation is completed | `bool` |

### 🎨 Defining presets
You can easily create presets using the [`StaticEmojiPreset`](./lib/src/models/preset.dart) and [`AnimatedEmojiPreset`](./lib/src/models/preset.dart), which hold the emojis.

```dart
// Defining a static emoji preset using SVG files
// Replace the `image` with your SVG file path
const myStaticEmojiPreset = StaticEmojiPreset([
  StaticEmoji(
    image: 'assets/images/emoji1.svg',
    value: 1,
  ),
  StaticEmoji(
    image: 'assets/images/emoji2.svg',
    value: 2,
  ),
  StaticEmoji(
    image: 'assets/images/emoji3.svg',
    value: 3,
  ),
  StaticEmoji(
    image: 'assets/images/emoji4.svg',
    value: 4,
  ),
  StaticEmoji(
    image: 'assets/images/emoji5.svg',
    value: 5,
  ),
]);

// Defining an animated emoji preset using Lottie files
// Replace the `animation` with the path to your Lottie file
const myAnimatedEmojiPreset = AnimatedEmojiPreset([
  AnimatedEmoji(
    animation: 'assets/animations/emoji1.json',
    value: 1
  ),
  AnimatedEmoji(
    animation: 'assets/animations/emoji2.json',
    value: 2
  ),
  AnimatedEmoji(
    animation: 'assets/animations/emoji3.json',
    value: 3
  ),
  AnimatedEmoji(
    animation: 'assets/animations/emoji4.json',
    value: 4
  ),
  AnimatedEmoji(
    animation: 'assets/animations/emoji5.json',
    value: 5,
  ),
]);
```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## 📄 Changelog

See [CHANGELOG.md](CHANGELOG.md) for details.

## 📄 Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 Contributors

- [@stevenosse](https://github.com/stevenosse)
- [@Turtlepaw](https://github.com/Turtlepaw)

## 📄 Acknowledgments

- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [collection](https://pub.dev/packages/collection)
- [lottie](https://pub.dev/packages/lottie)

## Attribution
This project uses [Animated Noto Emoji](https://github.com/googlefonts/noto-emoji), which is licensed under the [Creative Commons Attribution 4.0 International License (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

© Google LLC. Licensed under CC BY 4.0.

<img src="./assets/noto_awesome.svg" width="50"/> <img src="./assets/noto_good.svg" width="50"/> <img src="./assets/noto_bad.svg" width="50"/> <img src="./assets/noto_terrible.svg" width="50"/>

## Sponsor
If you find this project useful, you can [sponsor me](https://github.com/sponsors/stevenosse). 

Or you can

<a href="https://www.buymeacoffee.com/iamsnosse" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>