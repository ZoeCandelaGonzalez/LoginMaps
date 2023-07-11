
import 'package:isar/isar.dart';

part 'user.g.dart';

@collection 
class User {

Id id = Isar.autoIncrement;

String name = '';
String apellido = ''; 
 

 String email = '';
 String fechaNacimiento = ''; 

User({required String name , required String apellido, required String fechaNacimiento,required String email}){
  this.name = name;
  this.apellido = apellido;
  this.fechaNacimiento = fechaNacimiento;
  this.email = email;
} 

 
}