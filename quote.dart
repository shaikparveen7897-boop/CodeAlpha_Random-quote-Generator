import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(QuoteApp());

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18.0),
        ),
      ),
      home: QuotePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final List<Quote> _quotes = [
    Quote(text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
    Quote(text: "In the middle of every difficulty lies opportunity.", author: "Albert Einstein"),
    Quote(text: "Life is what happens when you're busy making other plans.", author: "John Lennon"),
    Quote(text: "The best way to predict the future is to invent it.", author: "Alan Kay"),
    Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
  ];

  late Quote _currentQuote;

  @override
  void initState() {
    super.initState();
    _currentQuote = _getRandomQuote();
  }

  Quote _getRandomQuote() {
    final random = Random();
    return _quotes[random.nextInt(_quotes.length)];
  }

  void _showNewQuote() {
    setState(() {
      _currentQuote = _getRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Random Quote Generator'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '"${_currentQuote.text}"',
                style: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '- ${_currentQuote.author}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: _showNewQuote,
                child: Text('New Quote'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
