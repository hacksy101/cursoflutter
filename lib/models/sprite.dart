class Sprite {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;

  Sprite({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprite.fromJson(Map<String, String> jsonObject){
    print(jsonObject);
    return Sprite(
      backDefault: jsonObject['back_default'],
      backFemale: jsonObject['back_female'],
      backShiny: jsonObject['back_shiny'],
      backShinyFemale: jsonObject['back_shiny_female'],
      frontDefault: jsonObject['front_default'],
      frontFemale: jsonObject['front_female'],
      frontShiny: jsonObject['front_shiny'],
      frontShinyFemale: jsonObject['front_shiny_female'],
    );
  }


}
