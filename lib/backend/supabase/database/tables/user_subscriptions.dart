import '../database.dart';

class UserSubscriptionsTable extends SupabaseTable<UserSubscriptionsRow> {
  @override
  String get tableName => 'user_subscriptions';

  @override
  UserSubscriptionsRow createRow(Map<String, dynamic> data) =>
      UserSubscriptionsRow(data);
}

class UserSubscriptionsRow extends SupabaseDataRow {
  UserSubscriptionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserSubscriptionsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get subscriptionId => getField<String>('subscription_id');
  set subscriptionId(String? value) =>
      setField<String>('subscription_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);

  int? get maxInterventionsplanCredits =>
      getField<int>('max_interventions (plan_credits)');
  set maxInterventionsplanCredits(int? value) =>
      setField<int>('max_interventions (plan_credits)', value);

  int? get creditsUsed => getField<int>('credits_used');
  set creditsUsed(int? value) => setField<int>('credits_used', value);

  String? get stripeSubscriptionId =>
      getField<String>('stripe_subscription_id');
  set stripeSubscriptionId(String? value) =>
      setField<String>('stripe_subscription_id', value);

  String? get stripeCustomerId => getField<String>('stripe_customer_id');
  set stripeCustomerId(String? value) =>
      setField<String>('stripe_customer_id', value);

  String? get priceId => getField<String>('price_id');
  set priceId(String? value) => setField<String>('price_id', value);

  DateTime? get currentPeriodEnd => getField<DateTime>('current_period_end');
  set currentPeriodEnd(DateTime? value) =>
      setField<DateTime>('current_period_end', value);
}
