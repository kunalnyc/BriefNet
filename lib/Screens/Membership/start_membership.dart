import 'package:briefnet/Payment%20Gateway/payment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MembershipOptionsScreen extends StatelessWidget {
  const MembershipOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.black,
      appBar: AppBar(
        elevation: 0.00,
        automaticallyImplyLeading: false,
        backgroundColor: CupertinoColors.black,
        centerTitle: true,
        title: Text(
          'Choose Your Membership Plan',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: CupertinoColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMembershipPlanCard(
              soundQuality: 'Good',
              context: context,
              planName: 'Basic',
              price: '\$9.99/month',
              features: [
                'Access to basic courses',
                'Limited content',
                'Good sound quality'
              ],
            ),
            _buildMembershipPlanCard(
              soundQuality: 'Great',
              context: context,
              planName: 'Standard',
              price: '\$19.99/month',
              features: [
                'Access to all courses',
                'HD video streaming',
                'Great sound quality'
              ],
            ),
            _buildMembershipPlanCard(
              soundQuality: 'Excellent',
              context: context,
              planName: 'Premium',
              price: '\$29.99/month',
              features: [
                'Access to all courses',
                '4K (Ultra HD) + HDR',
                'Exclusive content',
                'Excellent sound quality'
              ],
            ),
            _buildMembershipPlanCard(
              soundQuality: 'Excellent',
              context: context,
              planName: 'Free',
              price: '\$0.00/month',
              features: [
                'Access to all courses',
                'HD and 4K video streaming',
                'Excellent sound quality'
              ],
            ),
            // Add more membership plan cards as needed
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipPlanCard({
    required BuildContext context,
    required String planName,
    required String soundQuality,
    required String price,
    required List<String> features,
  }) {
    return Card(
      color: CupertinoColors.darkBackgroundGray,
      margin: const EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: const TextStyle(
                fontSize: 24.0,
                color: CupertinoColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              price,
              style: const TextStyle(
                fontSize: 18.0,
                color: CupertinoColors.systemYellow,
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features.map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.green),
                      const SizedBox(width: 8.0),
                      Text(
                        feature,
                        style: const TextStyle(color: CupertinoColors.white),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                        price: price,
                        selectedPlan: planName), // Pass the selected plan name
                  ),
                );
              },
              child: const Text('Select Plan'),
            ),
          ],
        ),
      ),
    );
  }
}
