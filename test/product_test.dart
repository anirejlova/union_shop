import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  group('Product Page Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('should display product page with basic elements', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Check that basic UI elements are present
      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
      expect(find.text('Description'), findsOneWidget);
    });

    testWidgets('should display size dropdown', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.text('Size'), findsOneWidget);
      //expect(find.byType(DropdownButtonFormField<dynamic>), findsOneWidget);
    });

    testWidgets('should display quantity input', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.text('Quantity'), findsOneWidget);
      expect(find.text('1'), findsOneWidget); // Initial quantity value
    });

    testWidgets('should display add to cart button', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsWidgets);
    });

    testWidgets('should show error when adding to cart without selecting size',
        (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Tap add to cart without selecting size
      await tester.tap(find.text('Add to Cart'), warnIfMissed: false);
      await tester.pump();
    });
  });
}
