import 'package:flutter/material.dart';

TextField registro({
  required final String text,
  required final IconData icon,
  required final bool isPassword,
  required final TextEditingController controller,
  required final BuildContext context,
  bool isFecha = false,
  Function(DateTime)? onDateSelected,
})

     {
      
  return TextField(
    
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: !isPassword,
    autocorrect: !isPassword,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
   prefixIcon: GestureDetector(
   onTap: isFecha
              ? () async {
                  final selectedFecha = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedFecha != null) {
                    onDateSelected?.call(selectedFecha);
                  }
                }
              : null,
  child: Icon(
    icon,
    color: Colors.white70,
  ),
),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPassword
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container boton 
(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
  );
}




Container botonIngresar(

BuildContext context, bool isLogin, Function onTap )

{ 

return Container( 
  width: MediaQuery.of(context).size.width,
  height: 50,
  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
  child: ElevatedButton(
    
    onPressed: (){ 
      onTap();
    },
    style: ButtonStyle( backgroundColor: MaterialStateProperty.resolveWith((states) { 
      if (states.contains(MaterialState.pressed)) {
        return Colors.black;
      }
      return Colors.white.withOpacity(0.6);

    }), 
    shape: MaterialStateProperty.all<RoundedRectangleBorder> ( 
      RoundedRectangleBorder( borderRadius: BorderRadius.circular(30))
    )

    )
    , 
    child: Text( 
      isLogin? 'Ingresar' 
      :'Regístrate', 
      style:  const TextStyle(
        color:
           Color.fromARGB(255, 120, 79, 243), fontWeight: FontWeight.bold, fontSize: 16),

    ),

  ),
);

}

