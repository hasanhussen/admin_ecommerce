class DeliveryModel {
  String? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhone;
  String? deliveryCreate;

  DeliveryModel(
      {this.deliveryId,
      this.deliveryName,
      this.deliveryEmail,
      this.deliveryPassword,
      this.deliveryPhone,
      this.deliveryCreate});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryPhone = json['delivery_phone'];
    deliveryCreate = json['delivery_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_id'] = this.deliveryId;
    data['delivery_name'] = this.deliveryName;
    data['delivery_email'] = this.deliveryEmail;
    data['delivery_password'] = this.deliveryPassword;
    data['delivery_phone'] = this.deliveryPhone;
    data['delivery_create'] = this.deliveryCreate;
    return data;
  }
}
