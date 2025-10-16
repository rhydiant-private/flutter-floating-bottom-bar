import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/src/context_menu_item.dart';

/// A widget that wraps a tab and provides context menu functionality.
/// 
/// This should be used to wrap the last tab in your TabBar when you want
/// to show a context menu on long-press or right-click.
class TabWithContextMenu extends StatelessWidget {
  /// The child widget to wrap (typically a Tab or a tab-like widget)
  final Widget child;

  /// List of context menu items to display
  final List<ContextMenuItem> menuItems;

  const TabWithContextMenu({
    Key? key,
    required this.child,
    required this.menuItems,
  }) : super(key: key);

  void _showContextMenu(BuildContext context, TapDownDetails details) {
    if (menuItems.isEmpty) return;

    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        details.globalPosition,
        details.globalPosition,
      ),
      Offset.zero & overlay.size,
    );

    showMenu<void>(
      context: context,
      position: position,
      items: menuItems
          .map(
            (item) => PopupMenuItem<void>(
              onTap: item.onTap,
              child: Row(
                children: [
                  if (item.icon != null) ...[
                    Icon(item.icon, size: 20),
                    const SizedBox(width: 12),
                  ],
                  Text(item.label),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) => _showContextMenu(context, details),
      onSecondaryTapDown: (details) => _showContextMenu(context, details),
      child: child,
    );
  }
}
