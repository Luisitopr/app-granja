import 'package:flutter/material.dart';
import '../models/animal.dart';

class RegisterHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900, // Fondo verde oscuro
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.black), // Icono de logout
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
              'assets/register.png',
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          // Si no hay animales, muestra un mensaje
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
              : _buildAnimalTable(),

          const SizedBox(height: 40),

          // Botón de "Register"
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register_register');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: const Text(
              "Register",
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

  Widget _buildAnimalTable() {
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
          ],
          rows: sampleAnimals
              .map(
                (animal) => DataRow(cells: [
                  DataCell(Text(animal.name)),
                  DataCell(Text(animal.species)),
                  DataCell(Text(animal.breed)),
                  DataCell(Text(animal.quantity.toString())),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
