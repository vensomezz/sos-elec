import '../database.dart';

class ServiceRequestsDuplicateTable
    extends SupabaseTable<ServiceRequestsDuplicateRow> {
  @override
  String get tableName => 'service_requests_duplicate';

  @override
  ServiceRequestsDuplicateRow createRow(Map<String, dynamic> data) =>
      ServiceRequestsDuplicateRow(data);
}

class ServiceRequestsDuplicateRow extends SupabaseDataRow {
  ServiceRequestsDuplicateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceRequestsDuplicateTable();

  String? get requestNumber => getField<String>('request_number');
  set requestNumber(String? value) => setField<String>('request_number', value);

  String get customerName => getField<String>('customer_name')!;
  set customerName(String value) => setField<String>('customer_name', value);

  String get customerEmail => getField<String>('customer_email')!;
  set customerEmail(String value) => setField<String>('customer_email', value);

  String get customerPhone => getField<String>('customer_phone')!;
  set customerPhone(String value) => setField<String>('customer_phone', value);

  String? get customerType => getField<String>('customer_type');
  set customerType(String? value) => setField<String>('customer_type', value);

  String? get subscriptionId => getField<String>('subscription_id');
  set subscriptionId(String? value) =>
      setField<String>('subscription_id', value);

  String? get billingType => getField<String>('billing_type');
  set billingType(String? value) => setField<String>('billing_type', value);

  String? get subscriptionCreditUsed =>
      getField<String>('subscription_credit_used');
  set subscriptionCreditUsed(String? value) =>
      setField<String>('subscription_credit_used', value);

  String? get exceededSubscriptionHours =>
      getField<String>('exceeded_subscription_hours');
  set exceededSubscriptionHours(String? value) =>
      setField<String>('exceeded_subscription_hours', value);

  String get problemDescription => getField<String>('problem_description')!;
  set problemDescription(String value) =>
      setField<String>('problem_description', value);

  String? get urgencyLevel => getField<String>('urgency_level');
  set urgencyLevel(String? value) => setField<String>('urgency_level', value);

  String? get serviceCategory => getField<String>('service_category');
  set serviceCategory(String? value) =>
      setField<String>('service_category', value);

  String get locationAddress => getField<String>('location_address')!;
  set locationAddress(String value) =>
      setField<String>('location_address', value);

  String? get locationCoordinates => getField<String>('location_coordinates');
  set locationCoordinates(String? value) =>
      setField<String>('location_coordinates', value);

  String? get serviceArea => getField<String>('service_area');
  set serviceArea(String? value) => setField<String>('service_area', value);

  dynamic? get photoUrls => getField<dynamic>('photo_urls');
  set photoUrls(dynamic? value) => setField<dynamic>('photo_urls', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get assignedElectricianId =>
      getField<String>('assigned_electrician_id');
  set assignedElectricianId(String? value) =>
      setField<String>('assigned_electrician_id', value);

  String? get assignedElectricianName =>
      getField<String>('assigned_electrician_name');
  set assignedElectricianName(String? value) =>
      setField<String>('assigned_electrician_name', value);

  String? get assignmentTime => getField<String>('assignment_time');
  set assignmentTime(String? value) =>
      setField<String>('assignment_time', value);

  String? get completionTime => getField<String>('completion_time');
  set completionTime(String? value) =>
      setField<String>('completion_time', value);

  String? get responseTimeMinutes => getField<String>('response_time_minutes');
  set responseTimeMinutes(String? value) =>
      setField<String>('response_time_minutes', value);

  dynamic? get serviceNotes => getField<dynamic>('service_notes');
  set serviceNotes(dynamic? value) => setField<dynamic>('service_notes', value);

  dynamic? get completionPhotos => getField<dynamic>('completion_photos');
  set completionPhotos(dynamic? value) =>
      setField<dynamic>('completion_photos', value);

  String? get actualTimeSpentMinutes =>
      getField<String>('actual_time_spent_minutes');
  set actualTimeSpentMinutes(String? value) =>
      setField<String>('actual_time_spent_minutes', value);

  dynamic? get materialsList => getField<dynamic>('materials_list');
  set materialsList(dynamic? value) =>
      setField<dynamic>('materials_list', value);

  String? get materialsTotalCost => getField<String>('materials_total_cost');
  set materialsTotalCost(String? value) =>
      setField<String>('materials_total_cost', value);

  String? get laborCost => getField<String>('labor_cost');
  set laborCost(String? value) => setField<String>('labor_cost', value);

  String? get totalCustomerCost => getField<String>('total_customer_cost');
  set totalCustomerCost(String? value) =>
      setField<String>('total_customer_cost', value);

  String? get sosElecCommission => getField<String>('sos_elec_commission');
  set sosElecCommission(String? value) =>
      setField<String>('sos_elec_commission', value);

  String? get electricianShare => getField<String>('electrician_share');
  set electricianShare(String? value) =>
      setField<String>('electrician_share', value);

  String? get pricingRuleId => getField<String>('pricing_rule_id');
  set pricingRuleId(String? value) =>
      setField<String>('pricing_rule_id', value);

  String? get quoteRequired => getField<String>('quote_required');
  set quoteRequired(String? value) => setField<String>('quote_required', value);

  String? get quoteStatus => getField<String>('quote_status');
  set quoteStatus(String? value) => setField<String>('quote_status', value);

  String? get quoteDocumentUrl => getField<String>('quote_document_url');
  set quoteDocumentUrl(String? value) =>
      setField<String>('quote_document_url', value);

  String? get estimatedCost => getField<String>('estimated_cost');
  set estimatedCost(String? value) => setField<String>('estimated_cost', value);

  String? get actualCost => getField<String>('actual_cost');
  set actualCost(String? value) => setField<String>('actual_cost', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get depositAmount => getField<String>('deposit_amount');
  set depositAmount(String? value) => setField<String>('deposit_amount', value);

  String? get depositPaidDate => getField<String>('deposit_paid_date');
  set depositPaidDate(String? value) =>
      setField<String>('deposit_paid_date', value);

  String? get remainingAmount => getField<String>('remaining_amount');
  set remainingAmount(String? value) =>
      setField<String>('remaining_amount', value);

  String? get finalPaymentDate => getField<String>('final_payment_date');
  set finalPaymentDate(String? value) =>
      setField<String>('final_payment_date', value);

  String? get stripeCustomerId => getField<String>('stripe_customer_id');
  set stripeCustomerId(String? value) =>
      setField<String>('stripe_customer_id', value);

  String? get stripePaymentMethodId =>
      getField<String>('stripe_payment_method_id');
  set stripePaymentMethodId(String? value) =>
      setField<String>('stripe_payment_method_id', value);

  String? get paymentCardLast4 => getField<String>('payment_card_last4');
  set paymentCardLast4(String? value) =>
      setField<String>('payment_card_last4', value);

  String? get paymentCardBrand => getField<String>('payment_card_brand');
  set paymentCardBrand(String? value) =>
      setField<String>('payment_card_brand', value);

  String? get customerRating => getField<String>('customer_rating');
  set customerRating(String? value) =>
      setField<String>('customer_rating', value);

  String? get customerFeedback => getField<String>('customer_feedback');
  set customerFeedback(String? value) =>
      setField<String>('customer_feedback', value);

  String? get trackingToken => getField<String>('tracking_token');
  set trackingToken(String? value) => setField<String>('tracking_token', value);

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

  String? get customerUuid => getField<String>('customer_uuid');
  set customerUuid(String? value) => setField<String>('customer_uuid', value);
}
