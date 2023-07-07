import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Widget/widgets_reutilizables.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: [
                registro(
                  text: "Email",
                  icon: Icons.person,
                  isPassword: false,
                  controller: _emailController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                registro(
                  text: "Contraseña",
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _passwordController,
                  context: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                botonIngresar(
                 context, true, (){
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      )
                      .then((value) {
                        context.go('/home');
                      })
                      ;
                 }
                ),
                botonCrearCuenta(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row botonCrearCuenta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "¿No tienes cuenta? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
           
            context.go('/singup');
          },
          child: const Text(
            "Crea una",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}