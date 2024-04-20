import 'package:briefnet/Screens/celebrations_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  final String selectedPlan;
  final String price;

  const PaymentScreen(
      {super.key, required this.selectedPlan, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BriefNet',
          style: GoogleFonts.crimsonText(
            textStyle: const TextStyle(
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Selected Plan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  selectedPlan,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  price,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Expiration Date',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.transparent,
                  child: TextButton(
                    onPressed: () {
                      if (selectedPlan == 'Free') {
                        // Navigate to HomeScreen if the Free plan is selected
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>  const CelebrationScreen(),
                          ),
                        );
                      } else {
                        showCupertinoDialog(
                          context:
                              context, // Use the context from the current widget tree
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text('Payment'),
                              content: const Text(
                                  'Retry payment to continue enjoying BriefNet'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: const Text('Sure'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Close the dialog
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: CupertinoColors.systemYellow,
                      // primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: BorderSide(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? CupertinoColors.systemYellow
                                  : CupertinoColors.systemYellow,
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Text("Join BriefNet",
                          style: GoogleFonts.crimsonText(
                            textStyle: const TextStyle(
                              color: CupertinoColors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
