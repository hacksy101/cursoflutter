import 'package:flutter/material.dart';
import 'package:sqlite_app/book.dart';

typedef BookCallback(Book book);
class FormWidget extends StatelessWidget {

  FormWidget({this.callback,book});
  final BookCallback callback;
  final _formKey = GlobalKey<FormState>();
  Book _book;
  @override
  Widget build(BuildContext context) {
    _book= Book();
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                hintText: "Nombre de libro",
            ),
            validator: (String value){
              if(value.isEmpty){
                return "El nombre del libro no puede estar vacio";
              }
            },
            onSaved: (String value){
              _book.title =value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Nombre de author",
            ),
            validator: (String value){
              if(value.isEmpty){
                return "El author no puede estar vacio";
              }
            },
            onSaved: (String value){
              _book.author =value;
            },
          ),
          RaisedButton(
            child: Text("Guardar"),
            onPressed: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
                if(this.callback!=null){
                  this.callback(_book);
                }
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Registro guardado correctamente")),
                );
              }else{
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Se encontraron errores en el formulario")),
                );
              }

            },
          )
        ],
      ),
    );
  }
}
