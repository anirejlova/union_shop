import 'package:flutter/material.dart';

class AppFooter extends StatefulWidget {
  const AppFooter({super.key});

  @override
  State<AppFooter> createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  bool _isSearchOpen = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      _isSearchOpen = !_isSearchOpen;
      if (!_isSearchOpen) {
        _searchController.clear();
      }
    });
  }

  void performSearch() {
    debugPrint('Searching for: ${_searchController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
        // Footer Content
        Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: EdgeInsets.all(isMobile ? 20 : 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFooterSection(
                title: 'Opening Hours',
                content: '❄️ Winter Break Closure Dates ❄️\n'
                    'Closing 4pm 19/12/2025\n'
                    'Reopening 10am 05/01/2026\n'
                    'Last post date: 12pm on 18/12/2025\n\n'
                    '(Term Time)\n'
                    'Monday - Friday 10am - 4pm\n\n'
                    '(Outside of Term Time / Consolidation Weeks)\n'
                    'Monday - Friday 10am - 3pm\n\n'
                    'Purchase online 24/7',
                isMobile: isMobile,
              ),
              SizedBox(height: isMobile ? 24 : 32),
              _buildHelpSection(context, isMobile),
              SizedBox(height: isMobile ? 24 : 32),
              _buildFooterSection(
                title: 'Latest Offers',
                content:
                    'Email address input box will be here with SUBSCRIBE button next to it',
                isMobile: isMobile,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHelpSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Help and Information',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: toggleSearch,
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: isMobile ? 14 : 15,
              color: Colors.blue[700],
              decoration: TextDecoration.underline,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () => Navigator.pushNamed(context, '/placeholder'),
          child: Text(
            'Terms & Conditions of Safe Policy',
            style: TextStyle(
              fontSize: isMobile ? 14 : 15,
              color: Colors.blue[700],
              decoration: TextDecoration.underline,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterSection({
    required String title,
    required String content,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: TextStyle(
            fontSize: isMobile ? 14 : 15,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
