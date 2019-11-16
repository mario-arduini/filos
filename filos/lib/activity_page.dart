import 'package:flutter/material.dart';

class NewActivityDialog extends StatefulWidget {
  @override
  _NewActivityDialogState createState() => _NewActivityDialogState();
}

class _NewActivityDialogState extends State<NewActivityDialog> {
  final _controller = TextEditingController();
  String _title;

  void initState() {
    _controller.addListener(() {
      print('text=${_controller.text}');
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New activity'),
      content: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Activity title..'),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Save'),
          onPressed: () {},
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class ControlledTextField extends StatefulWidget {
  final Widget Function(TextEditingController) builder;

  const ControlledTextField({Key key, this.builder}) : super(key: key);
  @override
  _ControlledTextFieldState createState() => _ControlledTextFieldState();
}

class _ControlledTextFieldState extends State<ControlledTextField> {
  final _controller = TextEditingController();

  void initState() {
    _controller.addListener(() {
      print('text=${_controller.text}');
    });
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
    );
  }
}
