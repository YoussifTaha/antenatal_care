import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String senderId;
  final String dateTime;
  final String text;

  const MessageModel({
    required this.senderId,
    required this.dateTime,
    required this.text,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        senderId: json['senderId'],
        dateTime: json['dateTime'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'senderId': senderId,
        'dateTime': dateTime,
        'text': text,
      };

  @override
  List<Object?> get props {
    return [
      senderId,
      dateTime,
      text,
    ];
  }
}
