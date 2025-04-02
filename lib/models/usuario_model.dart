class Usuario {
  String name;
  String username;
  String email;
  String registrationDate;
  String profileImage;

  // Constructor
  Usuario({
    required this.name,
    required this.username,
    required this.email,
    required this.registrationDate,
    required this.profileImage,
  });

  // Método toJson para convertir el objeto a mapa
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'registrationDate': registrationDate,
      'profileImage': profileImage,
    };
  }
}
