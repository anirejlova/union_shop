import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/widgets/app_header.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),

            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
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
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Placeholder Hero Title',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "This is placeholder text for the hero section.",
                          style: TextStyle(
                            fontSize: 20,
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
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
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
                  title: 'Placeholder Product 1',
                  price: '£10.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 2',
                  price: '£15.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
              ],
            ),

            ProductSection(
              title: 'SIGNATURE RANGE',
              products: const [
                ProductCard(
                  title: 'Placeholder Product 1',
                  price: '£10.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 2',
                  price: '£15.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
              ],
            ),

            ProductSection(
              title: 'PORTSMOUTH CITY COLLECTION',
              products: const [
                ProductCard(
                  title: 'Placeholder Product 1',
                  price: '£10.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 2',
                  price: '£15.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 3',
                  price: '£20.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCard(
                  title: 'Placeholder Product 4',
                  price: '£25.00',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
              ],
              showViewAllButton: true,
              onViewAllPressed: placeholderCallbackForButtons,
            ),

            ProductSection(
              title: "OUR RANGE",
              products: const [
                ProductCardDark(
                  title: 'Clothing',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCardDark(
                  title: 'Merchandise',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCardDark(
                  title: 'Graduation',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
                ProductCardDark(
                  title: 'SALE',
                  imageUrl:
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                ),
              ],
            ),

            // Image with text section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Image.network(
                    'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
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
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Heading Text',
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
                      'This is some smaller text that goes underneath the heading. You can add more descriptive content here.',
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
                        'BUTTON TEXT',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Footer
            Container(
              width: double.infinity,
              color: Colors.grey[50],
              padding: const EdgeInsets.all(24),
              child: const Text(
                'Opening Hours\n\n'
                '❄️ Winter Break Closure Dates ❄️\n'
                'Closing 4pm 19/12/2025\n'
                'Reopening 10am 05/01/2026\n'
                'Last post date: 12pm on 18/12/2025\n\n'
                '------------------------\n\n'
                '(Term Time)\n'
                'Monday - Friday 10am - 4pm\n\n'
                '(Outside of Term Time / Consolidation Weeks)\n'
                'Monday - Friday 10am - 3pm\n\n'
                'Purchase online 24/7',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
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
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 48),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
            crossAxisSpacing: 24,
            mainAxisSpacing: 48,
            children: products,
          ),
          if (showViewAllButton) ...[
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: onViewAllPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4d2963),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text(
                'VIEW ALL PRODUCTS',
                style: TextStyle(
                  fontSize: 14,
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
            child: Image.network(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
