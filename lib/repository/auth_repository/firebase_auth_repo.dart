
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_model.dart';
import '../user_repository/firebase_user_repo.dart';
import '../user_repository/user_repo.dart';
import 'auth_repo.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // GoogleSignIn _googleSignIn = GoogleSignIn();
  UserRepository _userRepository = FirebaseUserRepository();
  String _authException = "Authentication Failure";
  User get loggedFirebaseUser => _firebaseAuth.currentUser!;
  String get authException => _authException;

  /// Don't use onAuthChange
  Future signInAnon() async{
    try{
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User? user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  /// Creates a new user with the provided [information]
  /// Created by NDH
  Future<void> signUp(UserModel newUser, String password) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: newUser.email,
        password: password,
      );
      // Add id for new user
      newUser = newUser.cloneWith(id: userCredential.user!.uid);

      // Create new doc in users collection
      await _userRepository.addUserData(newUser);
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }

  /// Signs in with the provided [email] and [password].
  /// Created by NDH
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }
  Future logInWithEmailAndPassword2(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } on FirebaseAuthException catch (e) {
      _authException = e.message.toString();
    }
  }
  // /// Starts the Sign In with Google Flow.
  // /// Created by NDH
  // Future<void> logInWithGoogle() async {
  //   try {
  //     final googleUser =
  //         await (_googleSignIn.signIn() as Future<GoogleSignInAccount>);
  //     final googleAuth = await googleUser.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await _firebaseAuth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     _authException = e.message.toString();
  //   }
  // }

  bool isLoggedIn() => _firebaseAuth.currentUser != null;

  /// Signs out the current user
  /// Created by NDH
  Future<void> logOut() async {
    await _firebaseAuth.signOut().catchError((error) {
      print(error);
    });
  }

  ///Singleton factory
  static final FirebaseAuthRepository _instance =
      FirebaseAuthRepository._internal();

  factory FirebaseAuthRepository() {
    return _instance;
  }

  FirebaseAuthRepository._internal();
}
