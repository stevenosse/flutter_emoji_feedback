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
