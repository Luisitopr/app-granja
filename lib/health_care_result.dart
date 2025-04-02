import 'package:flutter/material.dart';
import '../models/animal_care.dart'; // Importamos el modelo

class HealthCareResultScreen extends StatefulWidget {
  @override
  _HealthCareResultScreenState createState() => _HealthCareResultScreenState();
}

class _HealthCareResultScreenState extends State<HealthCareResultScreen> {
  String? selectedAnimal;
  List<AnimalCare> _filteredAnimalCare = [];

  @override
  void initState() {
    super.initState();
    _filteredAnimalCare = List.from(sampleAnimalCare); // Inicialmente, mostrar todos los datos
  }

  void _filterAnimals(String? animal) {
    setState(() {
      selectedAnimal = animal;
      if (animal == null || animal.isEmpty) {
        _filteredAnimalCare = List.from(sampleAnimalCare);
      } else {
        _filteredAnimalCare = sampleAnimalCare.where((care) => care.animal == animal).toList();
      }
    });
  }

  void toggleExpansion(int index) {
    setState(() {
      _filteredAnimalCare[index].isExpanded = !_filteredAnimalCare[index].isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 109, 76),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 109, 76),
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
            "Animal Care Information",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Dropdown para seleccionar el animal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: selectedAnimal,
                isExpanded: true,
                hint: const Text("Select an animal"),
                underline: SizedBox(), // Elimina la línea del Dropdown
                items: [
                  const DropdownMenuItem(value: null, child: Text("All Animals")),
                  ...sampleAnimalCare
                      .map((care) => care.animal)
                      .toSet() // Evita duplicados
                      .map((animal) => DropdownMenuItem(
                            value: animal,
                            child: Text(animal),
                          ))
                      .toList(),
                ],
                onChanged: _filterAnimals,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: _filteredAnimalCare.isEmpty
                ? const Center(
                    child: Text(
                      "No care information available.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredAnimalCare.length,
                    itemBuilder: (context, index) {
                      final animalCare = _filteredAnimalCare[index];
                      return Column(
                        children: [
                          _buildCareRow(animalCare, index),
                          if (animalCare.isExpanded) _buildCareDetails(animalCare),
                          const SizedBox(height: 16),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Aquí puedes agregar funcionalidad para agregar datos
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCareRow(AnimalCare animalCare, int index) {
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
          // Información del animal
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Animal: ${animalCare.animal}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text("Age: ${animalCare.age} years"),
              Text("Quantity: ${animalCare.quantity}"),
            ],
          ),

          // Botón "+"
          IconButton(
            icon: Icon(animalCare.isExpanded ? Icons.remove : Icons.add, color: Colors.green),
            onPressed: () => toggleExpansion(index),
          ),
        ],
      ),
    );
  }

  Widget _buildCareDetails(AnimalCare animalCare) {
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
          // Imagen a la izquierda
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/cow.png', // Imagen de referencia
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 16),
          // Texto a la derecha
          Expanded(
            child: Text(
              animalCare.careDetails,
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
