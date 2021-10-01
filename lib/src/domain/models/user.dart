import 'dart:convert';

class User {
  String? nombre;
  String? aPaterno;
  String? aMaterno;
  String? email;
  String? telefono;

  User({
    this.nombre,
    this.aPaterno,
    this.aMaterno,
    this.email,
    this.telefono,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        nombre: json["nombre"] == null ? null : json["nombre"],
        aPaterno: json["a_paterno"] == null ? null : json["a_paterno"],
        aMaterno: json["a_materno"] == null ? null : json["a_materno"],
        email: json["email"] == null ? null : json["email"],
        telefono: json["telefono"] == null ? null : json["telefono"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre == null ? null : nombre,
        "a_paterno": aPaterno == null ? null : aPaterno,
        "a_materno": aMaterno == null ? null : aMaterno,
        "email": email == null ? null : email,
        "telefono": telefono == null ? null : telefono,
      };
}
