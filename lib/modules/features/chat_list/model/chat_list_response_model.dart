class ChatlistResponseModel {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final String timeStamp;

  ChatlistResponseModel(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.timeStamp});

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'Message': message,
      'timeStamp': timeStamp,
    };
  }
}
