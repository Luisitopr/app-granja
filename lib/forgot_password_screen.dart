import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _emailSent = false; // Estado para cambiar la pantalla
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF236D4C), // Fondo verde
      body: SafeArea(
        child: Column(
          children: [
            // Sección superior con imagen y título
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (!_emailSent)
                    Image.asset('assets/ovejatriste.png', height: 120), // Oveja triste
                  if (_emailSent)
                    Image.asset('assets/ovejafeliz.png', height: 120), // Oveja feliz
                  const SizedBox(height: 20),
                  Text(
                    _emailSent
                        ? "Return to the beginning and login"
                        : "You don’t remember the password?",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Sección del formulario
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Enter your Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Botón dinámico (Send / Back to Login)
                    ElevatedButton(
                      onPressed: () {
                        if (!_emailSent) {
                          setState(() {
                            _emailSent = true;
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF236D4C),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        _emailSent ? "Back to Login" : "Send",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Mensaje de confirmación cuando se envía el correo
                    if (_emailSent)
                      Row(
                        children: const [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Check your email, there you can reset your password",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
