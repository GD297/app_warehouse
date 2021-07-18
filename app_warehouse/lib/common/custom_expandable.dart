import 'package:flutter/material.dart';

class CustomExpandable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          backgroundColor: Colors.yellow[50],
          title: Text(
            'Coffee',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffee species.',
                style: TextStyle(fontSize: 15),
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
