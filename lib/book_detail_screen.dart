import 'package:flutter/material.dart';
import 'book.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  BookDetailScreen({required this.book});

  // Function to show the order confirmation dialog
  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Confirmation'),
          content: Text('Do you want to place an order for ${book.title}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and perform the order
                Navigator.of(context).pop();
                _placeOrder();
              },
              child: Text('Order'),
            ),
          ],
        );
      },
    );
  }

  // Function to handle the order
  void _placeOrder() {
    // Add your logic here to place the order, e.g., making API requests, updating the database, etc.
    // You can also display a success message to the user.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Title: ${book.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Author: ${book.author}'),
            SizedBox(height: 8),
            Text('Summary: ${book.summary}'),
            SizedBox(height: 8),
            Text('Price: \$${book.price.toStringAsFixed(2)}'),
            SizedBox(height: 8),
            Text('Rating: ${book.rating.toString()}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call the function to show the order confirmation dialog
                _showOrderConfirmationDialog(context);
              },
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
