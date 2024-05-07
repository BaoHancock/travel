import 'package:flutter/material.dart';

void httperrorhande(
  {
    
    required dynamic modified,
    required VoidCallback onsuccess,

  }

){
  try{
      
      if(modified){
        return onsuccess();
      }
    
      return print(modified);

  }catch(e){
      
  }
}