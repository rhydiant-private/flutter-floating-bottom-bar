import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

void main() {
  group('ContextMenuWrapper', () {
    testWidgets('renders child widget correctly', (WidgetTester tester) async {
      const testChild = Text('Test Child');
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextMenuWrapper(
              menuItems: const [
                ContextMenuItem(
                  label: 'Test Item',
                  onTap: null,
                ),
              ],
              child: testChild,
            ),
          ),
        ),
      );

      // Verify that the child widget is rendered
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('does not show menu when disabled', (WidgetTester tester) async {
      const testChild = Icon(Icons.settings);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextMenuWrapper(
              enabled: false,
              menuItems: const [
                ContextMenuItem(
                  label: 'Test Item',
                  onTap: null,
                ),
              ],
              child: testChild,
            ),
          ),
        ),
      );

      // Long press should not show menu when disabled
      await tester.longPress(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      expect(find.text('Test Item'), findsNothing);
    });

    testWidgets('renders without menu items', (WidgetTester tester) async {
      const testChild = Text('Test Child');
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextMenuWrapper(
              menuItems: const [],
              child: testChild,
            ),
          ),
        ),
      );

      // Should render child even without menu items
      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('shows context menu on long press', (WidgetTester tester) async {
      bool itemTapped = false;
      const testChild = Icon(Icons.settings);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextMenuWrapper(
              menuItems: [
                ContextMenuItem(
                  label: 'Test Item',
                  onTap: () {
                    itemTapped = true;
                  },
                ),
              ],
              child: testChild,
            ),
          ),
        ),
      );

      // Long press to show context menu
      await tester.longPress(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Verify menu is shown
      expect(find.text('Test Item'), findsOneWidget);
      
      // Tap the menu item
      await tester.tap(find.text('Test Item'));
      await tester.pumpAndSettle();
      
      // Verify callback was called
      expect(itemTapped, isTrue);
    });

    testWidgets('menu item with icon renders correctly', (WidgetTester tester) async {
      const testChild = Icon(Icons.settings);
      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ContextMenuWrapper(
              menuItems: const [
                ContextMenuItem(
                  label: 'Profile',
                  icon: Icons.person,
                  onTap: null,
                ),
              ],
              child: testChild,
            ),
          ),
        ),
      );

      // Long press to show context menu
      await tester.longPress(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Verify menu item with icon is shown
      expect(find.text('Profile'), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });

  group('ContextMenuItem', () {
    test('creates instance correctly', () {
      const item = ContextMenuItem(
        label: 'Test Label',
        onTap: null,
      );
      
      expect(item.label, equals('Test Label'));
      expect(item.onTap, isNull);
      expect(item.icon, isNull);
    });

    test('creates instance with icon correctly', () {
      const item = ContextMenuItem(
        label: 'Test Label',
        icon: Icons.settings,
        onTap: null,
      );
      
      expect(item.label, equals('Test Label'));
      expect(item.icon, equals(Icons.settings));
      expect(item.onTap, isNull);
    });
  });
}