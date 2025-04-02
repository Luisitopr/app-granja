class Animal {
  final String name;
  final String species;
  final String breed;
  final int quantity;

  Animal({
    required this.name,
    required this.species,
    required this.breed,
    required this.quantity,
  });
}

// Lista hardcodeada de animales para pruebas
List<Animal> sampleAnimals = [
  Animal(name: "Luna", species: "Cow", breed: "Holstein", quantity: 10),
  Animal(name: "Max", species: "Sheep", breed: "Merino", quantity: 5),
  Animal(name: "Bella", species: "Chicken", breed: "Leghorn", quantity: 20),
];
