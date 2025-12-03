import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
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
          _buildFooterSection(
            title: 'Help and Information',
            content: 'Search\n'
                'Terms & Conditions of Safe Policy',
            isMobile: isMobile,
          ),
          SizedBox(height: isMobile ? 24 : 32),
          _buildFooterSection(
            title: 'Latest Offers',
            content:
                'Email address input box will be here with SUBSCRIBE button next to it',
            isMobile: isMobile,
          ),
        ],
      ),
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
