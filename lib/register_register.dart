import 'package:flutter/material.dart';
import '../models/animal.dart';

class RegisterRegisterScreen extends StatefulWidget {
  @override
  _RegisterRegisterScreenState createState() => _RegisterRegisterScreenState();
}

class _RegisterRegisterScreenState extends State<RegisterRegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController speciesController = TextEditingController();
  final TextEditingController breedController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  void registerAnimal() {
    final String name = nameController.text;
    final String species = speciesController.text;
    final String breed = breedController.text;
    final int quantity = int.tryParse(quantityController.text) ?? 0;

    if (name.isNotEmpty && species.isNotEmpty && breed.isNotEmpty && quantity > 0) {
      setState(() {
        sampleAnimals.add(Animal(
          name: name,
          species: species,
          breed: breed,
          quantity: quantity,
        ));
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Animal registered successfully!")),
      );

      nameController.clear();
      speciesController.clear();
      breedController.clear();
      quantityController.clear();

      // Redirige a RegisterHomeScreen
      Navigator.pushReplacementNamed(context, '/register_home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236D4C), // Color actualizado
      appBar: AppBar(
        backgroundColor: const Color(0xFF236D4C), // Color actualizado
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/register.png', height: 120),
                  const SizedBox(height: 20),
                  const Text(
                    "Register the animal",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildFormField("Name", nameController),
                      const SizedBox(height: 15),
                      _buildFormField("Species", speciesController),
                      const SizedBox(height: 15),
                      _buildFormField("Breed", breedController),
                      const SizedBox(height: 15),
                      _buildFormField("Number of animals", quantityController, isNumber: true),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: registerAnimal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF236D4C), // Color actualizado
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Register", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            keyboardType: isNumber ? TextInputType.number : TextInputType.text,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
