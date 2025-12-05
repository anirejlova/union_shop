import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/widgets/app_footer.dart';

void main() {
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that hero section text is present
      expect(find.text('There is stuff to buy'), findsOneWidget);
      expect(
        find.text(
          "Pompey merchandise! Students, staff and all others welcome to buy several things!",
        ),
        findsOneWidget,
      );
      expect(find.text('BUY HERE!'), findsOneWidget);
    });

    testWidgets('should display product sections', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that product section headers are displayed
      expect(find.text('ESSENTIAL RANGE - OVER 20% OFF!'), findsOneWidget);
      expect(find.text('SIGNATURE RANGE'), findsOneWidget);
      expect(find.text('PORTSMOUTH CITY COLLECTION'), findsOneWidget);
      expect(find.text('OUR RANGE'), findsOneWidget);
    });

    testWidgets('should display essential range products', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check Essential Range products
      expect(find.text('Limited Edition Essential Zip Hoodie'), findsOneWidget);
      expect(find.text('Essential T-Shirt'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
    });

    testWidgets('should display signature range products', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check Signature Range products
      expect(find.text('Signature Hoodie'), findsOneWidget);
      expect(find.text('Signature T-Shirt'), findsOneWidget);
      expect(find.text('£32.99'), findsOneWidget);
      expect(find.text('£14.99'), findsOneWidget);
    });

    testWidgets('should display Portsmouth City Collection products',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check Portsmouth City Collection products
      expect(find.text('Portsmouth City Postcard'), findsOneWidget);
      expect(find.text('Portsmouth City Magnet'), findsOneWidget);
      expect(find.text('Portsmouth City Bookmark'), findsOneWidget);
      expect(find.text('Portsmouth City Nnotebook'), findsOneWidget);

      // Check prices
      expect(find.text('£1.00'), findsOneWidget);
      expect(find.text('£4.50'), findsOneWidget);
      expect(find.text('£3.00'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);
    });

    testWidgets('should display Our Range categories', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check category cards
      expect(find.text('Clothing'), findsOneWidget);
      expect(find.text('Merchandise'), findsOneWidget);
      expect(find.text('Graduation'), findsOneWidget);
      expect(find.text('SALE'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    });

    testWidgets('should display personalization section', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check personalization section
      expect(find.text('Add a Personal Touch'), findsOneWidget);
      expect(
        find.text(
          'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
        ),
        findsOneWidget,
      );
      expect(find.text('CLICK HERE TO ADD TEXT!'), findsOneWidget);
    });

    testWidgets('should display VIEW ALL PRODUCTS button', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that view all button is present
      expect(find.text('VIEW ALL PRODUCTS'), findsOneWidget);
    });

    testWidgets('should display footer', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that footer is present (this will depend on your AppFooter widget)
      expect(find.byType(AppFooter), findsOneWidget);
    });

    testWidgets('should navigate to shop page when BUY HERE is tapped',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Find and tap the BUY HERE button
      final buyButton = find.text('BUY HERE!');
      expect(buyButton, findsOneWidget);

      await tester.tap(buyButton);
      await tester.pumpAndSettle();

      // Verify navigation occurred (CollectionsPage should be visible)
      expect(find.byType(CollectionsPage), findsOneWidget);
    });
  });
}
