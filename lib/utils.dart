import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_picker/gallery_picker.dart';

Future<void > signInuserAnon()async{
  try{
    final UserCredential = await FirebaseAuth.instance.signInAnonymously();
    print("${UserCredential.user?.uid}");

  }catch(e){

  }
}


Future<File?> getImageFromGallery(BuildContext context) async{
  try{
List<MediaFile>? singleMeida = await GalleryPicker.pickMedia(context: context,singleMedia: true);
  
  return singleMeida?.first.getFile();
  }catch(e){
    print(e);
  }
  
}

Future<String> uploadfileforuser(File file) async{
  try{
    final userid = FirebaseAuth.instance.currentUser?.uid;
    final storeageref = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final uploadref= storeageref.child("$userid/uploads/$timestamp-$fileName");
    TaskSnapshot ree=await uploadref.putFile(file);
    
     String downloadUrl = await ree.ref.getDownloadURL();
   print("Download URL: $downloadUrl");
    
    return downloadUrl;
  }catch(e){
    print(e);
    return "failed";
  }
}