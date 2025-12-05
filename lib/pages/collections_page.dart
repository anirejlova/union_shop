import 'package:flutter/material.dart';
import 'package:union_shop/widgets/product_dark.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/widgets/app_footer.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
              child: Column(
                children: [
                  const Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: isMobile ? 24 : 32),
                  isMobile
                      ? GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1.0,
                          children: const [
                            ProductCardDark(
                              title: 'Clothing',
                              imageUrl:
                                  'assets/images/Clothing_purpleHoodie.jpg',
                            ),
                            ProductCardDark(
                              title: 'Merchandise',
                              imageUrl: 'assets/images/merchendise.jpg',
                            ),
                            ProductCardDark(
                              title: 'Graduation',
                              imageUrl:
                                  'assets/images/Graduation_grayHoodie.jpg',
                            ),
                            ProductCardDark(
                              title: 'SALE',
                              imageUrl: 'assets/images/SALE.jpg',
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 150,
                          child: Row(
                            children: const [
                              Expanded(
                                child: ProductCardDark(
                                  title: 'Clothing',
                                  imageUrl:
                                      'assets/images/Clothing_purpleHoodie.jpg',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ProductCardDark(
                                  title: 'Merchandise',
                                  imageUrl: 'assets/images/merchendise.jpg',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ProductCardDark(
                                  title: 'Graduation',
                                  imageUrl:
                                      'assets/images/Graduation_grayHoodie.jpg',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: ProductCardDark(
                                  title: 'SALE',
                                  imageUrl: 'assets/images/SALE.jpg',
                                ),
                              ),
                            ],
                          ),
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
