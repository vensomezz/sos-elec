import '../database.dart';

class AiChatMessagesTable extends SupabaseTable<AiChatMessagesRow> {
  @override
  String get tableName => 'ai_chat_messages';

  @override
  AiChatMessagesRow createRow(Map<String, dynamic> data) =>
      AiChatMessagesRow(data);
}

class AiChatMessagesRow extends SupabaseDataRow {
  AiChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatMessagesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String? get conversationId => getField<String>('conversation_id');
  set conversationId(String? value) =>
      setField<String>('conversation_id', value);
}
