class AnimalDiet {
  final String animal;
  final int age;
  final int quantity;
  final String dietDetails;
  bool isExpanded; // Para controlar si se muestra la información

  AnimalDiet({
    required this.animal,
    required this.age,
    required this.quantity,
    required this.dietDetails,
    this.isExpanded = false, // Inicialmente oculta
  });
}

// Lista de ejemplo con información de dieta de animales
List<AnimalDiet> sampleAnimalDiet = [
  AnimalDiet(
    animal: "Cow",
    age: 3,
    quantity: 10,
    dietDetails:
        "Las vacas necesitan una dieta rica en fibra como pasto y heno. También pueden consumir suplementos minerales para mejorar su salud.",
  ),
  AnimalDiet(
    animal: "Sheep",
    age: 2,
    quantity: 5,
    dietDetails:
        "Las ovejas deben consumir heno de alta calidad y granos en pequeñas cantidades para una dieta equilibrada.",
  ),
  AnimalDiet(
    animal: "Chicken",
    age: 1,
    quantity: 20,
    dietDetails:
        "Las gallinas necesitan una alimentación basada en granos, proteínas y calcio para una buena producción de huevos.",
  ),
];
