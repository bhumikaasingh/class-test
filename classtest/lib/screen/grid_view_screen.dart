import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  final String name = "Bhumika"; 

  List<Widget> _generateButtons(BuildContext context) {
    List<Widget> buttons = [];
    for (int i = 0; i < name.length; i++) {
      buttons.add(
        NameButton(
          letter: name[i],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
                settings: RouteSettings(arguments: name[i]),
              ),
            );
          },
        ),
      );
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Buttons'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: _generateButtons(context),
        ),
      ),
    );
  }
}

class NameButton extends StatefulWidget {
  final String letter;
  final VoidCallback onPressed;

  NameButton({required this.letter, required this.onPressed});

  @override
  _NameButtonState createState() => _NameButtonState();
}

class _NameButtonState extends State<NameButton> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isVisible = false;
          });
          widget.onPressed();
        },
        child: Text(widget.letter),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String letter = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text(
          'You clicked on the button with letter: $letter',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}