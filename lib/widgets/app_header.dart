import 'package:flutter/material.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isMenuOpen = false;
  bool _isSearchOpen = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void navigateToHome(BuildContext context) {
    setState(() => _isMenuOpen = false);
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) _isSearchOpen = false;
    });
  }

  void handleMenuNavigation(BuildContext context, String route) {
    setState(() => _isMenuOpen = false);
    if (route == 'home') {
      navigateToHome(context);
    } else if (route == 'about') {
      Navigator.pushNamed(context, '/about');
    }
  }

  void toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (_isSearchOpen) {
        _isMenuOpen = false;
      } else {
        _searchController.clear();
      }
    });
  }

  void performSearch() {
    // Placeholder for search functionality
    debugPrint('Searching for: ${_searchController.text}');
  }

  void placeholderCallbackForButtons() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Container(
          height: 100,
          color: Colors.white,
          child: Column(
            children: [
              // Top banner
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                color: const Color(0xFF4d2963),
                child: const Text(
                  'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              // Main header
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => navigateToHome(context),
                        child: Image.network(
                          'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                          height: 18,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              width: 18,
                              height: 18,
                              child: const Center(
                                child: Icon(Icons.image_not_supported,
                                    color: Colors.grey),
                              ),
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search,
                                  size: 18, color: Colors.grey),
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(
                                  minWidth: 32, minHeight: 32),
                              onPressed: toggleSearch,
                            ),
                            IconButton(
                              icon: const Icon(Icons.person_outline,
                                  size: 18, color: Colors.grey),
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(
                                  minWidth: 32, minHeight: 32),
                              onPressed: placeholderCallbackForButtons,
                            ),
                            IconButton(
                              icon: const Icon(Icons.shopping_bag_outlined,
                                  size: 18, color: Colors.grey),
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(
                                  minWidth: 32, minHeight: 32),
                              onPressed: placeholderCallbackForButtons,
                            ),
                            IconButton(
                              icon: const Icon(Icons.menu,
                                  size: 18, color: Colors.grey),
                              padding: const EdgeInsets.all(8),
                              constraints: const BoxConstraints(
                                  minWidth: 32, minHeight: 32),
                              onPressed: toggleMenu,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Search Bar
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isSearchOpen
              ? Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Search products...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            suffixIcon: _searchController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(Icons.clear, size: 18),
                                    onPressed: () {
                                      setState(() => _searchController.clear());
                                    },
                                  )
                                : null,
                          ),
                          onSubmitted: (_) => performSearch(),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: performSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),

        // Dropdown Menu
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isMenuOpen
              ? Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Divider(height: 1, color: Colors.grey),
                      InkWell(
                        onTap: () => handleMenuNavigation(context, 'home'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: double.infinity,
                          child: const Text('Home',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      InkWell(
                        onTap: () => setState(() => _isMenuOpen = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: double.infinity,
                          child: const Text('Shop',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      InkWell(
                        onTap: () => setState(() => _isMenuOpen = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: double.infinity,
                          child: const Text('The Print Shack',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      InkWell(
                        onTap: () => setState(() => _isMenuOpen = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: double.infinity,
                          child: const Text('SALE!',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                      InkWell(
                        onTap: () => handleMenuNavigation(context, 'about'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          width: double.infinity,
                          child: const Text('About',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const Divider(height: 1, color: Colors.grey),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
