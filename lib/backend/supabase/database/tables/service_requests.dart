import '../database.dart';

class ServiceRequestsTable extends SupabaseTable<ServiceRequestsRow> {
  @override
  String get tableName => 'service_requests';

  @override
  ServiceRequestsRow createRow(Map<String, dynamic> data) =>
      ServiceRequestsRow(data);
}

class ServiceRequestsRow extends SupabaseDataRow {
  ServiceRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ServiceRequestsTable();

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

  double? get materialsTotalCost => getField<double>('materials_total_cost');
  set materialsTotalCost(double? value) =>
      setField<double>('materials_total_cost', value);

  double? get laborCost => getField<double>('labor_cost');
  set laborCost(double? value) => setField<double>('labor_cost', value);

  double? get totalCustomerCost => getField<double>('total_customer_cost');
  set totalCustomerCost(double? value) =>
      setField<double>('total_customer_cost', value);

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

  double? get depositAmount => getField<double>('deposit_amount');
  set depositAmount(double? value) => setField<double>('deposit_amount', value);

  String? get depositPaidDate => getField<String>('deposit_paid_date');
  set depositPaidDate(String? value) =>
      setField<String>('deposit_paid_date', value);

  double? get remainingAmount => getField<double>('remaining_amount');
  set remainingAmount(double? value) =>
      setField<double>('remaining_amount', value);

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

  String? get assignedElectricianUuid =>
      getField<String>('assigned_electrician_uuid');
  set assignedElectricianUuid(String? value) =>
      setField<String>('assigned_electrician_uuid', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  int? get creditsUsedTemp => getField<int>('credits_used_temp');
  set creditsUsedTemp(int? value) => setField<int>('credits_used_temp', value);

  DateTime? get respondedAt => getField<DateTime>('responded_at');
  set respondedAt(DateTime? value) => setField<DateTime>('responded_at', value);

  bool? get depositPaid => getField<bool>('deposit_paid');
  set depositPaid(bool? value) => setField<bool>('deposit_paid', value);

  bool? get finalPaymentPaid => getField<bool>('final_payment_paid');
  set finalPaymentPaid(bool? value) =>
      setField<bool>('final_payment_paid', value);

  String? get stripeCheckoutId => getField<String>('stripe_checkout_id');
  set stripeCheckoutId(String? value) =>
      setField<String>('stripe_checkout_id', value);

  String? get stripePaymentIntent => getField<String>('stripe_payment_intent');
  set stripePaymentIntent(String? value) =>
      setField<String>('stripe_payment_intent', value);

  String? get electricianId => getField<String>('electrician_id');
  set electricianId(String? value) => setField<String>('electrician_id', value);

  double? get commissionAmount => getField<double>('commission_amount');
  set commissionAmount(double? value) =>
      setField<double>('commission_amount', value);

  double? get electricianPayout => getField<double>('electrician_payout');
  set electricianPayout(double? value) =>
      setField<double>('electrician_payout', value);

  String? get clientType => getField<String>('client_type');
  set clientType(String? value) => setField<String>('client_type', value);

  bool? get dispatchAuthorized => getField<bool>('dispatch_authorized');
  set dispatchAuthorized(bool? value) =>
      setField<bool>('dispatch_authorized', value);

  double? get currentLatitude => getField<double>('current_latitude');
  set currentLatitude(double? value) =>
      setField<double>('current_latitude', value);

  double? get currentLongitude => getField<double>('current_longitude');
  set currentLongitude(double? value) =>
      setField<double>('current_longitude', value);

  String? get workPerformed => getField<String>('work_performed');
  set workPerformed(String? value) => setField<String>('work_performed', value);

  String? get recommendedFollowup => getField<String>('recommended_followup');
  set recommendedFollowup(String? value) =>
      setField<String>('recommended_followup', value);

  String? get additionalNotes => getField<String>('additional_notes');
  set additionalNotes(String? value) =>
      setField<String>('additional_notes', value);

  int? get labourMinutes => getField<int>('labour_minutes');
  set labourMinutes(int? value) => setField<int>('labour_minutes', value);

  double? get hourlyRate => getField<double>('hourly_rate');
  set hourlyRate(double? value) => setField<double>('hourly_rate', value);

  double? get diagnosticFee => getField<double>('diagnostic_fee');
  set diagnosticFee(double? value) => setField<double>('diagnostic_fee', value);

  double? get basicRate => getField<double>('basic_rate');
  set basicRate(double? value) => setField<double>('basic_rate', value);

  double? get travelCost => getField<double>('travel_cost');
  set travelCost(double? value) => setField<double>('travel_cost', value);

  double? get serviceFee => getField<double>('service_fee');
  set serviceFee(double? value) => setField<double>('service_fee', value);

  DateTime? get cancelAt => getField<DateTime>('cancel_at');
  set cancelAt(DateTime? value) => setField<DateTime>('cancel_at', value);

  String? get cancelReason => getField<String>('cancel_reason');
  set cancelReason(String? value) => setField<String>('cancel_reason', value);

  double? get finalAmountCalculated =>
      getField<double>('final_amount_calculated');
  set finalAmountCalculated(double? value) =>
      setField<double>('final_amount_calculated', value);

  String? get finalPaymentStatus => getField<String>('final_payment_status');
  set finalPaymentStatus(String? value) =>
      setField<String>('final_payment_status', value);

  bool? get reportSubmitted => getField<bool>('report_submitted');
  set reportSubmitted(bool? value) => setField<bool>('report_submitted', value);

  DateTime? get reportSubmittedAt => getField<DateTime>('report_submitted_at');
  set reportSubmittedAt(DateTime? value) =>
      setField<DateTime>('report_submitted_at', value);

  String? get workCategory => getField<String>('work_category');
  set workCategory(String? value) => setField<String>('work_category', value);

  DateTime? get refusedAt => getField<DateTime>('refused_at');
  set refusedAt(DateTime? value) => setField<DateTime>('refused_at', value);

  String? get refusalReason => getField<String>('refusal_reason');
  set refusalReason(String? value) => setField<String>('refusal_reason', value);

  String? get startTime => getField<String>('start_time');
  set startTime(String? value) => setField<String>('start_time', value);

  double? get interventionRate => getField<double>('intervention_rate');
  set interventionRate(double? value) =>
      setField<double>('intervention_rate', value);

  String? get guestAccessToken => getField<String>('guest_access_token');
  set guestAccessToken(String? value) =>
      setField<String>('guest_access_token', value);

  DateTime? get appointmentStart => getField<DateTime>('appointment_start');
  set appointmentStart(DateTime? value) =>
      setField<DateTime>('appointment_start', value);

  DateTime? get appointmentEnd => getField<DateTime>('appointment_end');
  set appointmentEnd(DateTime? value) =>
      setField<DateTime>('appointment_end', value);
}
