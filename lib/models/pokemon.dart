import 'dart:convert';

import 'package:pokeapi/models/sprite.dart';

class Pokemon{
  final String name;
  final int id;
  final Sprite sprites;
  Pokemon({this.name, this.id, this.sprites});

  factory Pokemon.fromJson(Map<dynamic,dynamic> jsonObject){
    return Pokemon(
      name: jsonObject['name'],
      id: jsonObject['id'],
     // sprites: Sprite.fromJson(json.decode(jsonObject['sprites'])),
    );
  }
}