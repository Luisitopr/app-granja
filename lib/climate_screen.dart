import 'package:flutter/material.dart';
import '../models/climate_animal.dart'; // Importamos el modelo Animal

class ClimateScreen extends StatefulWidget {
  @override
  _ClimateScreenState createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  String location = "New York"; // Simulamos una ubicación
  String temperature = "22°C"; // Simulamos la temperatura
  String humidity = "60%"; // Simulamos la humedad
  String condition = "Clear"; // Simulamos la condición climática
  bool showRecommendation = false; // Para controlar la visualización de las recomendaciones

  List<Animal> recommendedAnimals = []; // Lista para animales recomendados

  @override
  void initState() {
    super.initState();
    // Simulamos la lista de animales, puedes ajustar según lo que necesites.
    recommendedAnimals = [
      Animal(
        name: "Chicken",
        description: "Chickens are hardy in warm weather.",
        isSuitableForClimate: true,
        careInstructions: [
          "Provide shaded areas during extreme heat.",
          "Ensure access to plenty of fresh water."
        ],
      ),
      Animal(
        name: "Goat",
        description: "Goats thrive in warm weather but can tolerate mild cold.",
        isSuitableForClimate: true,
        careInstructions: [
          "Ensure access to shelter during heavy rain.",
          "Provide dry bedding during wet conditions."
        ],
      ),
      Animal(
        name: "Duck",
        description: "Ducks are perfect for rainy conditions and thrive in wet environments.",
        isSuitableForClimate: true,
        careInstructions: [
          "Ensure they have access to clean water.",
          "Keep them sheltered from strong winds."
        ],
      ),
      Animal(
        name: "Buffalo",
        description: "Buffaloes thrive in humid and rainy environments.",
        isSuitableForClimate: false,
        careInstructions: [
          "Provide access to cool, shaded areas.",
          "Ensure they have a large water source."
        ],
      ),
    ];
  }

  void _getRecommendations() {
    setState(() {
      showRecommendation = true; // Mostramos las recomendaciones
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236D4C), // Fondo verde
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Menú y logo centrado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset('assets/logo.png', height: 80), // Logo centrado
                    ),
                  ),
                  SizedBox(width: 48), // Espacio para balancear el ícono
                ],
              ),

              SizedBox(height: 20),

              // Simulamos la ubicación y los datos climáticos
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location: $location", style: TextStyle(fontSize: 18)),
                    Text("Temperature: $temperature", style: TextStyle(fontSize: 18)),
                    Text("Humidity: $humidity", style: TextStyle(fontSize: 18)),
                    Text("Condition: $condition", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10),
                    Text(
                      "Your climatic zone does not affect the health of your animals.",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Botón Recommendations
              ElevatedButton(
                onPressed: _getRecommendations,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Recommendations",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),

              SizedBox(height: 20),

              // Muestra las recomendaciones cuando el usuario presiona el botón
              if (showRecommendation)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Animals suitable for your climate:", style: TextStyle(fontSize: 18)),
                      SizedBox(height: 10),
                      // Listamos los animales recomendados
                      for (var animal in recommendedAnimals)
                        ListTile(
                          title: Text(animal.name),
                          subtitle: Text(animal.description),
                          trailing: Icon(
                            animal.isSuitableForClimate
                                ? Icons.check_circle
                                : Icons.error,
                            color: animal.isSuitableForClimate ? Colors.green : Colors.red,
                          ),
                          onTap: () {
                            if (!animal.isSuitableForClimate) {
                              _showCareInstructions(context, animal);
                            }
                          },
                        ),
                    ],
                  ),
                ),

              SizedBox(height: 20),

              // Botón para regresar
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Muestra los cuidados para los animales que no son aptos para el clima
  void _showCareInstructions(BuildContext context, Animal animal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(animal.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: animal.careInstructions
                .map((instruction) => Text(instruction))
                .toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
