import 'package:flutter/material.dart';
import 'package:union_shop/widgets/app_header.dart';
import 'package:union_shop/widgets/app_footer.dart';

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
                child: Text('About Us',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: const Text(
                "Welcome to the Union Shop! \n"
                "We're dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n"
                "All online purchases are available for delivery or instore collection!\n"
                "We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us at hello@upsu.net.\n"
                "Happy shopping!\n"
                "The Union Shop & Reception Team​​​​​​​​​",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
