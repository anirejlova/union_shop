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
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Text(
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
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
