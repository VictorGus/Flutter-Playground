import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
              color: Colors.red,
              onPressed: _toggleFavorite,
            )),
        SizedBox(width: 18, child: Container(child: Text('$_favoriteCount')))
      ],
    );
  }
}

class LayoutPage extends StatelessWidget {
  Column _buildButtonColumn(IconData icon, String title, Color color) {
    return (Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(title,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w400, color: color)))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Icons.call, "CALL", color),
          _buildButtonColumn(Icons.near_me, "ROUTE", color),
          _buildButtonColumn(Icons.share, "SHARE", color)
        ],
      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Text('Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]))
            ],
          ),
        ),
        FavoriteWidget()
      ]),
    );

    Widget textSection = Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
          softWrap: true,
        ));

    Widget imageSection = Container(
        child: Image.asset('images/lake.jpg',
            width: 600, height: 240, fit: BoxFit.cover));

    return Scaffold(
      body: Builder(
          builder: (context) => Scaffold(
              body: ListView(
                children: [
                  imageSection,
                  titleSection,
                  buttonSection,
                  textSection,
                ],
              ),
              appBar: AppBar(title: Text('Flutter Demo Hello World Page')))),
    );
  }
}
