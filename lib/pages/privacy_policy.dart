import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          const Spacer(),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    """
                          At SmartPower, we are committed to safeguarding your privacy and ensuring that your personal information remains secure. By using our electricity billing app, you acknowledge and accept our Privacy Policy and Terms of Use. 
                          
                          We understand the paramount importance of your personal data and are dedicated to maintaining its confidentiality. Rest assured that any information you provide will not be shared with third parties or organizations without your explicit consent. Our app employs industry-standard security measures to protect your data from unauthorized access and breaches.
                          
                          Your trust is invaluable to us, and we strive to uphold it by ensuring that your information is used solely for the purposes of enhancing your experience with our services. We encourage you to review our Privacy Policy for more detailed insights into how we collect, use, and protect your information.
                          
                          Thank you for choosing SmartPower. We are committed to providing you with an exceptional user experience while prioritizing your privacy.""",
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
