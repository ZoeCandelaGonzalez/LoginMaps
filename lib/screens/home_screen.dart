import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../database/user.dart';
import '../models/user.dart' as modelo; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final dao = UserDao(); 
   List <modelo.User> users = [];

  @override
  void initState()  {   
    super.initState();   
    cargarRegistros();
  }

  cargarRegistros() async{
    users = await dao.getAll();
    log(users.length.toString());
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
        Container(
          margin: const EdgeInsets.only(top: 200),
          child: ListView(
            children: [ 
              
          const BotonesContacto(),
     
            UltimosAccesos(
              usuarios: users,
            ),
            ]
          ),
        ),
        
        
        const Header(
        
        ),
       
  
        ],

      )
    );
  }
}
class UltimosAccesos extends StatelessWidget {
  const UltimosAccesos({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  final List<modelo.User> usuarios;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 97, 26, 168),
            Color(0xff906EF5),
            Color(0xff6989F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              'Últimos Accesos',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: usuarios.map((e) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${e.name} ${e.apellido}',
                                style: TextStyle(fontSize: 24, color: Colors.white.withOpacity(0.5)),
                              ),
                             
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(Icons.supervised_user_circle, color: Colors.white.withOpacity(0.2))
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        const _HeaderBackground(),

        Positioned(
          top: -45,
          left: -45,
            child: Icon( Icons.grid_view_rounded, size: 200, color: Colors.white.withOpacity(0.1),) 
            ), 
            

            Column(
              children: [
                const SizedBox(
                 height: 50,
                 width: double.infinity,
                ),
                Text('Bienvenido', style: TextStyle(fontSize: 40, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),), 
                const SizedBox( height: 20,), 
                Text('Contáctanos ', style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),), 
                const SizedBox( height: 20,), 

              ],

            ),
            
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)), 
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
    );
  }
}


class BotonesContacto extends StatelessWidget {
  const BotonesContacto({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
           
            context.go('/mapa');
          },
      child: Stack
      (children: [
    
        const _BotonMapa(), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 140,
              width: 40,
            ), 
            Icon(Icons.map_outlined, color: Colors.white.withOpacity(0.5),), 
            const SizedBox(width: 20), 
            Expanded(child: Text('Nuestas Sucursales', style: TextStyle(color: Colors.white.withOpacity(0.5)),
            )), 
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.5),),
            const SizedBox(width: 40)
          ],
         ), 
    
      ] 
      
      ),
    );
    
  }
}



class _BotonMapa extends StatelessWidget {
  const _BotonMapa();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), 
        gradient:  const LinearGradient(
            colors: [
              Color.fromARGB(255, 97, 26, 168),
              Color(0xff906EF5),
              Color(0xff6989F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack( 
          children: [
            Positioned(
              right:- 20,
              top:-20,
              child: Icon(Icons.map_outlined, size:  150, color: Colors.white.withOpacity(0.2))
            ), 
             ],
        ),
      )
    );
  }
}