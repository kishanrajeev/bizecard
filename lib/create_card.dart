import 'package:flutter/material.dart';
import 'app_colors.dart'; // Import the color constants

class CreateCardPage extends StatelessWidget {
  const CreateCardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              // Navigate to the respective card page based on the index
              var selectedImagePath = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardPage(index + 1, _getImagePath(index + 1)),
                ),
              );

              // Handle the returned result (selected image path)
              if (selectedImagePath != null) {
                Navigator.pop(context, selectedImagePath);
              }
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    _getImagePath(index + 1),
                    height: 150, // Set the desired height
                    width: double.infinity,
                    fit: BoxFit.scaleDown,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Template ${index + 1}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getImagePath(int cardNumber) {
    // Provide the relative path for each card's image based on the card number
    // Adjust the path based on your folder structure and naming conventions
    return 'assets/images/image$cardNumber.jpg';
  }
}

// Inside CardPage class

class CardPage extends StatelessWidget {
  final int cardNumber;
  final String imagePath;

  CardPage(this.cardNumber, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card $cardNumber'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text('Content of Card $cardNumber'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Return the selected image path to the previous page
          Navigator.pop(context, imagePath);
        },
        tooltip: 'Select Card',
        child: Icon(Icons.check),
      ),
    );
  }
}
