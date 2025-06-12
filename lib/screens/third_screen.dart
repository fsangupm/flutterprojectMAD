import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Add this in pubspec.yaml under dependencies

class ThirdScreen extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("This is an alert dialog."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("This is a SnackBar."),
      ),
    );
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg: "This is a Toast.",
      toastLength: Toast.LENGTH_SHORT,
      // Remove gravity or let it default
      // gravity: ToastGravity.BOTTOM, ← remove this line
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            ListTile(leading: Icon(Icons.share), title: Text('Share')),
            ListTile(leading: Icon(Icons.link), title: Text('Get link')),
            ListTile(leading: Icon(Icons.edit), title: Text('Edit name')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => _showAlertDialog(context),
              child: Text("Show AlertDialog"),
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(context),
              child: Text("Show SnackBar"),
            ),
            ElevatedButton(
              onPressed: _showToast,
              child: Text("Show Toast"),
            ),
            ElevatedButton(
              onPressed: () => _showModalBottomSheet(context),
              child: Text("Show ModalBottomSheet"),
            ),
          ],
        ),
      ),
    );
  }
}
