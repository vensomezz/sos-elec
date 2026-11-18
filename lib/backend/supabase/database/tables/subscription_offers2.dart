import '../database.dart';

class SubscriptionOffers2Table extends SupabaseTable<SubscriptionOffers2Row> {
  @override
  String get tableName => 'subscription_offers2';

  @override
  SubscriptionOffers2Row createRow(Map<String, dynamic> data) =>
      SubscriptionOffers2Row(data);
}

class SubscriptionOffers2Row extends SupabaseDataRow {
  SubscriptionOffers2Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionOffers2Table();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get zone => getField<String>('zone');
  set zone(String? value) => setField<String>('zone', value);

  double? get monthlyPrice => getField<double>('monthly price');
  set monthlyPrice(double? value) => setField<double>('monthly price', value);

  int? get includedInterventions => getField<int>('included_interventions');
  set includedInterventions(int? value) =>
      setField<int>('included_interventions', value);

  String? get priorityLevel => getField<String>('priority_level');
  set priorityLevel(String? value) => setField<String>('priority_level', value);

  int? get slaTargetMinutes => getField<int>('sla_target_minutes');
  set slaTargetMinutes(int? value) =>
      setField<int>('sla_target_minutes', value);

  double? get maxLaborHoursPerIntervention =>
      getField<double>('max_labor_hours_per_intervention');
  set maxLaborHoursPerIntervention(double? value) =>
      setField<double>('max_labor_hours_per_intervention', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String get targetCustomers => getField<String>('target_customers')!;
  set targetCustomers(String value) =>
      setField<String>('target_customers', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);
}
