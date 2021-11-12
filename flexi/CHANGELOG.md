## 0.3.2

Fix #33: Wrong margins for flex container

## 0.3.1

Fix #25: Overflow error when Overlay is bigger than container width

## 0.3.0

* Close #27: Allow FlexWidget to change container context.
* Breaking change: `FlexValue.build` method requires parameter name.

## 0.2.0

* Close #22: Access parent and root flex container
* Breaking changes
  * Remove `FlexLayout`
  * Specifying `FlexContainer` is mandatory to use flexi for children widgets.
  * `FlexContainer` must always specify its layout.

## 0.1.5

* Fix #10: Overlay column dividers are not visible if gutter is zero.

## 0.1.4

* Close #9: Support layout for rule of thirds

## 0.1.3

* Fix #10: Overlay column dividers are not visible if gutter is zero.

## 0.1.2

* Add first example

## 0.1.1

* Change default `fullSize` to true for `FlexContainer`.

## 0.1.0

* Architecture for generic layout definition.
* Implementation of material and bootstrap layout.
* Allows showing overlay grid over a container.
