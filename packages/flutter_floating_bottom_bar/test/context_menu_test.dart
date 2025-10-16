import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

void main() {
  group('ContextMenuItem', () {
    test('creates a context menu item with label and callback', () {
      bool tapped = false;
      final item = ContextMenuItem(
        label: 'Test Item',
        onTap: () => tapped = true,
      );

      expect(item.label, 'Test Item');
      expect(item.icon, null);
      item.onTap();
      expect(tapped, true);
    });

    test('creates a context menu item with icon', () {
      final item = ContextMenuItem(
        label: 'Test Item',
        icon: Icons.settings,
        onTap: () {},
      );

      expect(item.label, 'Test Item');
      expect(item.icon, Icons.settings);
    });
  });

  group('TabWithContextMenu', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabWithContextMenu(
              menuItems: const [],
              child: const Text('Test Child'),
            ),
          ),
        ),
      );

      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('shows context menu on long press', (WidgetTester tester) async {
      bool menuItemTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabWithContextMenu(
              menuItems: [
                ContextMenuItem(
                  label: 'Test Menu Item',
                  onTap: () => menuItemTapped = true,
                ),
              ],
              child: const SizedBox(
                width: 100,
                height: 100,
                child: Text('Test Child'),
              ),
            ),
          ),
        ),
      );

      // Long press on the widget
      await tester.longPress(find.text('Test Child'));
      await tester.pumpAndSettle();

      // Verify menu appeared
      expect(find.text('Test Menu Item'), findsOneWidget);

      // Tap the menu item
      await tester.tap(find.text('Test Menu Item'));
      await tester.pumpAndSettle();

      // Verify callback was called
      expect(menuItemTapped, true);
    });

    testWidgets('shows context menu on secondary tap (right-click)', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabWithContextMenu(
              menuItems: [
                ContextMenuItem(
                  label: 'Test Menu Item',
                  icon: Icons.settings,
                  onTap: () {},
                ),
              ],
              child: const SizedBox(
                width: 100,
                height: 100,
                child: Text('Test Child'),
              ),
            ),
          ),
        ),
      );

      // Simulate right-click
      final gesture = await tester.startGesture(
        tester.getCenter(find.text('Test Child')),
        kind: PointerDeviceKind.mouse,
        buttons: kSecondaryMouseButton,
      );
      await tester.pump();
      await gesture.up();
      await tester.pumpAndSettle();

      // Verify menu appeared
      expect(find.text('Test Menu Item'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });

    testWidgets('does not show menu when menuItems is empty', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TabWithContextMenu(
              menuItems: const [],
              child: const SizedBox(
                width: 100,
                height: 100,
                child: Text('Test Child'),
              ),
            ),
          ),
        ),
      );

      // Long press on the widget
      await tester.longPress(find.text('Test Child'));
      await tester.pumpAndSettle();

      // Verify no menu appeared (only the child text exists)
      expect(find.byType(PopupMenuItem), findsNothing);
    });
  });
}
