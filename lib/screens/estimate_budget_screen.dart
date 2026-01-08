import 'package:flutter/material.dart';
// TODO: Create property_search_screen.dart

class EstimateBudgetScreen extends StatelessWidget {
  final TextEditingController budgetController = TextEditingController();

  EstimateBudgetScreen({super.key}); // Controller for the budget input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.monetization_on), // Use a default icon for now
            SizedBox(width: 8),
            Text('Estimate Budget'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is your estimated budget for the property?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: budgetController, // Set the controller
              decoration: InputDecoration(
                hintText: 'Enter your budget (e.g., \$500,000)',
                border: OutlineInputBorder(),
                prefixIcon:
                    Icon(Icons.monetization_on), // Use a default icon for now
              ),
              keyboardType: TextInputType.number, // Allow numeric input
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Continue button action
                    double? budget = double.tryParse(budgetController.text
                        .replaceAll(',', '')
                        .replaceAll('\$', '')); // Parse the budget
                    if (budget != null) {
                      // TODO: Navigate to property search screen
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => PropertySearchScreen(location: 'Selected Location', budget: budget),
                      //   ),
                      // );
                    } else {
                      // Handle invalid input
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter a valid budget.')),
                      );
                    }
                  },
                  child: Text('Continue'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle Skip button action
                    // For example, skip this step and move to the next screen
                  },
                  child: Text('Skip'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
