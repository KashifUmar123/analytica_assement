import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final String message;
  final bool isUser;
  final bool isFailed;

  const MessageModel({
    required this.message,
    required this.isUser,
    this.isFailed = false,
  });

  MessageModel copyWith({
    String? message,
    bool? isUser,
    bool? isFailed,
  }) {
    return MessageModel(
      message: message ?? this.message,
      isUser: isUser ?? this.isUser,
      isFailed: isFailed ?? this.isFailed,
    );
  }

  @override
  List<Object?> get props => [message, isFailed, isUser];
}
