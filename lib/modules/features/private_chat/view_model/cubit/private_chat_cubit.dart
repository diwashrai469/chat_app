import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'private_chat_state.dart';

@injectable
class PrivateChatCubit extends Cubit<PrivateChatState> {
  PrivateChatCubit() : super(PrivateChatInitial());

  getAllUsers() async {
    emit(PrivateChatLoadingState());
    try {
      final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('users');

      QuerySnapshot querySnapshot = await collectionRef.get();

      List allData = querySnapshot.docs.map((doc) => doc.data()).toList();

      final filterdata = allData
          .where((element) => element['id'] != _firebaseAuth.currentUser?.uid)
          .toList();

      final currentUserdata = allData
          .where((element) => element['id'] == _firebaseAuth.currentUser?.uid)
          .toList();
      emit(PrivateChatLoadedState(
          allUserData: filterdata, currentUserData: currentUserdata));
    } catch (e) {
      emit(PrivateChatErrorState());
      print("Error fetching users: $e");
    }
  }
}
