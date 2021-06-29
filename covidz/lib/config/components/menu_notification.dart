import 'package:covidz/config/config.dart';
import 'package:flutter/material.dart';

class HomeNotification extends StatelessWidget {
  @required
  final String title;
  @required
  final String notifContent;
  const HomeNotification({
    this.title,
    this.notifContent,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dismissible(
      key: ValueKey('key'),
      child: Container(
        width: size.width - 40,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
          color: notifOrange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(width: 12),
            Container(
              width: size.width - 40 - 25 - 24 - 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    notifContent,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textWidthBasis: TextWidthBasis.longestLine,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
