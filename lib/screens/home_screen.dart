import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
        Container(
          margin: EdgeInsets.only(top: 200),
          child: ListView(
            children: [ 
              
          BotonesContacto(),
          _Instagram(),
            UltimosAccesos(),
            ]
          ),
        ),
        
        
        Header(
        
        ),
       
  
        ],

      )
    );
  }
}

class UltimosAccesos extends StatelessWidget {
  const UltimosAccesos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder
    (
      color: Colors.red,
    );
    
  }
}



class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        _HeaderBackground(),

        Positioned(
          top: -45,
          left: -45,
            child: Icon( Icons.grid_view_rounded, size: 200, color: Colors.white.withOpacity(0.1),) 
            ), 
            

            Column(
              children: [
                SizedBox(
                 height: 50,
                 width: double.infinity,
                ),
                Text('Bienvenido', style: TextStyle(fontSize: 40, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),), 
                SizedBox( height: 20,), 
                Text('Contáctanos ', style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.bold),), 
                SizedBox( height: 20,), 

              ],

            ),
            
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration:  BoxDecoration(
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
    
        _BotonMapa(), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: 40,
            ), 
            Icon(Icons.map_outlined, color: Colors.white.withOpacity(0.5),), 
            SizedBox(width: 20), 
            Expanded(child: Text('Nuestas Sucursales', style: TextStyle(color: Colors.white.withOpacity(0.5)),
            )), 
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.5),),
            SizedBox(width: 40)
          ],
         ), 
    
      ] 
      
      ),
    );
    
  }
}

class _Instagram extends StatelessWidget {
  const _Instagram({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack
    (children: [

      _RedesSociales(), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 140,
            width: 40,
          ), 
          Icon(Icons.email, color: Colors.white.withOpacity(0.5),), 
          SizedBox(width: 20), 
          Expanded(child: Text('Redes Sociales', style: TextStyle(color: Colors.white.withOpacity(0.5)),
          )), 
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withOpacity(0.5),),
          SizedBox(width: 40)
        ],
       ), 

    ] 
    
    );
    
  }
}

class _RedesSociales extends StatelessWidget {
  const _RedesSociales({
    super.key,
  });

 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack( 
          children: [
            Positioned(
              right:- 20,
              top:-20,
              child: Icon(Icons.email_rounded, size:  150, color: Colors.white.withOpacity(0.2))
            ), 
             ],
        ),
      ), 
     
      width: double.infinity, 
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), 
        gradient:  LinearGradient(
            colors: [
              Color.fromARGB(255, 97, 26, 168),
              Color(0xff906EF5),
              Color(0xff6989F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      )
    );
  }
}


class _BotonMapa extends StatelessWidget {
  const _BotonMapa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      ), 
     
      width: double.infinity, 
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), 
        gradient:  LinearGradient(
            colors: [
              Color.fromARGB(255, 97, 26, 168),
              Color(0xff906EF5),
              Color(0xff6989F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      )
    );
  }
}