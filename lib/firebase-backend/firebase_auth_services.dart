import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
      final email, final password) async {
    final userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user;
  }

  Future<User?> signUserWithEmailAndPassword(
      final email, final password) async {
    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }

  Future<void> signOut() {
    return auth.signOut();
  }

  Future addTransactions(Map<String, dynamic> transactions) async {
    return await FirebaseFirestore.instance
        .collection("Transactions")
        .doc()
        .set(transactions);
  }

  
  Future addUserDetails(Map<String, dynamic> users) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc()
        .set(users);
  }


  Future<Stream<QuerySnapshot>> getTransactiions() async {
    return  FirebaseFirestore.instance.collection("Transactions").snapshots();
  }
}
