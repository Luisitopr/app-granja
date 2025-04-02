import 'package:flutter/material.dart';
import '../models/animal.dart'; // Asegúrate de que tienes este modelo

class DietMonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236D4C), // Fondo verde actualizado
      appBar: AppBar(
        backgroundColor: Color(0xFF236D4C), // Fondo verde actualizado
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/rice.png',
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

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
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/register_home');
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

  Widget _buildAnimalTable(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20,
          headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xFF236D4C)), // Color verde actualizado para los encabezados
          border: TableBorder.all(
            color: Colors.transparent,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          dataRowHeight: 60, // Aumenta la altura de las filas para mejorar la legibilidad
          headingTextStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Roboto', // Fuente personalizada para los encabezados
          ),
          dataTextStyle: TextStyle(
            color: Colors.black87,
            fontFamily: 'Roboto', // Fuente personalizada para los datos
            fontSize: 16,
          ),
          columns: const [
            DataColumn(label: Text("Name", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text("Species", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text("Breed", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text("Qty", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text("Diet", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
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
                        Navigator.pushNamed(
                          context,
                          '/diet_monitoring_result',
                          arguments: animal.name, // Pasamos el nombre del animal
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        elevation: 5, // Agregar sombra para darle profundidad
                      ),
                      child: const Text(
                        "Diet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
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
