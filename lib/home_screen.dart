import 'package:flutter/material.dart';
import 'book.dart';
import 'book_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Book> allBooks = [
    Book(
      title: 'Don\'t Be Sad',
      author: 'Aaidh ibn Abdullah al-Qarni',
      summary:
      'A motivational book that offers guidance on overcoming sadness and finding contentment in life by drawing inspiration from Islamic teachings and principles.',
      price: 0.0, // You can set the price as needed
      rating: 4.7, // You can set the rating as needed
    ),
    Book(
      title: 'You Can Be the Happiest Woman in the World',
      author: 'Aid al-Qarni',
      summary:
      'A book specifically aimed at empowering and motivating women, providing insights on achieving happiness and success in life through faith and positivity.',
      price: 0.0, // You can set the price as needed
      rating: 4.8, // You can set the rating as needed
    ),
    Book(
      title: 'The Power of Dua (Supplication)',
      author: 'Yasmin Mogahed',
      summary:
      'This book explores the transformative power of supplication (dua) in Islam and how it can be a source of motivation and guidance in one’s life journey.',
      price: 0.0, // You can set the price as needed
      rating: 4.6, // You can set the rating as needed
    ),
    Book(
      title: 'Revive Your Heart: Putting Life in Perspective',
      author: 'Nouman Ali Khan',
      summary:
      'A motivational book that encourages readers to reflect on life challenges and setbacks, offering Islamic wisdom and insights for a more positive perspective.',
      price: 0.0, // You can set the price as needed
      rating: 4.9, // You can set the rating as needed
    ),
    Book(
      title: 'Success is Inevitable: 17 Laws to Unlock Your Hidden Potential',
      author: 'Ahmed I. Souaiaia',
      summary:
      'This book outlines 17 laws of success from an Islamic perspective, providing practical guidance and motivation for achieving one’s goals and aspirations.',
      price: 0.0, // You can set the price as needed
      rating: 4.5, // You can set the rating as needed
    ),
    Book(
      title: 'The Art of Being Positive',
      author: 'Muhammad Al-Arifi',
      summary:
      'An uplifting book that explores the art of cultivating a positive mindset and attitude in life, drawing inspiration from Islamic teachings and examples.',
      price: 0.0, // You can set the price as needed
      rating: 4.7, // You can set the rating as needed
    ),
    Book(
      title: 'The Secret of Secrets: The Secrets of the Golden Flower',
      author: 'Osho',
      summary:
      'A spiritual and motivational book that delves into the secrets of inner transformation and self-realization, drawing wisdom from various spiritual traditions.',
      price: 0.0, // You can set the price as needed
      rating: 4.8, // You can set the rating as needed
    ),
    Book(
      title: 'Life\'s Missing Instruction Manual: The Guidebook You Should Have Been Given at Birth',
    author: 'Joe Vitale',
      summary:
      'A general motivational book that provides life lessons and guidance for personal development and success, suitable for readers of all backgrounds.',
      price: 0.0, // You can set the price as needed
      rating: 4.6, // You can set the rating as needed
    ),
    Book(
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      summary:
      'A bestselling novel that explores the journey of self-discovery and fulfilling one’s dreams, with spiritual and motivational themes woven into the narrative.',
      price: 0.0, // You can set the price as needed
      rating: 4.9, // You can set the rating as needed
    ),
    Book(
      title: 'The 7 Habits of Highly Effective People',
      author: 'Stephen R. Covey',
      summary:
      'A classic self-help book that outlines seven habits for personal and professional effectiveness, offering practical advice and motivation for personal growth.',
      price: 0.0, // You can set the price as needed
      rating: 4.8, // You can set the rating as needed
    ),
  ];

  List<Book> displayedBooks = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedBooks.addAll(allBooks);
  }

  void _filterBooks(String query) {
    setState(() {
      displayedBooks = allBooks.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Erbil Reads'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.png', // Replace with your logo asset
                  height: 150, // Adjust the height as needed
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      '123 Book Street, Erbil',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.language, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(
                      'www.erbilreads.com',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(height: 4),
                Text(
                  'Working Hours: 9 AM - 9 PM',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: searchController,
                  onChanged: _filterBooks,
                  decoration: InputDecoration(
                    labelText: 'Search for books',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(displayedBooks[index].title),
                  subtitle: Text(displayedBooks[index].author),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BookDetailScreen(book: displayedBooks[index])),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
