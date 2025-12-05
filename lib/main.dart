import 'package:flutter/material.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/about_page.dart';
import 'package:union_shop/pages/placeholder.dart';
import 'package:union_shop/pages/auth_page.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/widgets/app_footer.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/placeholder': (context) => const PlaceholderPage(),
        '/auth': (context) => const AuthPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),

            // Hero Section
            SizedBox(
              height: isMobile ? 250 : 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/PompCity_notebook.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: isMobile ? 16 : 24,
                    right: isMobile ? 16 : 24,
                    top: isMobile ? 60 : 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'There is stuff to buy',
                          style: TextStyle(
                            fontSize: isMobile ? 24 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Pompey merchandise! Students, staff and all others welcome to buy several things!",
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BUY HERE!',
                            style: TextStyle(fontSize: 16, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            ProductSection(
              title: 'ESSENTIAL RANGE - OVER 20% OFF!',
              products: const [
                ProductCard(
                  title: 'Limited Edition Essential Zip Hoodie',
                  price: '£20.00',
                  imageUrl: 'assets/images/limitedEd_pinkHoodie.jpg',
                ),
                ProductCard(
                  title: 'Essential T-Shirt',
                  price: '£10.00',
                  imageUrl: 'assets/images/EssenTshirt_greenShirt.jpg',
                ),
              ],
            ),

            ProductSection(
              title: 'SIGNATURE RANGE',
              products: const [
                ProductCard(
                  title: 'Signature Hoodie',
                  price: '£32.99',
                  imageUrl: 'assets/images/SignatureHoodie_greenHoodie.jpg',
                ),
                ProductCard(
                  title: 'Signature T-Shirt',
                  price: '£14.99',
                  imageUrl: 'assets/images/SignatureTshirt_blueShirt.jpg',
                ),
              ],
            ),

            ProductSection(
              title: 'PORTSMOUTH CITY COLLECTION',
              products: const [
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
                  title: 'Portsmouth City Nnotebook',
                  price: '£7.50',
                  imageUrl: 'assets/images/PompCity_Notebook.jpg',
                ),
              ],
              showViewAllButton: true,
              onViewAllPressed: placeholderCallbackForButtons,
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
              child: Column(
                children: [
                  Text(
                    "OUR RANGE",
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 20,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
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

            // Image with text section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
              child: isMobile
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60.0,
                            vertical: 10.0,
                          ),
                          child: Image.asset(
                            'assets/images/printShack.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                height: 100,
                                child: const Center(
                                  child: Icon(Icons.image_not_supported,
                                      color: Colors.grey, size: 50),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Add a Personal Touch',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: placeholderCallbackForButtons,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4d2963),
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: const Text(
                              'CLICK HERE TO ADD TEXT!',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Add a Personal Touch',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: placeholderCallbackForButtons,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4d2963),
                                  foregroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                child: const Text(
                                  'CLICK HERE TO ADD TEXT!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'assets/images/printShack.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                height: 200,
                                child: const Center(
                                  child: Icon(Icons.image_not_supported,
                                      color: Colors.grey, size: 50),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  final String title;
  final List<Widget> products;
  final bool showViewAllButton;
  final VoidCallback? onViewAllPressed;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    this.showViewAllButton = false,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(isMobile ? 20.0 : 30.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.black,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 24 : 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: isMobile ? 16 : 24,
            mainAxisSpacing: isMobile ? 24 : 48,
            childAspectRatio: isMobile ? 1.2 : 1.4,
            children: products,
          ),
          if (showViewAllButton) ...[
            SizedBox(height: isMobile ? 24 : 48),
            ElevatedButton(
              onPressed: onViewAllPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 24,
                  vertical: isMobile ? 12 : 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text(
                'VIEW ALL PRODUCTS',
                style: TextStyle(
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductCardDark extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ProductCardDark({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
