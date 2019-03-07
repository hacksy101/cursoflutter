import 'package:sqflite/sqflite.dart';
final String bookTable ="book";
final String columnId = "_id";
final String columnTitle = "title";
final String columnAuthor = "author";

class Book {
  int id;
  String title;
  String author;
  Book();
  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      columnTitle: title,
      columnAuthor: author,
    };

    if(id!=null){
      map[columnId] = id;
    }
    return map;
  }
  Book.from(Map<String,dynamic> record){
    id=record[columnId];
    title=record[columnTitle];
    author=record[columnAuthor];
  }
}

class BookProvider {
  Database db;
  Future open() async {
    db = await openDatabase("book.db",
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
      create table $bookTable(
      $columnId integer primary key autoincrement,
      $columnTitle text not null,
      $columnAuthor text not null
       ) 
       ''');
print('''
      create table $bookTable(
      $columnId integer primary key autoincrement,
      $columnTitle text not null,
      $columnAuthor text not null,
       ) 
       ''');
      },);
  }

  Future close() async{
    db.close();
  }

  Future<Book> insert(Book book) async{
    book.id = await db.insert(bookTable, book.toMap());
    return book;
  }

  Future<int> delete(int id) async{
    return await db.delete(bookTable,where:'$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Book book) async{
    return await db.update(bookTable, book.toMap(),
        where:'$columnId = ?', whereArgs: [book.id]
    );
  }
  Future<List<Book>> getBooks() async{
    List<Book> bookList = List<Book>();
    List<Map> bookDbList = await db.query(bookTable);
    bookDbList.forEach((record){
      bookList.add(Book.from(record));
    });
    return bookList;
  }
}
