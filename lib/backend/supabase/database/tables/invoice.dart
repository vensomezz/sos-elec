import '../database.dart';

class InvoiceTable extends SupabaseTable<InvoiceRow> {
  @override
  String get tableName => 'Invoice';

  @override
  InvoiceRow createRow(Map<String, dynamic> data) => InvoiceRow(data);
}

class InvoiceRow extends SupabaseDataRow {
  InvoiceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InvoiceTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get serviceRequestId => getField<String>('service_request_id');
  set serviceRequestId(String? value) =>
      setField<String>('service_request_id', value);

  String get invoiceNumber => getField<String>('invoice_number')!;
  set invoiceNumber(String value) => setField<String>('invoice_number', value);

  String? get invoiceUrl => getField<String>('invoice_url');
  set invoiceUrl(String? value) => setField<String>('invoice_url', value);

  bool get paid => getField<bool>('paid')!;
  set paid(bool value) => setField<bool>('paid', value);

  String? get stripePaymentIntent => getField<String>('stripe_payment_intent');
  set stripePaymentIntent(String? value) =>
      setField<String>('stripe_payment_intent', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
