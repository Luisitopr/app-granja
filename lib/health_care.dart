import 'package:flutter/material.dart';
import '../models/animal.dart';

class HealthCareScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900, // Fondo verde oscuro
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.black), // Icono de logout
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagen superior centrada
          Center(
            child: Image.asset(
              'assets/cow.png', // Imagen de referencia
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          // Si no hay animales, muestra el mensaje
          sampleAnimals.isEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                        endIndent: 8,
                      ),
                    ),
                    const Text(
                      "You have no registered animals",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black,
                        indent: 8,
                      ),
                    ),
                  ],
                )
              : _buildAnimalTable(context),

          const SizedBox(height: 40),

          // Botón "Register"
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register_home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Color del botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: const Text(
              "Register",
              style: TextStyle(
                color: Colors.white, // Texto en blanco
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16), // Espaciado entre botones

          // Botón "Other"
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/health_care_result');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey, // Color diferente para el botón
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: const Text(
              "Other",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20,
          headingRowColor: MaterialStateColor.resolveWith((states) => Colors.green.shade200),
          border: TableBorder.all(color: Colors.black26),
          columns: const [
            DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Species", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Breed", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Qty", style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text("Care", style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: sampleAnimals
              .map(
                (animal) => DataRow(cells: [
                  DataCell(Text(animal.name)),
                  DataCell(Text(animal.species)),
                  DataCell(Text(animal.breed)),
                  DataCell(Text(animal.quantity.toString())),
                  DataCell(
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/health_care_result');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8), // Más pequeño
                      ),
                      child: const Text(
                        "Care",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14, // Letra más pequeña
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
