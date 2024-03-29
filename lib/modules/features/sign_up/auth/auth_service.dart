import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:chat_app/core/services/toast_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthService {
  final ToastService _toastService;
  final AppRoutes _appRoutes;
  final LocalStorageService _localStorageService;
  AuthService(this._toastService, this._appRoutes, this._localStorageService);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  signUpUser(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      _appRoutes.pushAndPopUntil(
        const LoginView(),
        predicate: (route) => false,
      );

      _toastService.s("User created sucessfully!");
    } on FirebaseAuthException catch (e) {
      _toastService.e(e.toString());
    }
  }

  login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final acessToken = await FirebaseAuth.instance.currentUser?.getIdToken();
      _localStorageService.write('acessToken', acessToken);
      _appRoutes.pushAndPopUntil(
        const PrivateChatHeadsView(),
        predicate: (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _toastService.e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _toastService.e('Wrong password provided for that user.');
      } else {
        _toastService.e(e.message.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null) {
        GoogleAuthProvider.credential(
          accessToken: googleAuth!.accessToken,
          idToken: googleAuth.idToken,
        );
        _appRoutes.pushAndPopUntil(
          const PrivateChatHeadsView(),
          predicate: (route) => false,
        );

        _localStorageService.write("acessToken", googleAuth.accessToken);
      }
    } on Exception catch (e) {
      print('exception->$e');
    }
  }
}
