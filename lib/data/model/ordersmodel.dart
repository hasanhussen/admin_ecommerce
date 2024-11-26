class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersCoupon;
  String? ordersTotalprice;
  String? ordersDatetime;
  String? ordersPaymentmethod;
  String? ordersRating;
  String? ordersNoterating;
  String? ordersDelivery;
  String? ordersStatus;
  String? addressId;
  String? addressUsersid;
  String? addressCity;
  String? addressName;
  String? addressStreet;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersTotalprice,
      this.ordersDatetime,
      this.ordersPaymentmethod,
      this.ordersRating,
      this.ordersNoterating,
      this.ordersDelivery,
      this.ordersStatus,
      this.addressId,
      this.addressUsersid,
      this.addressCity,
      this.addressName,
      this.addressStreet});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersCoupon = json['orders_coupon'];
    ordersTotalprice = json['orders_totalprice'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersDelivery = json['orders_delivery'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_delivery'] = this.ordersDelivery;
    data['orders_status'] = this.ordersStatus;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    data['address_street'] = this.addressStreet;
    return data;
  }
}
