import 'package:flutter/material.dart';

/// Represents a single item in the context menu that appears on the last tab.
class ContextMenuItem {
  /// The label text displayed for this menu item
  final String label;

  /// The callback function executed when this menu item is tapped
  final VoidCallback onTap;

  /// Optional icon to display alongside the label
  final IconData? icon;

  /// Creates a context menu item with the given [label] and [onTap] callback.
  /// 
  /// Optionally, you can provide an [icon] to display alongside the label.
  const ContextMenuItem({
    required this.label,
    required this.onTap,
    this.icon,
  });
}
