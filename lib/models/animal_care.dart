class AnimalCare {
  final String animal;
  final int age;
  final int quantity;
  final String careDetails;
  bool isExpanded; // Para controlar si se muestra la información

  AnimalCare({
    required this.animal,
    required this.age,
    required this.quantity,
    required this.careDetails,
    this.isExpanded = false, // Inicialmente oculta
  });
}

// Lista de ejemplo con información de cuidado de animales
List<AnimalCare> sampleAnimalCare = [
  AnimalCare(
    animal: "Cow",
    age: 3,
    quantity: 10,
    careDetails:
        "Para el cuidado adecuado de las vacas, es importante proporcionar un ambiente limpio, agua fresca y una dieta equilibrada rica en fibra y minerales. También se recomienda revisiones veterinarias periódicas para garantizar su bienestar.",
  ),
  AnimalCare(
    animal: "Sheep",
    age: 2,
    quantity: 5,
    careDetails:
        "Las ovejas requieren un refugio adecuado, acceso a agua limpia y una alimentación basada en pasto y heno. Además, es importante esquilarlas periódicamente y desparasitarlas.",
  ),
  AnimalCare(
    animal: "Chicken",
    age: 1,
    quantity: 20,
    careDetails:
        "Las gallinas deben vivir en gallineros protegidos de depredadores, recibir alimentación balanceada con granos y calcio, y contar con iluminación adecuada para la puesta de huevos.",
  ),
];
