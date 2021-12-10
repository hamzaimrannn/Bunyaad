import 'package:bunyaad/Controller/services_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Controller {


  static Future<bool> loginUser({required String email, required String password}) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      var user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        //TODO check in database if buyer or seller
        //await ServiceController().createService("Islamabad", "Product", "1kg Cement", "Material", user.user!.uid);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
    return false;
  }

  static Future<bool> SignupUser({required String email, required String password, required bool isSeller}) async {
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (user.user != null) {
        //TODO add this user in database
        if (isSeller == true)
        {
          await setSeller(email: email, password: password);
        }
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return false;
    }
    return false;
  }

  static Future<void> setSeller({required String email, required String password}) async {
    DocumentReference? ref;
    try {
      print("enetered");
      ref = await FirebaseFirestore.instance.collection("user").add({"email": email,"password":password, "isSeller": 1});
    }catch(e){
      print("error");
    }
  }
}

// Query query = FirebaseFirestore.instance.collection("user");
