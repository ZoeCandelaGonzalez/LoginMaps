import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../Widget/widgets_reutilizables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nombreTextController = TextEditingController();
  final TextEditingController _apellidoTextController = TextEditingController();
  final TextEditingController _fechaTextController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.white.withOpacity(0.3),
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
           context.go ('/signin');
          },
        ),
        title: Text(
          "Regístrate",
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 97, 26, 168),
              Color(0xff906EF5),
              Color(0xff6989F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Nombre",
                  icon: Icons.person_outline,
                  isPassword: false,
                  controller: _nombreTextController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Apellido",
                  icon: Icons.person_outline,
                  isPassword: false,
                  controller: _apellidoTextController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Fecha Nacimiento",
                  icon: Icons.date_range,
                  isPassword: false,
                  controller: _fechaTextController,
                  context: context,
                  isFecha: true,
                  onDateSelected: (selectedDate) {
                    final formattedDate =
                        DateFormat('dd-MM-yyyy').format(selectedDate);
                    setState(() {
                      _fechaTextController.text = formattedDate;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Email",
                  icon: Icons.person_outline,
                  isPassword: false,
                  controller: _emailTextController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Contraseña",
                  icon: Icons.lock_outlined,
                  isPassword: true,
                  controller: _passwordTextController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                botonIngresar(
                  context,
                  false,
                  () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    )
                        .then((value) {
                      context.go('/home');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}