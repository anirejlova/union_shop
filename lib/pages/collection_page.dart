import 'package:flutter/material.dart';
import 'package:union_shop/widgets/product_card.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/widgets/app_footer.dart';

class CollectionPage extends StatelessWidget {
  final String collectionTitle;

  const CollectionPage({
    super.key,
    this.collectionTitle = 'Collection',
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final crossAxisCount = isMobile ? 2 : 4;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    collectionTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 24 : 32),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: isMobile ? 8 : 16,
                    mainAxisSpacing: isMobile ? 8 : 16,
                    childAspectRatio: 0.75,
                    children: const [
                      ProductCard(
                        title: 'Portsmouth City Postcard',
                        price: '£1.00',
                        imageUrl: 'assets/images/PompCity_Postcard.jpg',
                      ),
                      ProductCard(
                        title: 'Portsmouth City Magnet',
                        price: '£4.50',
                        imageUrl: 'assets/images/PompCity_Magnet.jpg',
                      ),
                      ProductCard(
                        title: 'Portsmouth City Bookmark',
                        price: '£3.00',
                        imageUrl: 'assets/images/PompCity_Bookmark.jpg',
                      ),
                      ProductCard(
                        title: 'Portsmouth City Notebook',
                        price: '£7.50',
                        imageUrl: 'assets/images/PompCity_Notebook.jpg',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
