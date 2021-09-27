import 'dart:convert';

class Nota {
  int? id;
  String? titulo;
  String? detalle;

  Nota({
    this.id,
    this.titulo,
    this.detalle,
  });

  factory Nota.fromJson(String str) => Nota.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nota.fromMap(Map<String, dynamic> json) => Nota(
        id: json["id"],
        titulo: json["titulo"],
        detalle: json["detalle"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "detalle": detalle,
      };
}
