## 1.0.2
- Update docs

## 1.0.1
- Update docs

## 1.0.0
### Breaking changes
- `rating` is now no longer needed, the package handles that internally. If you need to set an intial rating, see [Parameters](https://github.com/stevenosse/flutter_emoji_feedback/?tab=readme-ov-file#parameters).
- Presets must be defined as either a `StaticEmojiPreset` or a `AnimatedEmojiPreset`, see [Defining Presets](https://github.com/stevenosse/flutter_emoji_feedback/?tab=readme-ov-file#-defining-presets)

### New features
- Animated emoji presets using Lottie files are now supported
- Add `onChangeWaitForAnimation` property to wait for the emoji's animation to complete before calling `onChanged`
- Add `tapScale` property to set the scale for when the user holds down the emoji

## 0.4.1
- Add tests

## 0.4.0
- Add `enableFeedback` property to enable haptic feedback
- Customize `Curve` animation
- Add `minRating` and `maxRating` properties to limit the rating range
- A second tap on an emoji will now reset the rating to `null`
- Update docs

[Breaking change] 
- `initialRating` property is now `rating` and is nullable. 
- The `EmojiBuilder` function now takes an additional `bool` parameter to indicate if the emoji is active or not

## 0.3.2
- Fix grey background on selected emojis
- Update sample app android gradle config
- Fix formatting

## 0.3.1
- Fix grey background on unselected emojis

## 0.3.0
- Add `initialRating` property to set the initial rating

## 0.2.0
- +3 new emoji presets (flat, hand drawn, 3d)
- Upgrade flutter_svg to `^2.0.10+1`
- You can now customize the space between elements with `spaceBetweenItems` property
- You can now customize the label padding with `labelPadding` property

## 0.1.2
- Fix error when`very good` emoji in classic preset is loaded on web clients

## 0.1.1
- Update docs
- Add more examples

## 0.1.0
- Add customization for labels
- Add customization for inactive elements blend color
- Add customization for inactive elements scale factor
- Add customization for elements size
- Add customization for scale animation curve

## 0.0.2
- Update docs

## 0.0.1

- Basic version 
