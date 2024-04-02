import 'package:chat_app/modules/features/chat_list/model/chat_list_response_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatListViewModel {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  void sendMessage(String revceiverId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final String timeStamp = DateTime.now().toString();

    ChatlistResponseModel newMessages = ChatlistResponseModel(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: revceiverId,
        message: message,
        timeStamp: timeStamp);

    List<String> ids = [currentUserId, revceiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessages.toMap());
  }

  Stream<QuerySnapshot> getChatList(String otherUserId) {
    final String currentUserId = _firebaseAuth.currentUser!.uid;

    List<String> ids = [currentUserId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firebaseFirestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}
