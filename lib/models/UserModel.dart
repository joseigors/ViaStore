import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';


class UserModel extends Model {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? user;

  Map<String, dynamic> userData = {};

  bool isLoading = false;

  @override
  void addListener(listener) {
    super.addListener(listener);
    _loadCurrentUser();
  }

  void signUp({
    required Map<String, dynamic> userData,
    required String pass,
    required Function onSuccess,
    required Function onFail,
  }) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
        email: userData['email'], password: pass)
        .then((user) async {
      onSuccess();
      await _saveUserData(userData);
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void signIn(
      {required String email,
        required String pass,
        required Function onSuccess,
        required Function onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) async {
      await _loadCurrentUser();
      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((e) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  void recoverPass() {}

  Future<void>? _saveUserData(Map<String, dynamic> userData) async {
    this.userData = userData;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .set(userData);
  }

  Future<User?> _loadCurrentUser() async {
    User currentUser = _auth.currentUser!;
    if (currentUser == null) {
      currentUser = _auth.currentUser!;
      if  (currentUser != null) {
        if (userData['name'] == null) {
          DocumentSnapshot docUser = await FirebaseFirestore.instance
              .collection("users")
              .doc(user?.uid)
              .get();
          userData = docUser.data as Map<String, dynamic>;
        }
      }
      notifyListeners();
    }
    return null;
  }
}
