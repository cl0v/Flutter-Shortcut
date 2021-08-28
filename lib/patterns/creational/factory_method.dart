import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The Factory Method pattern, sometimes referred to as the
/// Virtual Constructor pattern, provides a way to conceal an object's
/// creation logic from client code, but the object returned is guaranteed
/// to adhere to a known interface. It's one of the most widely used
/// creational patterns, because it adds a lot of flexibility to your object
/// creation architecture without adding much complexity.

/// Simple example
enum ShapeType { triangle, rectangle }

abstract class Shape {
  factory Shape.triangle() => Triangle();
  factory Shape.rectangle() => Rectangle();

  void draw();
}

class Triangle implements Shape {
  @override
  void draw() {
    print("TRIANGLE");
  }
}

class Rectangle implements Shape {
  @override
  void draw() {
    print("RECTANGLE");
  }
}

simpleUse() {
  final shape1 = Shape.triangle();
  final shape2 = Shape.rectangle();

  shape1.draw();
  shape2.draw();
}

/// Somewhere in the app, a PlatformButton factory can be created like this:
/// PlatformButton(TargetPlatform.android) | PlatformButton.android() |
/// PlatformButton(Theme.of(context).platform)
///
/// To build a button, you'll need to call the build() method:
/// ```dart
///   PlatformButton(Theme.of(context).platform).build(
///    context: context,
///    child: Text('My Button'),
///    onPressed: () => print('Button pressed!'),
///   )
/// ```

abstract class PlatformButton {
  factory PlatformButton(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return IosButton();
      case TargetPlatform.android:
        return AndroidButton();
      default:
        return AndroidButton();
    }
  }

  factory PlatformButton.android() => AndroidButton();
  factory PlatformButton.iOS() => IosButton();

  Widget build(
      {required BuildContext context,
      required Widget child,
      required VoidCallback onPressed});
}

class AndroidButton implements PlatformButton {
  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

class IosButton implements PlatformButton {
  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }
}

abstract class PlatformSwitch {
  factory PlatformSwitch(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
        return AndroidSwitch();
      case TargetPlatform.iOS:
        return IosSwitch();
      default:
        return AndroidSwitch();
    }
  }

  Widget build({
    required BuildContext context,
    required value,
    required ValueChanged<bool> onChanged,
  });
}

class AndroidSwitch implements PlatformSwitch {
  @override
  Widget build(
      {required BuildContext context,
      required value,
      required ValueChanged<bool> onChanged}) {
    PlatformButton(Theme.of(context).platform);
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}

class IosSwitch implements PlatformSwitch {
  @override
  Widget build({
    required BuildContext context,
    required value,
    required ValueChanged<bool> onChanged,
  }) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
    );
  }
}
