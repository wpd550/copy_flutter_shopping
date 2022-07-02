// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:picturecollection/Login/LoginHomeView.dart';
import 'package:picturecollection/Shopping/homeScreen.dart';
import 'package:picturecollection/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // home: RandomWorlds(),
      // home: MyScaffod(),
      // home: LoginHomeView(),
      home: HomeScreen(),
    );
  }
}

class RandomWorlds extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWorldState();
}

class RandomWorldState extends State<RandomWorlds> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          IconButton(onPressed: _pressed, icon: const Icon(Icons.list)),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pressed() {
    Navigator.of(this.context).push(MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return ListTile(
            title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ));
      });
      final tileDivided =
          ListTile.divideTiles(tiles: tiles, context: context).toList();
      // ignore: dead_code
      return Scaffold(
        appBar: AppBar(title: Text("saved pair")),
        body: ListView(
          children: tileDivided,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

class MyappBar extends StatelessWidget {
  MyappBar({required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: "Navigation menu",
          ),
          Expanded(child: title),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyScaffod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyappBar(
              title: Text(
            'Example title',
            style: Theme.of(context).primaryTextTheme.titleLarge,
          )),
          const Expanded(child: Center(child: Text("Hello, world"))),
        ],
      ),
    );
  }
}
