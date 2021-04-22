import 'package:flutter/material.dart';
import 'package:news_api_internship_project/news.dart';

class AfterOpened extends StatefulWidget {
  final String recordName;
  final String record;
  const AfterOpened(this.recordName, this.record);

  @override
  _AfterOpenedState createState() => _AfterOpenedState();
}

class _AfterOpenedState extends State<AfterOpened> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            brightness: Brightness.light,
            centerTitle: true,
            // ignore: unnecessary_statements

            title: Text(
              "News-Report",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: my),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.recordName,
                      style: TextStyle(
                        fontSize: 30,
                      )),
                ),
                Divider(),
                Text(widget.record,
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ));
  }
}
