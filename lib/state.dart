import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State {
  bool _active = false;

  void _handleTapboxChange(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15),
        child: TapboxB(active: _active, onChanged: _handleTapboxChange));
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              active ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
            Container(
              child: Text("Parent widget state"),
              padding: EdgeInsets.only(top: 15),
            )
          ],
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
            child: Column(
              children: [
                Text(_active ? 'Active' : 'Inactive',
                    style: TextStyle(fontSize: 32.0, color: Colors.white)),
                Container(
                    child: Text('Widget state itself'),
                    padding: EdgeInsets.only(top: 15))
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            )));
  }
}

class StateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: ParentWidget()));
  }
}
