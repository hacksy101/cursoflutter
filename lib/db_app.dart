import 'package:flutter/material.dart';
import 'package:sqlite_app/book.dart';
import 'package:sqlite_app/form_widget.dart';

class DBApp extends StatefulWidget {
  @override
  DBAppState createState() {
    return new DBAppState();
  }
}

class DBAppState extends State<DBApp> {
  BookProvider bp = BookProvider();

  @override
  void initState() {
    super.initState();
    bp.open();
  }

  @override
  void dispose() {
    super.dispose();
    bp.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          FormWidget(
            callback: (Book book) {
              setState(() {
                bp.insert(book);
              });
            },
          ),
          FutureBuilder<List<Book>>(
            future: bp.getBooks(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int position) {
                    return ListTile(
                      title: Text(snapshot.data[position].title),
                      subtitle: Text(snapshot.data[position].author),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
