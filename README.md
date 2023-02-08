# flutter_emoji_feedback
A fully customizable widget to receive feedback from your users. Can be used to get user's mood or evaluate experience (and more !)

<div>
    <a title="pub.dev" href="https://pub.dartlang.org/packages/flutter_emoji_feedback" >
      <img src="https://img.shields.io/pub/v/flutter_emoji_feedback.svg?style=flat-square&include_prereleases&color=00C853" />
    </a>
    <a title="GitHub License" href="https://github.com/stevenosse/flutter_emoji_feedback/blob/master/LICENSE">
      <img src="https://img.shields.io/github/license/stevenosse/flutter_emoji_feedback?style=flat-square&color=f12253" />
    </a>
  </div>
  <br/>

![preview](https://github.com/stevenosse/flutter_emoji_feedback/blob/main/demo.gif?raw=true)

## ✨ Features

- Emoji rating
- Multi presets
- Fully customizable

## 🚀 Getting started

Install from pub
```shell
$ flutter pub add flutter_emoji_feedback
```

## 📔 Usage

Import flutter_emoji_feedback :
```dart
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
```

```dart
EmojiFeedback(
  animDuration: const Duration(milliseconds: 300),
  curve: Curves.bounceIn,
  inactiveElementScale: .5,
  onChanged: (value) {
    print(value);
  },
)
```

# Contribute
Feel free to [file an issue](https://github.com/stevenosse/flutter_emoji_feedback/issues/new)

If you find a problem or [make pull requests](https://github.com/stevenosse/flutter_emoji_feedback/pulls).