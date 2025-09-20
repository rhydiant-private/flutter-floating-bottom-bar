import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Defines a context menu item with a label and callback
class ContextMenuItem {
  /// The label to display for this menu item
  final String label;
  
  /// The callback to execute when this item is selected
  final VoidCallback onTap;
  
  /// Optional icon for the menu item
  final IconData? icon;

  const ContextMenuItem({
    required this.label,
    required this.onTap,
    this.icon,
  });
}

/// A wrapper widget that adds context menu functionality to any child widget.
/// Supports both long-press (mobile) and right-click (desktop/web) gestures.
class ContextMenuWrapper extends StatefulWidget {
  /// The child widget to wrap with context menu functionality
  final Widget child;
  
  /// List of menu items to display in the context menu
  final List<ContextMenuItem> menuItems;
  
  /// Whether the context menu is enabled. Defaults to true.
  final bool enabled;

  const ContextMenuWrapper({
    Key? key,
    required this.child,
    required this.menuItems,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<ContextMenuWrapper> createState() => _ContextMenuWrapperState();
}

class _ContextMenuWrapperState extends State<ContextMenuWrapper> {
  void _showContextMenu(BuildContext context, Offset globalPosition) {
    if (!widget.enabled || widget.menuItems.isEmpty) return;

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(globalPosition, globalPosition),
      Offset.zero & overlay.size,
    );

    showMenu<void>(
      context: context,
      position: position,
      items: widget.menuItems.map((item) {
        return PopupMenuItem<void>(
          onTap: item.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null) ...[
                Icon(item.icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(item.label),
            ],
          ),
        );
      }).toList(),
      elevation: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled || widget.menuItems.isEmpty) {
      return widget.child;
    }

    return GestureDetector(
      onLongPressStart: (details) {
        _showContextMenu(context, details.globalPosition);
      },
      onSecondaryTapUp: kIsWeb || defaultTargetPlatform == TargetPlatform.windows ||
              defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.macOS
          ? (details) {
              _showContextMenu(context, details.globalPosition);
            }
          : null,
      child: widget.child,
    );
  }
}