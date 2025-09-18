import 'package:flutter/material.dart';
 class Button extends StatelessWidget {
   final String text;
   final VoidCallback onPressed;
   final Color color;
   final double fontSize;
   final double radius;
   final double verticalPadding;

   Button({
     required this.text,
     required this.onPressed,
     this.color = Colors.blue,
     this.fontSize = 20,
     this.radius = 8,
     this.verticalPadding = 15,

   });

   @override
   Widget build(BuildContext context) {
     return SizedBox(
         width: double.infinity,
         child: ElevatedButton(
             onPressed: onPressed,
             style: ElevatedButton.styleFrom(
               backgroundColor: color,
               padding: EdgeInsets.symmetric(vertical: verticalPadding),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(radius),
               ),
             ),
             child: Text(
               text,
               style: TextStyle(
                 fontSize: fontSize,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
             )
         )
     );
   }
 }