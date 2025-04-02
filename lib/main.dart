import 'package:flutter/material.dart';
import 'package:flutter_application_1/animal_recognizer_result.dart';
import 'package:flutter_application_1/diet_monitoring_result.dart';
import 'package:flutter_application_1/health_care.dart';
import 'package:flutter_application_1/health_care_result.dart';
import 'package:flutter_application_1/register_register.dart';
import 'package:flutter_application_1/singup_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
import 'animal_recognizer.dart';
import 'diet_monitoring.dart';
import 'register_home.dart';
import 'forgot_password_screen.dart';
import 'climate_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/animal_recognizer': (context) => AnimalRecognizerScreen(),
        '/diet_monitoring': (context) => DietMonitoringScreen(),
        '/register_home': (context) => RegisterHomeScreen(),
        '/signup': (context) => SignUpScreen(), 
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/health_care': (context) => HealthCareScreen(),
        '/register_register': (context) => RegisterRegisterScreen(),
        '/animal_recognizer_result': (context) => AnimalRecognizerResultScreen(),
        '/diet_monitoring_result': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as String; // Recuperando el nombre del animal
          return DietMonitoringResultScreen(animalName: args);
        },
        '/health_care_result': (context) => HealthCareResultScreen(),
        '/climate': (context) => ClimateScreen(),
        '/login_screen': (context) => LoginScreen(),
      },
    );
  }
}
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF236D4C), // Color de fondo
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/logo.png', height: 200), // Logo
            const Text(
              'FARM WISE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(
              color: Colors.red,
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_screen'); // Navega a Login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: const Text('LOGIN', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup'); // Navega a Register
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.white),
                  ),
                  child: const Text('REGISTER', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/animals.png', height: 200), // Imagen de animales
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
