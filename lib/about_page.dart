import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: const Center(
                child: Text(
                  'About Page Content',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
