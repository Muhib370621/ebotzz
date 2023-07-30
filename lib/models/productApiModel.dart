// To parse this JSON data, do
//
//     final productApiModel = productApiModelFromJson(jsonString);

import 'dart:convert';

List<ProductApiModel> productApiModelFromJson(String str) => List<ProductApiModel>.from(json.decode(str).map((x) => ProductApiModel.fromJson(x)));

String productApiModelToJson(List<ProductApiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductApiModel {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  Type? type;
  Status? status;
  bool? featured;
  CatalogVisibility? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<dynamic>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  TaxStatus? taxStatus;
  String? taxClass;
  bool? manageStock;
  int? stockQuantity;
  Backorders? backorders;
  bool? backordersAllowed;
  bool? backordered;
  int? lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<dynamic>? tags;
  List<Image>? images;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDatum>? metaData;
  StockStatus? stockStatus;
  bool? hasOptions;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  Store? store;
  Links? links;

  ProductApiModel({
     this.id,
     this.name,
     this.slug,
     this.permalink,
     this.dateCreated,
     this.dateCreatedGmt,
     this.dateModified,
     this.dateModifiedGmt,
     this.type,
     this.status,
     this.featured,
     this.catalogVisibility,
     this.description,
     this.shortDescription,
     this.sku,
     this.price,
     this.regularPrice,
     this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
     this.onSale,
     this.purchasable,
     this.totalSales,
     this.virtual,
     this.downloadable,
     this.downloads,
     this.downloadLimit,
     this.downloadExpiry,
     this.externalUrl,
     this.buttonText,
     this.taxStatus,
     this.taxClass,
     this.manageStock,
    this.stockQuantity,
     this.backorders,
     this.backordersAllowed,
     this.backordered,
    this.lowStockAmount,
     this.soldIndividually,
     this.weight,
     this.dimensions,
     this.shippingRequired,
     this.shippingTaxable,
     this.shippingClass,
     this.shippingClassId,
     this.reviewsAllowed,
     this.averageRating,
     this.ratingCount,
     this.upsellIds,
     this.crossSellIds,
     this.parentId,
     this.purchaseNote,
     this.categories,
     this.tags,
     this.images,
     this.attributes,
     this.defaultAttributes,
     this.variations,
     this.groupedProducts,
     this.menuOrder,
     this.priceHtml,
     this.relatedIds,
     this.metaData,
     this.stockStatus,
     this.hasOptions,
     this.yoastHead,
     this.yoastHeadJson,
     this.store,
     this.links,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) => ProductApiModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    type: typeValues.map[json["type"]]!,
    status: statusValues.map[json["status"]]!,
    featured: json["featured"],
    catalogVisibility: catalogVisibilityValues.map[json["catalog_visibility"]]!,
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: taxStatusValues.map[json["tax_status"]]!,
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"],
    backorders: backordersValues.map[json["backorders"]]!,
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    lowStockAmount: json["low_stock_amount"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<dynamic>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    priceHtml: json["price_html"],
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    stockStatus: stockStatusValues.map[json["stock_status"]]!,
    hasOptions: json["has_options"],
    yoastHead: json["yoast_head"],
    yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
    store: Store.fromJson(json["store"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "permalink": permalink,
    "date_created": dateCreated!.toIso8601String(),
    "date_created_gmt": dateCreatedGmt!.toIso8601String(),
    "date_modified": dateModified!.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
    "type": typeValues.reverse[type],
    "status": statusValues.reverse[status],
    "featured": featured,
    "catalog_visibility": catalogVisibilityValues.reverse[catalogVisibility],
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": List<dynamic>.from(downloads!.map((x) => x)),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatusValues.reverse[taxStatus],
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity,
    "backorders": backordersValues.reverse[backorders],
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "low_stock_amount": lowStockAmount,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions!.toJson(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "upsell_ids": List<dynamic>.from(upsellIds!.map((x) => x)),
    "cross_sell_ids": List<dynamic>.from(crossSellIds!.map((x) => x)),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes!.map((x) => x)),
    "default_attributes": List<dynamic>.from(defaultAttributes!.map((x) => x)),
    "variations": List<dynamic>.from(variations!.map((x) => x)),
    "grouped_products": List<dynamic>.from(groupedProducts!.map((x) => x)),
    "menu_order": menuOrder,
    "price_html": priceHtml,
    "related_ids": List<dynamic>.from(relatedIds!.map((x) => x)),
    "meta_data": List<dynamic>.from(metaData!.map((x) => x.toJson())),
    "stock_status": stockStatusValues.reverse[stockStatus],
    "has_options": hasOptions,
    "yoast_head": yoastHead,
    "yoast_head_json": yoastHeadJson!.toJson(),
    "store": store!.toJson(),
    "_links": links!.toJson(),
  };
}

enum Backorders {
  NO
}

final backordersValues = EnumValues({
  "no": Backorders.NO
});

enum CatalogVisibility {
  VISIBLE
}

final catalogVisibilityValues = EnumValues({
  "visible": CatalogVisibility.VISIBLE
});

class Category {
  int id;
  Name name;
  Slug slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: nameValues.map[json["name"]]!,
    slug: slugValues.map[json["slug"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse[name],
    "slug": slugValues.reverse[slug],
  };
}

enum Name {
  ACCESSORIES_FOR_MEN,
  MEN_S_WATCHES,
  UNCATEGORIZED
}

final nameValues = EnumValues({
  "Accessories for men": Name.ACCESSORIES_FOR_MEN,
  "Men's Watches": Name.MEN_S_WATCHES,
  "Uncategorized": Name.UNCATEGORIZED
});

enum Slug {
  ACCESSORIES_FOR_MEN,
  MENS_WATCHES,
  UNCATEGORIZED
}

final slugValues = EnumValues({
  "accessories-for-men": Slug.ACCESSORIES_FOR_MEN,
  "mens-watches": Slug.MENS_WATCHES,
  "uncategorized": Slug.UNCATEGORIZED
});

class Dimensions {
  String length;
  String width;
  String height;

  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class Image {
  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  Alt alt;

  Image({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: altValues.map[json["alt"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "src": src,
    "name": name,
    "alt": altValues.reverse[alt],
  };
}

enum Alt {
  BALLON_BLEU_DE_CARTIER_WATCH,
  EMPTY,
  ROLEX_EXPLOER_II
}

final altValues = EnumValues({
  "Ballon Bleu De Cartier Watch": Alt.BALLON_BLEU_DE_CARTIER_WATCH,
  "": Alt.EMPTY,
  "Rolex Exploer II": Alt.ROLEX_EXPLOER_II
});

class Links {
  List<Collection> self;
  List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
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

class MetaDatum {
  int id;
  String key;
  dynamic value;

  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
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

class ValueClass {
  Backorders? enableWholesale;
  String? price;
  String? quantity;
  String? national;
  String? international;
  String? handlingFee;
  String? maxChargeProduct;
  String? freeShippingProduct;
  String? nationalQtyOverride;
  String? nationalDisable;
  String? nationalFree;
  String? internationalQtyOverride;
  String? internationalDisable;
  String? internationalFree;

  ValueClass({
    this.enableWholesale,
    this.price,
    this.quantity,
    this.national,
    this.international,
    this.handlingFee,
    this.maxChargeProduct,
    this.freeShippingProduct,
    this.nationalQtyOverride,
    this.nationalDisable,
    this.nationalFree,
    this.internationalQtyOverride,
    this.internationalDisable,
    this.internationalFree,
  });

  factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
    enableWholesale: backordersValues.map[json["enable_wholesale"]]!,
    price: json["price"],
    quantity: json["quantity"],
    national: json["national"],
    international: json["international"],
    handlingFee: json["handling_fee"],
    maxChargeProduct: json["max_charge_product"],
    freeShippingProduct: json["free_shipping_product"],
    nationalQtyOverride: json["national_qty_override"],
    nationalDisable: json["national_disable"],
    nationalFree: json["national_free"],
    internationalQtyOverride: json["international_qty_override"],
    internationalDisable: json["international_disable"],
    internationalFree: json["international_free"],
  );

  Map<String, dynamic> toJson() => {
    "enable_wholesale": backordersValues.reverse[enableWholesale],
    "price": price,
    "quantity": quantity,
    "national": national,
    "international": international,
    "handling_fee": handlingFee,
    "max_charge_product": maxChargeProduct,
    "free_shipping_product": freeShippingProduct,
    "national_qty_override": nationalQtyOverride,
    "national_disable": nationalDisable,
    "national_free": nationalFree,
    "international_qty_override": internationalQtyOverride,
    "international_disable": internationalDisable,
    "international_free": internationalFree,
  };
}

enum Status {
  PUBLISH
}

final statusValues = EnumValues({
  "publish": Status.PUBLISH
});

enum StockStatus {
  INSTOCK,
  OUTOFSTOCK
}

final stockStatusValues = EnumValues({
  "instock": StockStatus.INSTOCK,
  "outofstock": StockStatus.OUTOFSTOCK
});

class Store {
  int id;
  String name;
  String shopName;
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
    name: json["name"],
    shopName: json["shop_name"],
    url: json["url"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shop_name": shopName,
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

enum TaxStatus {
  TAXABLE
}

final taxStatusValues = EnumValues({
  "taxable": TaxStatus.TAXABLE
});

enum Type {
  AUCTION,
  SIMPLE
}

final typeValues = EnumValues({
  "auction": Type.AUCTION,
  "simple": Type.SIMPLE
});

class YoastHeadJson {
  String title;
  Robots robots;
  String canonical;
  OgLocale ogLocale;
  OgType ogType;
  String ogTitle;
  String ogUrl;
  OgSiteName ogSiteName;
  List<OgImage>? ogImage;
  TwitterCard twitterCard;
  Schema schema;
  String? ogDescription;
  DateTime? articleModifiedTime;
  TwitterMisc? twitterMisc;

  YoastHeadJson({
    required this.title,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    required this.ogUrl,
    required this.ogSiteName,
    this.ogImage,
    required this.twitterCard,
    required this.schema,
    this.ogDescription,
    this.articleModifiedTime,
    this.twitterMisc,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    title: json["title"],
    robots: Robots.fromJson(json["robots"]),
    canonical: json["canonical"],
    ogLocale: ogLocaleValues.map[json["og_locale"]]!,
    ogType: ogTypeValues.map[json["og_type"]]!,
    ogTitle: json["og_title"],
    ogUrl: json["og_url"],
    ogSiteName: ogSiteNameValues.map[json["og_site_name"]]!,
    ogImage: json["og_image"] == null ? [] : List<OgImage>.from(json["og_image"]!.map((x) => OgImage.fromJson(x))),
    twitterCard: twitterCardValues.map[json["twitter_card"]]!,
    schema: Schema.fromJson(json["schema"]),
    ogDescription: json["og_description"],
    articleModifiedTime: json["article_modified_time"] == null ? null : DateTime.parse(json["article_modified_time"]),
    twitterMisc: json["twitter_misc"] == null ? null : TwitterMisc.fromJson(json["twitter_misc"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "robots": robots.toJson(),
    "canonical": canonical,
    "og_locale": ogLocaleValues.reverse[ogLocale],
    "og_type": ogTypeValues.reverse[ogType],
    "og_title": ogTitle,
    "og_url": ogUrl,
    "og_site_name": ogSiteNameValues.reverse[ogSiteName],
    "og_image": ogImage == null ? [] : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
    "twitter_card": twitterCardValues.reverse[twitterCard],
    "schema": schema.toJson(),
    "og_description": ogDescription,
    "article_modified_time": articleModifiedTime?.toIso8601String(),
    "twitter_misc": twitterMisc?.toJson(),
  };
}

class OgImage {
  int width;
  int height;
  String url;
  String type;

  OgImage({
    required this.width,
    required this.height,
    required this.url,
    required this.type,
  });

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
    width: json["width"],
    height: json["height"],
    url: json["url"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "url": url,
    "type": type,
  };
}

enum OgLocale {
  EN_US
}

final ogLocaleValues = EnumValues({
  "en_US": OgLocale.EN_US
});

enum OgSiteName {
  BIDS_AND_TRADES
}

final ogSiteNameValues = EnumValues({
  "Bids and Trades": OgSiteName.BIDS_AND_TRADES
});

enum OgType {
  ARTICLE
}

final ogTypeValues = EnumValues({
  "article": OgType.ARTICLE
});

class Robots {
  Index index;
  Follow follow;
  MaxSnippet maxSnippet;
  MaxImagePreview maxImagePreview;
  MaxVideoPreview maxVideoPreview;

  Robots({
    required this.index,
    required this.follow,
    required this.maxSnippet,
    required this.maxImagePreview,
    required this.maxVideoPreview,
  });

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
    index: indexValues.map[json["index"]]!,
    follow: followValues.map[json["follow"]]!,
    maxSnippet: maxSnippetValues.map[json["max-snippet"]]!,
    maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]]!,
    maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]]!,
  );

  Map<String, dynamic> toJson() => {
    "index": indexValues.reverse[index],
    "follow": followValues.reverse[follow],
    "max-snippet": maxSnippetValues.reverse[maxSnippet],
    "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
    "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
  };
}

enum Follow {
  FOLLOW
}

final followValues = EnumValues({
  "follow": Follow.FOLLOW
});

enum Index {
  INDEX
}

final indexValues = EnumValues({
  "index": Index.INDEX
});

enum MaxImagePreview {
  MAX_IMAGE_PREVIEW_LARGE
}

final maxImagePreviewValues = EnumValues({
  "max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE
});

enum MaxSnippet {
  MAX_SNIPPET_1
}

final maxSnippetValues = EnumValues({
  "max-snippet:-1": MaxSnippet.MAX_SNIPPET_1
});

enum MaxVideoPreview {
  MAX_VIDEO_PREVIEW_1
}

final maxVideoPreviewValues = EnumValues({
  "max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1
});

class Schema {
  String context;
  List<Graph> graph;

  Schema({
    required this.context,
    required this.graph,
  });

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
    context: json["@context"],
    graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@context": context,
    "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
  };
}

class Graph {
  GraphType type;
  String id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  DateTime? datePublished;
  DateTime? dateModified;
  Breadcrumb? breadcrumb;
  InLanguage? inLanguage;
  List<PotentialAction>? potentialAction;
  List<ItemListElement>? itemListElement;
  OgSiteName? description;

  Graph({
    required this.type,
    required this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.inLanguage,
    this.potentialAction,
    this.itemListElement,
    this.description,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    type: graphTypeValues.map[json["@type"]]!,
    id: json["@id"],
    url: json["url"],
    name: json["name"],
    isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
    datePublished: json["datePublished"] == null ? null : DateTime.parse(json["datePublished"]),
    dateModified: json["dateModified"] == null ? null : DateTime.parse(json["dateModified"]),
    breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
    itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    description: ogSiteNameValues.map[json["description"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": graphTypeValues.reverse[type],
    "@id": id,
    "url": url,
    "name": name,
    "isPartOf": isPartOf?.toJson(),
    "datePublished": datePublished?.toIso8601String(),
    "dateModified": dateModified?.toIso8601String(),
    "breadcrumb": breadcrumb?.toJson(),
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
    "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
    "description": ogSiteNameValues.reverse[description],
  };
}

class Breadcrumb {
  String id;

  Breadcrumb({
    required this.id,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
    id: json["@id"],
  );

  Map<String, dynamic> toJson() => {
    "@id": id,
  };
}

enum InLanguage {
  EN_US
}

final inLanguageValues = EnumValues({
  "en-US": InLanguage.EN_US
});

class ItemListElement {
  ItemListElementType type;
  int position;
  String name;
  String? item;

  ItemListElement({
    required this.type,
    required this.position,
    required this.name,
    this.item,
  });

  factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
    type: itemListElementTypeValues.map[json["@type"]]!,
    position: json["position"],
    name: json["name"],
    item: json["item"],
  );

  Map<String, dynamic> toJson() => {
    "@type": itemListElementTypeValues.reverse[type],
    "position": position,
    "name": name,
    "item": item,
  };
}

enum ItemListElementType {
  LIST_ITEM
}

final itemListElementTypeValues = EnumValues({
  "ListItem": ItemListElementType.LIST_ITEM
});

class PotentialAction {
  PotentialActionType type;
  dynamic target;
  QueryInput? queryInput;

  PotentialAction({
    required this.type,
    required this.target,
    this.queryInput,
  });

  factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
    type: potentialActionTypeValues.map[json["@type"]]!,
    target: json["target"],
    queryInput: queryInputValues.map[json["query-input"]],
  );

  Map<String, dynamic> toJson() => {
    "@type": potentialActionTypeValues.reverse[type],
    "target": target,
    "query-input": queryInputValues.reverse[queryInput],
  };
}

enum QueryInput {
  REQUIRED_NAME_SEARCH_TERM_STRING
}

final queryInputValues = EnumValues({
  "required name=search_term_string": QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class TargetClass {
  TargetType type;
  UrlTemplate urlTemplate;

  TargetClass({
    required this.type,
    required this.urlTemplate,
  });

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
    type: targetTypeValues.map[json["@type"]]!,
    urlTemplate: urlTemplateValues.map[json["urlTemplate"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": targetTypeValues.reverse[type],
    "urlTemplate": urlTemplateValues.reverse[urlTemplate],
  };
}

enum TargetType {
  ENTRY_POINT
}

final targetTypeValues = EnumValues({
  "EntryPoint": TargetType.ENTRY_POINT
});

enum UrlTemplate {
  HTTPS_EBOTZZ_COM_S_SEARCH_TERM_STRING
}

final urlTemplateValues = EnumValues({
  "https://ebotzz.com/?s={search_term_string}": UrlTemplate.HTTPS_EBOTZZ_COM_S_SEARCH_TERM_STRING
});

enum PotentialActionType {
  READ_ACTION,
  SEARCH_ACTION
}

final potentialActionTypeValues = EnumValues({
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType {
  BREADCRUMB_LIST,
  WEB_PAGE,
  WEB_SITE
}

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard {
  SUMMARY_LARGE_IMAGE
}

final twitterCardValues = EnumValues({
  "summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE
});

class TwitterMisc {
  String estReadingTime;

  TwitterMisc({
    required this.estReadingTime,
  });

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
    estReadingTime: json["Est. reading time"],
  );

  Map<String, dynamic> toJson() => {
    "Est. reading time": estReadingTime,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
