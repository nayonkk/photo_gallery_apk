import 'package:flutter/material.dart';

class full_images extends StatelessWidget {
  const full_images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
