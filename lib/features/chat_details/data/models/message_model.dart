import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String senderId;
  final String receiverId;
  final String dateTime;
  final String text;

  const MessageModel({
    required this.senderId,
    required this.receiverId,
    required this.dateTime,
    required this.text,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        dateTime: json['dateTime'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'receiverId': receiverId,
        'dateTime': dateTime,
        'text': text,
      };

  @override
  List<Object?> get props {
    return [
      senderId,
      receiverId,
      dateTime,
      text,
    ];
  }
}
