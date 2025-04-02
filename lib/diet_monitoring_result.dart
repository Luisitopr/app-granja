import 'package:flutter/material.dart';
import '../models/animal_diet.dart'; // Asegúrate de que tienes este modelo

class DietMonitoringResultScreen extends StatefulWidget {
  final String animalName;

  const DietMonitoringResultScreen({Key? key, required this.animalName}) : super(key: key);

  @override
  _DietMonitoringResultScreenState createState() => _DietMonitoringResultScreenState();
}

class _DietMonitoringResultScreenState extends State<DietMonitoringResultScreen> {
  late List<AnimalDiet> _filteredAnimalDiet;

  @override
  void initState() {
    super.initState();
    // Filtramos la dieta del animal seleccionado
    _filteredAnimalDiet = sampleAnimalDiet.where((diet) => diet.animal == widget.animalName).toList();
  }

  void toggleExpansion(int index) {
    setState(() {
      _filteredAnimalDiet[index].isExpanded = !_filteredAnimalDiet[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236D4C), // El nuevo verde
      appBar: AppBar(
        backgroundColor: Color(0xFF236D4C), // También en la AppBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Animal Diet Information",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: _filteredAnimalDiet.isEmpty
                ? const Center(
                    child: Text(
                      "No diet information available.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredAnimalDiet.length,
                    itemBuilder: (context, index) {
                      final animalDiet = _filteredAnimalDiet[index];
                      return Column(
                        key: ValueKey(animalDiet.animal),
                        children: [
                          _buildDietRow(animalDiet, index),
                          if (animalDiet.isExpanded) _buildDietDetails(animalDiet),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDietRow(AnimalDiet animalDiet, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Animal: ${animalDiet.animal}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("Age: ${animalDiet.age} years"),
              Text("Quantity: ${animalDiet.quantity}"),
            ],
          ),
          IconButton(
            icon: Icon(animalDiet.isExpanded ? Icons.remove : Icons.add, color: Color(0xFF236D4C)), // El nuevo verde
            onPressed: () => toggleExpansion(index),
          ),
        ],
      ),
    );
  }

  Widget _buildDietDetails(AnimalDiet animalDiet) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF236D4C), // El nuevo verde
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/rice.png', // Imagen de referencia
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              animalDiet.dietDetails,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
