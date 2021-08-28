import 'package:flutter/material.dart';
import 'package:flutter_demo/patterns/creational/factory_method.dart';


/// The Abstract Factory Method pattern is essentially a superset 
/// of the Factory Method pattern.
/// 
/// With this pattern, client code no longer needs to concern itself with 
/// specific object factories. Instead, a central factory class
/// (a factory of factories) handles those details invisibly.
/// 
/// The user need only provide the type of object required, and the abstract 
/// factory determines which object factory to instantiate, then it returns 
/// the appropriate product.
/// 
/// This expanded example will support the creation of multiple 
/// platform-specific UI widgets

class WidgetFactory {
  static Widget buildButton({
    required BuildContext context,
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return PlatformButton(Theme.of(context).platform).build(
      context: context,
      child: child,
      onPressed: onPressed,
    );
  }

  static Widget buildSwitch({
    required BuildContext context,
    required value,
    required ValueChanged<bool> onChanged,
  }) {
    return PlatformSwitch(Theme.of(context).platform).build(
      context: context,
      value: value,
      onChanged: onChanged,
    );
  }
}
