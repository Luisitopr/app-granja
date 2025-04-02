import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../models/usuario_model.dart'; // Importa el modelo de usuario

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Crear un usuario de ejemplo
 // En HomeScreen
 Usuario currentUser = Usuario(
  name: "Usuario Ejemplo",
  username: "Usuario123",
  email: "usuario@email.com",
  registrationDate: "01/01/2024",
  profileImage: "assets/usuario.png",  // Asegúrate de tener esta imagen en los assets
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF236D4C),
      drawer: _buildUserProfileDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset('assets/logo.png', height: 230),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCategoryButton(context, "Animals", Color(0xFF44D7A8), "/home"),
                  SizedBox(width: 10),
                  _buildCategoryButton(context, "Climate", Color(0xFF44D7A8), "/climate"),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Services",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildGridButton(context, 'Animal Recognizer', 'assets/livestock.png', '/animal_recognizer'),
                    _buildGridButton(context, 'Diet Monitoring', 'assets/rice.png', '/diet_monitoring'),
                    _buildGridButton(context, 'Animal Register', 'assets/register.png', '/register_register'),
                    _buildGridButton(context, 'Health and Care', 'assets/cow.png', '/health_care'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF236D4C),
            ),
            accountName: Text(currentUser.name),
            accountEmail: Text(currentUser.email),
            currentAccountPicture: GestureDetector(
              onTap: () {
                // Aquí puedes abrir una galería para cambiar la foto
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(currentUser.profileImage),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Nombre de usuario"),
            subtitle: Text(currentUser.username),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Fecha de Registro"),
            subtitle: Text(currentUser.registrationDate),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Correo Electrónico"),
            subtitle: Text(currentUser.email),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Cerrar sesión", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/login_screen");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String text, Color color, String route) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Image.asset(
              imagePath,
              height: 60,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
