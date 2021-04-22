import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_api_internship_project/opened.dart';
import 'package:web_scraper/web_scraper.dart';

Dio dio = Dio();
var lengthh;
var data;
var info;
Color my = Color(0xFFBA68CA);
newsnogeet() async {
  var response = await dio.get('https://hubblesite.org/api/v3/news');
  lengthh = response.data.length;
  data = response.data;
  print(data);
}

webscraping(String address) async {
  final webScraper = WebScraper('https://hubblesite.org');
  print('object1');
  if (await webScraper.loadWebPage(address)) {
    var response = webScraper.getElementTitle('div > p ');
    info = response.toString().substring(83);
    return (info);
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

bool _loading = true;

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _loading = false;
      });
    });
    newsnogeet();
  }

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
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Container(
              color: Colors.white,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.8),
                  scrollDirection: Axis.horizontal,
                  pageSnapping: true,
                  itemBuilder: (context, position) {
                    return Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 100.0 * 80,
                        width: MediaQuery.of(context).size.width / 100.0 * 75,
                        child: Container(
                          padding: EdgeInsets.all(13),
                          color: Colors.purple[100],
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                    Text('Date: ' + data[position]['news_id']),
                              ),
                              Divider(),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  data[position]['name'],
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(),
                              FutureBuilder(
                                future: webscraping(
                                    data[position]['url'].substring(22)),
                                builder: (context, snapshot) {
                                  var data = snapshot.data.toString();

                                  return Flexible(
                                      child: Container(
                                    child: Text(
                                      data,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ));
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AfterOpened(
                                                data[position]['name'], info)));
                                  },
                                  child: Text('Continue Reading'))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: lengthh),
            ),
    );
  }
}
