import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
        decoration: InputDecoration(

          hintText: 'Sٍearch by name or price ',
         contentPadding: EdgeInsets.zero,
            prefixIcon: Icon(Icons.search,color: Colors.grey,),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              color :Colors.black45
            ),
            fillColor: Colors.white,
                
                filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),

        ),
    );
  }
}
