import 'package:go_router/go_router.dart';
import 'package:loginmapa/screens/home_screen.dart';
import 'package:loginmapa/screens/mapa_screen.dart';
import 'package:loginmapa/screens/singin_screen.dart';
import 'package:loginmapa/screens/singup_screen.dart';



final appRouter = GoRouter(
initialLocation: '/signin',
routes: [ 

 GoRoute(
      path: '/signin',
     
      builder: (context, state){
        return const SignInScreen();
      },
    ),

  GoRoute(
  path: '/singup', 
  builder: (context, state) =>  const SignUpScreen() ),

   GoRoute(
  path: '/home', 
  builder: (context, state) => const HomeScreen() ),


   GoRoute(
  path: '/mapa', 
  builder: (context, state) => const MapaScreen() ),



]

 );