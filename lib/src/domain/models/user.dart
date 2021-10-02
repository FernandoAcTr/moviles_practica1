import 'dart:convert';

class User {
  String? nombre;
  String? aPaterno;
  String? aMaterno;
  String? email;
  String? telefono;
  String? foto;
  String? about;
  int? id;

  User({
    this.id,
    this.nombre,
    this.aPaterno,
    this.aMaterno,
    this.email,
    this.telefono,
    this.foto,
    this.about,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        aPaterno: json["a_paterno"] == null ? null : json["a_paterno"],
        aMaterno: json["a_materno"] == null ? null : json["a_materno"],
        email: json["email"] == null ? null : json["email"],
        telefono: json["telefono"] == null ? null : json["telefono"],
        foto: json["foto"] == null ? null : json["foto"],
        about: json["about"] == null ? null : json["about"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "a_paterno": aPaterno,
        "a_materno": aMaterno,
        "email": email,
        "telefono": telefono,
        "foto": foto,
        "about": about,
      };

  User copyWith({
    int? id,
    String? nombre,
    String? aPaterno,
    String? aMaterno,
    String? email,
    String? telefono,
    String? foto,
    String? about,
  }) =>
      User(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        aPaterno: aPaterno ?? this.aPaterno,
        aMaterno: aMaterno ?? this.aMaterno,
        email: email ?? this.email,
        telefono: telefono ?? this.telefono,
        foto: foto ?? this.foto,
        about: about ?? this.about,
      );
}
