// To parse this JSON data, do
//
//     final orderStatus = orderStatusFromJson(jsonString);

import 'dart:convert';

List<OrderStatus> orderStatusFromJson(String str) => List<OrderStatus>.from(json.decode(str).map((x) => OrderStatus.fromJson(x)));

String orderStatusToJson(List<OrderStatus> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderStatus {
  int? id;
  int? parentId;
  Status? status;
  Currency? currency;
  Version? version;
  bool? pricesIncludeTax;
  DateTime? dateCreated;
  DateTime? dateModified;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? cartTax;
  String? total;
  String? totalTax;
  int? customerId;
  String? orderKey;
  Ing? billing;
  Ing? shipping;
  PaymentMethod? paymentMethod;
  PaymentMethodTitle? paymentMethodTitle;
  String? transactionId;
  String? customerIpAddress;
  String? customerUserAgent;
  CreatedVia? createdVia;
  String? customerNote;
  dynamic dateCompleted;
  dynamic datePaid;
  String? cartHash;
  String? number;
  List<OrderStatusMetaDatum>? metaData;
  List<LineItem>? lineItems;
  List<dynamic>? taxLines;
  List<ShippingLine>? shippingLines;
  List<dynamic>? feeLines;
  List<dynamic>? couponLines;
  List<dynamic>? refunds;
  String? paymentUrl;
  bool? isEditable;
  bool? needsPayment;
  bool? needsProcessing;
  DateTime? dateCreatedGmt;
  DateTime? dateModifiedGmt;
  dynamic dateCompletedGmt;
  dynamic datePaidGmt;
  List<Store>? stores;
  Store? store;
  CurrencySymbol? currencySymbol;
  Links? links;

  OrderStatus({
     this.id,
     this.parentId,
     this.status,
     this.currency,
     this.version,
     this.pricesIncludeTax,
     this.dateCreated,
     this.dateModified,
     this.discountTotal,
     this.discountTax,
     this.shippingTotal,
     this.shippingTax,
     this.cartTax,
     this.total,
     this.totalTax,
     this.customerId,
     this.orderKey,
     this.billing,
     this.shipping,
     this.paymentMethod,
     this.paymentMethodTitle,
     this.transactionId,
     this.customerIpAddress,
     this.customerUserAgent,
     this.createdVia,
     this.customerNote,
    this.dateCompleted,
    this.datePaid,
     this.cartHash,
     this.number,
     this.metaData,
     this.lineItems,
     this.taxLines,
     this.shippingLines,
     this.feeLines,
     this.couponLines,
     this.refunds,
     this.paymentUrl,
     this.isEditable,
     this.needsPayment,
     this.needsProcessing,
     this.dateCreatedGmt,
     this.dateModifiedGmt,
    this.dateCompletedGmt,
    this.datePaidGmt,
     this.stores,
     this.store,
     this.currencySymbol,
     this.links,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
    id: json["id"],
    parentId: json["parent_id"],
    status: statusValues.map[json["status"]]!,
    currency: currencyValues.map[json["currency"]]!,
    version: versionValues.map[json["version"]]!,
    pricesIncludeTax: json["prices_include_tax"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateModified: DateTime.parse(json["date_modified"]),
    discountTotal: json["discount_total"],
    discountTax: json["discount_tax"],
    shippingTotal: json["shipping_total"],
    shippingTax: json["shipping_tax"],
    cartTax: json["cart_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    customerId: json["customer_id"],
    orderKey: json["order_key"],
    billing: Ing.fromJson(json["billing"]),
    shipping: Ing.fromJson(json["shipping"]),
    paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
    paymentMethodTitle: paymentMethodTitleValues.map[json["payment_method_title"]]!,
    transactionId: json["transaction_id"],
    customerIpAddress: json["customer_ip_address"],
    customerUserAgent: json["customer_user_agent"],
    createdVia: createdViaValues.map[json["created_via"]]!,
    customerNote: json["customer_note"],
    dateCompleted: json["date_completed"],
    datePaid: json["date_paid"],
    cartHash: json["cart_hash"],
    number: json["number"],
    metaData: List<OrderStatusMetaDatum>.from(json["meta_data"].map((x) => OrderStatusMetaDatum.fromJson(x))),
    lineItems: List<LineItem>.from(json["line_items"].map((x) => LineItem.fromJson(x))),
    taxLines: List<dynamic>.from(json["tax_lines"].map((x) => x)),
    shippingLines: List<ShippingLine>.from(json["shipping_lines"].map((x) => ShippingLine.fromJson(x))),
    feeLines: List<dynamic>.from(json["fee_lines"].map((x) => x)),
    couponLines: List<dynamic>.from(json["coupon_lines"].map((x) => x)),
    refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
    paymentUrl: json["payment_url"],
    isEditable: json["is_editable"],
    needsPayment: json["needs_payment"],
    needsProcessing: json["needs_processing"],
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    dateCompletedGmt: json["date_completed_gmt"],
    datePaidGmt: json["date_paid_gmt"],
    stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
    store: Store.fromJson(json["store"]),
    currencySymbol: currencySymbolValues.map[json["currency_symbol"]]!,
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": statusValues.reverse[status],
    "currency": currencyValues.reverse[currency],
    "version": versionValues.reverse[version],
    "prices_include_tax": pricesIncludeTax,
    "date_created": dateCreated!.toIso8601String(),
    "date_modified": dateModified!.toIso8601String(),
    "discount_total": discountTotal,
    "discount_tax": discountTax,
    "shipping_total": shippingTotal,
    "shipping_tax": shippingTax,
    "cart_tax": cartTax,
    "total": total,
    "total_tax": totalTax,
    "customer_id": customerId,
    "order_key": orderKey,
    "billing": billing!.toJson(),
    "shipping": shipping!.toJson(),
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "payment_method_title": paymentMethodTitleValues.reverse[paymentMethodTitle],
    "transaction_id": transactionId,
    "customer_ip_address": customerIpAddress,
    "customer_user_agent": customerUserAgent,
    "created_via": createdViaValues.reverse[createdVia],
    "customer_note": customerNote,
    "date_completed": dateCompleted,
    "date_paid": datePaid,
    "cart_hash": cartHash,
    "number": number,
    "meta_data": List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "line_items": List<dynamic>.from(lineItems!.map((x) => x.toJson())),
    "tax_lines": List<dynamic>.from(taxLines!.map((x) => x)),
    "shipping_lines": List<dynamic>.from(shippingLines!.map((x) => x.toJson())),
    "fee_lines": List<dynamic>.from(feeLines!.map((x) => x)),
    "coupon_lines": List<dynamic>.from(couponLines!.map((x) => x)),
    "refunds": List<dynamic>.from(refunds!.map((x) => x)),
    "payment_url": paymentUrl,
    "is_editable": isEditable,
    "needs_payment": needsPayment,
    "needs_processing": needsProcessing,
    "date_created_gmt": dateCreatedGmt!.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
    "date_completed_gmt": dateCompletedGmt,
    "date_paid_gmt": datePaidGmt,
    "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
    "store": store!.toJson(),
    "currency_symbol": currencySymbolValues.reverse[currencySymbol],
    "_links": links!.toJson(),
  };
}

class Ing {
  FirstName firstName;
  LastName lastName;
  Company company;
  Address1 address1;
  Address2 address2;
  City city;
  State state;
  String postcode;
  Country country;
  Email? email;
  Phone phone;

  Ing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.postcode,
    required this.country,
    this.email,
    required this.phone,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
    firstName: firstNameValues.map[json["first_name"]]!,
    lastName: lastNameValues.map[json["last_name"]]!,
    company: companyValues.map[json["company"]]!,
    address1: address1Values.map[json["address_1"]]!,
    address2: address2Values.map[json["address_2"]]!,
    city: cityValues.map[json["city"]]!,
    state: stateValues.map[json["state"]]!,
    postcode: json["postcode"],
    country: countryValues.map[json["country"]]!,
    email: emailValues.map[json["email"]]!,
    phone: phoneValues.map[json["phone"]]!,
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstNameValues.reverse[firstName],
    "last_name": lastNameValues.reverse[lastName],
    "company": companyValues.reverse[company],
    "address_1": address1Values.reverse[address1],
    "address_2": address2Values.reverse[address2],
    "city": cityValues.reverse[city],
    "state": stateValues.reverse[state],
    "postcode": postcode,
    "country": countryValues.reverse[country],
    "email": emailValues.reverse[email],
    "phone": phoneValues.reverse[phone],
  };
}

enum Address1 {
  THE_3900_BISCAYNE_BLVD,
  THE_9048_EUCLID_AVE,
  ZAMZAMA_5_TH_COMMERCIAL_LANE_DHA_PHASE_5
}

final address1Values = EnumValues({
  "3900 Biscayne Blvd": Address1.THE_3900_BISCAYNE_BLVD,
  "9048 Euclid Ave": Address1.THE_9048_EUCLID_AVE,
  "Zamzama 5th commercial lane dha phase 5": Address1.ZAMZAMA_5_TH_COMMERCIAL_LANE_DHA_PHASE_5
});

enum Address2 {
  APT_1103,
  B_15
}

final address2Values = EnumValues({
  "Apt 1103": Address2.APT_1103,
  "B/15": Address2.B_15
});

enum City {
  KARACHI,
  MANASSAS,
  MIAMI
}

final cityValues = EnumValues({
  "Karachi": City.KARACHI,
  "Manassas": City.MANASSAS,
  "Miami": City.MIAMI
});

enum Company {
  EMPTY,
  ON_THE_MARK_INC,
  RWS,
  SCENTIA
}

final companyValues = EnumValues({
  "": Company.EMPTY,
  "On The Mark, Inc.": Company.ON_THE_MARK_INC,
  "Rws": Company.RWS,
  "Scentia": Company.SCENTIA
});

enum Country {
  PK,
  US
}

final countryValues = EnumValues({
  "PK": Country.PK,
  "US": Country.US
});

enum Email {
  FD_EPROCUS_COM,
  NOORKHVRLIVE_GMAIL_COM
}

final emailValues = EnumValues({
  "fd@eprocus.com": Email.FD_EPROCUS_COM,
  "noorkhvrlive@gmail.com": Email.NOORKHVRLIVE_GMAIL_COM
});

enum FirstName {
  FEDERICO,
  FEDRICO,
  MARK,
  NOOR_ISLAM
}

final firstNameValues = EnumValues({
  "Federico": FirstName.FEDERICO,
  "Fedrico": FirstName.FEDRICO,
  "Mark": FirstName.MARK,
  "Noor Islam": FirstName.NOOR_ISLAM
});

enum LastName {
  DE_LA_CRUZ,
  KHAN,
  STARNES
}

final lastNameValues = EnumValues({
  "De la Cruz": LastName.DE_LA_CRUZ,
  "Khan": LastName.KHAN,
  "Starnes": LastName.STARNES
});

enum Phone {
  EMPTY,
  THE_03100220107,
  THE_3058044685
}

final phoneValues = EnumValues({
  "": Phone.EMPTY,
  "03100220107": Phone.THE_03100220107,
  "3058044685": Phone.THE_3058044685
});

enum State {
  FL,
  SD,
  VA
}

final stateValues = EnumValues({
  "FL": State.FL,
  "SD": State.SD,
  "VA": State.VA
});

enum CreatedVia {
  CHECKOUT
}

final createdViaValues = EnumValues({
  "checkout": CreatedVia.CHECKOUT
});

enum Currency {
  USD
}

final currencyValues = EnumValues({
  "USD": Currency.USD
});

enum CurrencySymbol {
  EMPTY
}

final currencySymbolValues = EnumValues({
  "\u0024": CurrencySymbol.EMPTY
});

class LineItem {
  int id;
  String name;
  int productId;
  int variationId;
  int quantity;
  String taxClass;
  String subtotal;
  String subtotalTax;
  String total;
  String totalTax;
  List<dynamic> taxes;
  List<LineItemMetaDatum> metaData;
  String sku;
  int price;
  Image image;
  dynamic parentName;

  LineItem({
    required this.id,
    required this.name,
    required this.productId,
    required this.variationId,
    required this.quantity,
    required this.taxClass,
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.totalTax,
    required this.taxes,
    required this.metaData,
    required this.sku,
    required this.price,
    required this.image,
    this.parentName,
  });

  factory LineItem.fromJson(Map<String, dynamic> json) => LineItem(
    id: json["id"],
    name: json["name"],
    productId: json["product_id"],
    variationId: json["variation_id"],
    quantity: json["quantity"],
    taxClass: json["tax_class"],
    subtotal: json["subtotal"],
    subtotalTax: json["subtotal_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
    metaData: List<LineItemMetaDatum>.from(json["meta_data"].map((x) => LineItemMetaDatum.fromJson(x))),
    sku: json["sku"],
    price: json["price"],
    image: Image.fromJson(json["image"]),
    parentName: json["parent_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "product_id": productId,
    "variation_id": variationId,
    "quantity": quantity,
    "tax_class": taxClass,
    "subtotal": subtotal,
    "subtotal_tax": subtotalTax,
    "total": total,
    "total_tax": totalTax,
    "taxes": List<dynamic>.from(taxes.map((x) => x)),
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "sku": sku,
    "price": price,
    "image": image.toJson(),
    "parent_name": parentName,
  };
}

class Image {
  dynamic id;
  String src;

  Image({
    required this.id,
    required this.src,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    src: json["src"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "src": src,
  };
}

class LineItemMetaDatum {
  int id;
  Key key;
  String value;
  Key displayKey;
  String displayValue;

  LineItemMetaDatum({
    required this.id,
    required this.key,
    required this.value,
    required this.displayKey,
    required this.displayValue,
  });

  factory LineItemMetaDatum.fromJson(Map<String, dynamic> json) => LineItemMetaDatum(
    id: json["id"],
    key: keyValues.map[json["key"]]!,
    value: json["value"],
    displayKey: keyValues.map[json["display_key"]]!,
    displayValue: json["display_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": keyValues.reverse[key],
    "value": value,
    "display_key": keyValues.reverse[displayKey],
    "display_value": displayValue,
  };
}

enum Key {
  DOKAN_COMMISSION_RATE,
  DOKAN_COMMISSION_TYPE,
  IS_TRADE,
  ITEMS,
  REDUCED_STOCK,
  SELLER_ID,
  TRADING_PRODUCTS,
  VENDOR
}

final keyValues = EnumValues({
  "_dokan_commission_rate": Key.DOKAN_COMMISSION_RATE,
  "_dokan_commission_type": Key.DOKAN_COMMISSION_TYPE,
  "Is Trade": Key.IS_TRADE,
  "Items": Key.ITEMS,
  "_reduced_stock": Key.REDUCED_STOCK,
  "seller_id": Key.SELLER_ID,
  "Trading Products": Key.TRADING_PRODUCTS,
  "Vendor": Key.VENDOR
});

class Links {
  List<Collection> self;
  List<Collection> collection;
  List<Collection> customer;

  Links({
    required this.self,
    required this.collection,
    required this.customer,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    customer: List<Collection>.from(json["customer"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "customer": List<dynamic>.from(customer.map((x) => x.toJson())),
  };
}

class Collection {
  String href;

  Collection({
    required this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class OrderStatusMetaDatum {
  int id;
  String key;
  String value;

  OrderStatusMetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  factory OrderStatusMetaDatum.fromJson(Map<String, dynamic> json) => OrderStatusMetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
  };
}

enum PaymentMethod {
  TRADE,
  TRUSTAP
}

final paymentMethodValues = EnumValues({
  "trade": PaymentMethod.TRADE,
  "trustap": PaymentMethod.TRUSTAP
});

enum PaymentMethodTitle {
  CREDIT_DEBIT_CARD_WITH_BUYER_PROTECTION,
  TRADE_ESCROW_POWERED_BY_TRUSTAPP
}

final paymentMethodTitleValues = EnumValues({
  "Credit/Debit Card with Buyer Protection": PaymentMethodTitle.CREDIT_DEBIT_CARD_WITH_BUYER_PROTECTION,
  "Trade (Escrow Powered by Trustapp)": PaymentMethodTitle.TRADE_ESCROW_POWERED_BY_TRUSTAPP
});

class ShippingLine {
  int id;
  MethodTitle methodTitle;
  MethodId methodId;
  String instanceId;
  String total;
  String totalTax;
  List<dynamic> taxes;
  List<LineItemMetaDatum> metaData;

  ShippingLine({
    required this.id,
    required this.methodTitle,
    required this.methodId,
    required this.instanceId,
    required this.total,
    required this.totalTax,
    required this.taxes,
    required this.metaData,
  });

  factory ShippingLine.fromJson(Map<String, dynamic> json) => ShippingLine(
    id: json["id"],
    methodTitle: methodTitleValues.map[json["method_title"]]!,
    methodId: methodIdValues.map[json["method_id"]]!,
    instanceId: json["instance_id"],
    total: json["total"],
    totalTax: json["total_tax"],
    taxes: List<dynamic>.from(json["taxes"].map((x) => x)),
    metaData: List<LineItemMetaDatum>.from(json["meta_data"].map((x) => LineItemMetaDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "method_title": methodTitleValues.reverse[methodTitle],
    "method_id": methodIdValues.reverse[methodId],
    "instance_id": instanceId,
    "total": total,
    "total_tax": totalTax,
    "taxes": List<dynamic>.from(taxes.map((x) => x)),
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
  };
}

enum MethodId {
  FREE_SHIPPING
}

final methodIdValues = EnumValues({
  "free_shipping": MethodId.FREE_SHIPPING
});

enum MethodTitle {
  FREE_SHIPPING
}

final methodTitleValues = EnumValues({
  "Free shipping": MethodTitle.FREE_SHIPPING
});

enum Status {
  CANCELLED,
  ON_HOLD
}

final statusValues = EnumValues({
  "cancelled": Status.CANCELLED,
  "on-hold": Status.ON_HOLD
});

class Store {
  int id;
  Name name;
  ShopName shopName;
  String url;
  dynamic address;

  Store({
    required this.id,
    required this.name,
    required this.shopName,
    required this.url,
    required this.address,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    shopName: shopNameValues.map[json["shop_name"]]!,
    url: json["url"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "shop_name": shopNameValues.reverse[shopName],
    "url": url,
    "address": address,
  };
}

class AddressClass {
  String street1;
  String street2;
  String city;
  String zip;
  String country;
  String state;

  AddressClass({
    required this.street1,
    required this.street2,
    required this.city,
    required this.zip,
    required this.country,
    required this.state,
  });

  factory AddressClass.fromJson(Map<String, dynamic> json) => AddressClass(
    street1: json["street_1"],
    street2: json["street_2"],
    city: json["city"],
    zip: json["zip"],
    country: json["country"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "street_1": street1,
    "street_2": street2,
    "city": city,
    "zip": zip,
    "country": country,
    "state": state,
  };
}

enum Name {
  ADMIN,
  CREEPING_WALTON,
  MARK_FISHER,
  NOOR_ISLAM_KHAN
}

final nameValues = EnumValues({
  "admin": Name.ADMIN,
  "Creeping Walton": Name.CREEPING_WALTON,
  "Mark Fisher": Name.MARK_FISHER,
  "Noor Islam Khan": Name.NOOR_ISLAM_KHAN
});

enum ShopName {
  CREEPING_TRADERS,
  EMPTY,
  STAR_WATCHES,
  TLD_DUDES
}

final shopNameValues = EnumValues({
  "Creeping traders": ShopName.CREEPING_TRADERS,
  "": ShopName.EMPTY,
  "Star Watches": ShopName.STAR_WATCHES,
  "Tld &dudes": ShopName.TLD_DUDES
});

enum Version {
  THE_790
}

final versionValues = EnumValues({
  "7.9.0": Version.THE_790
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
