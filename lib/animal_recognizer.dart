import 'package:flutter/material.dart';

class AnimalRecognizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF236D4C), // Fondo verde agua del mockup
      appBar: AppBar(
        title: Text(
          'Animal Recognizer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E1E1E), // Fondo gris oscuro en la parte superior
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.logout, color: Colors.white), // Icono de logout en blanco
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            children: [
              // Logo en la parte superior
              Image.asset(
                'assets/livestock.png',
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),

              // Texto principal
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'This recognizer helps to identify what type of breed your animal is according to its characteristics',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Contenedor blanco con los botones
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Botón de cámara
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/animal_recognizer_result');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(20),
                        elevation: 5,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 80,
                        color: Color(0xFF226A5C), // Verde oscuro del mockup
                      ),
                    ),
                    SizedBox(height: 20),

                    // Texto debajo del botón
                    Text(
                      'Please, take a photo of your animal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
