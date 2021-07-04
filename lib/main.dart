import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // Add this line.
    return MaterialApp(
      title: 'Startup namer',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({ Key? key }) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];                 // NEW
  final _biggerFont = const TextStyle(fontSize: 18); // NEW
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random(); // Delete these... 
    //return Text(wordPair.asPascalCase); // ... two lines.

    return Scaffold (                     // Add from here... 
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );                                      // ... to here.
  }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      leading: Icon(Icons.business_center_outlined),
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: Text("Example"),
    );
  }
}