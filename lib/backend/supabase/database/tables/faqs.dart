import '../database.dart';

class FaqsTable extends SupabaseTable<FaqsRow> {
  @override
  String get tableName => 'faqs';

  @override
  FaqsRow createRow(Map<String, dynamic> data) => FaqsRow(data);
}

class FaqsRow extends SupabaseDataRow {
  FaqsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FaqsTable();

  String? get question => getField<String>('question');
  set question(String? value) => setField<String>('question', value);

  String? get questionEn => getField<String>('question_en');
  set questionEn(String? value) => setField<String>('question_en', value);

  String? get answer => getField<String>('answer');
  set answer(String? value) => setField<String>('answer', value);

  String? get answerEn => getField<String>('answer_en');
  set answerEn(String? value) => setField<String>('answer_en', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdDate => getField<DateTime>('created_date');
  set createdDate(DateTime? value) => setField<DateTime>('created_date', value);

  DateTime? get updatedDate => getField<DateTime>('updated_date');
  set updatedDate(DateTime? value) => setField<DateTime>('updated_date', value);

  String? get createdById => getField<String>('created_by_id');
  set createdById(String? value) => setField<String>('created_by_id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  bool? get isSample => getField<bool>('is_sample');
  set isSample(bool? value) => setField<bool>('is_sample', value);
}
