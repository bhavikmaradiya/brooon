class AddSubscriptionRequest {
  String? planType;
  String? price;
  String? purchaseId;
  String? paymentMode;
  String? purchaseToken;
  int? purchaseTime;

  Future<Map<String, dynamic>> toMap(AddSubscriptionRequest obj) async {
    Map<String, dynamic> body = {};
    if (obj.planType != null) {
      body['plan_type'] = obj.planType;
    }
    if (obj.price != null) {
      body['price'] = obj.price;
    }
    if (obj.purchaseId != null) {
      body['purchase_id'] = obj.purchaseId;
    }
    if (obj.paymentMode != null) {
      body['payment_mode'] = obj.paymentMode;
    }
    if (obj.purchaseToken != null) {
      body['purchase_token'] = obj.purchaseToken;
    }
    if (obj.purchaseTime != null) {
      body['purchase_time'] = obj.purchaseTime;
    }
    return body;
  }
}
