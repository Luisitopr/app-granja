class Animal {
  String name;
  String description;
  bool isSuitableForClimate;
  List<String> careInstructions;

  Animal({
    required this.name,
    required this.description,
    required this.isSuitableForClimate,
    required this.careInstructions,
  });
}

class RecommendationModel {
  static List<Animal> getAnimalsForClimate(String condition) {
    // Lista de animales con sus características y cuidados
    List<Animal> animals = [
      Animal(
        name: "Chicken",
        description: "Chickens are hardy in warm weather.",
        isSuitableForClimate: condition.contains("clear") || condition.contains("sun"),
        careInstructions: [
          "Provide shaded areas during extreme heat.",
          "Ensure access to plenty of fresh water."
        ],
      ),
      Animal(
        name: "Goat",
        description: "Goats thrive in warm weather but can tolerate mild cold.",
        isSuitableForClimate: condition.contains("clear") || condition.contains("sun"),
        careInstructions: [
          "Ensure access to shelter during heavy rain.",
          "Provide dry bedding during wet conditions."
        ],
      ),
      Animal(
        name: "Duck",
        description: "Ducks are perfect for rainy conditions and thrive in wet environments.",
        isSuitableForClimate: condition.contains("rain") || condition.contains("storm"),
        careInstructions: [
          "Ensure they have access to clean water.",
          "Keep them sheltered from strong winds."
        ],
      ),
      Animal(
        name: "Buffalo",
        description: "Buffaloes thrive in humid and rainy environments.",
        isSuitableForClimate: condition.contains("rain") || condition.contains("storm"),
        careInstructions: [
          "Provide access to cool, shaded areas.",
          "Ensure they have a large water source."
        ],
      ),
    ];

    return animals;
  }
}
