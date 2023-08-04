// To parse this JSON data, do
//
//     final productCategoryModel = productCategoryModelFromJson(jsonString);

import 'dart:convert';

List<ProductCategoryModel> productCategoryModelFromJson(String str) => List<ProductCategoryModel>.from(json.decode(str).map((x) => ProductCategoryModel.fromJson(x)));

String productCategoryModelToJson(List<ProductCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategoryModel {
  int id;
  String name;
  String slug;
  int parent;
  String description;
  Display display;
  dynamic image;
  int menuOrder;
  int count;
  String yoastHead;
  YoastHeadJson yoastHeadJson;
  Links links;

  ProductCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.parent,
    required this.description,
    required this.display,
    this.image,
    required this.menuOrder,
    required this.count,
    required this.yoastHead,
    required this.yoastHeadJson,
    required this.links,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) => ProductCategoryModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    parent: json["parent"],
    description: json["description"],
    display: displayValues.map[json["display"]]!,
    image: json["image"],
    menuOrder: json["menu_order"],
    count: json["count"],
    yoastHead: json["yoast_head"],
    yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "parent": parent,
    "description": description,
    "display": displayValues.reverse[display],
    "image": image,
    "menu_order": menuOrder,
    "count": count,
    "yoast_head": yoastHead,
    "yoast_head_json": yoastHeadJson.toJson(),
    "_links": links.toJson(),
  };
}

enum Display {
  DEFAULT,
  SUBCATEGORIES
}

final displayValues = EnumValues({
  "default": Display.DEFAULT,
  "subcategories": Display.SUBCATEGORIES
});

class Links {
  List<Collection> self;
  List<Collection> collection;
  List<Collection>? up;

  Links({
    required this.self,
    required this.collection,
    this.up,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    up: json["up"] == null ? [] : List<Collection>.from(json["up"]!.map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "up": up == null ? [] : List<dynamic>.from(up!.map((x) => x.toJson())),
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

class YoastHeadJson {
  String title;
  String? description;
  Robots robots;
  String canonical;
  OgLocale ogLocale;
  OgType ogType;
  String ogTitle;
  String? ogDescription;
  String ogUrl;
  OgSiteName ogSiteName;
  TwitterCard twitterCard;
  Schema schema;

  YoastHeadJson({
    required this.title,
    this.description,
    required this.robots,
    required this.canonical,
    required this.ogLocale,
    required this.ogType,
    required this.ogTitle,
    this.ogDescription,
    required this.ogUrl,
    required this.ogSiteName,
    required this.twitterCard,
    required this.schema,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
    title: json["title"],
    description: json["description"],
    robots: Robots.fromJson(json["robots"]),
    canonical: json["canonical"],
    ogLocale: ogLocaleValues.map[json["og_locale"]]!,
    ogType: ogTypeValues.map[json["og_type"]]!,
    ogTitle: json["og_title"],
    ogDescription: json["og_description"],
    ogUrl: json["og_url"],
    ogSiteName: ogSiteNameValues.map[json["og_site_name"]]!,
    twitterCard: twitterCardValues.map[json["twitter_card"]]!,
    schema: Schema.fromJson(json["schema"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "robots": robots.toJson(),
    "canonical": canonical,
    "og_locale": ogLocaleValues.reverse[ogLocale],
    "og_type": ogTypeValues.reverse[ogType],
    "og_title": ogTitle,
    "og_description": ogDescription,
    "og_url": ogUrl,
    "og_site_name": ogSiteNameValues.reverse[ogSiteName],
    "twitter_card": twitterCardValues.reverse[twitterCard],
    "schema": schema.toJson(),
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
  String? description;
  Breadcrumb? breadcrumb;
  InLanguage? inLanguage;
  List<ItemListElement>? itemListElement;
  List<PotentialAction>? potentialAction;

  Graph({
    required this.type,
    required this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.description,
    this.breadcrumb,
    this.inLanguage,
    this.itemListElement,
    this.potentialAction,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
    type: graphTypeValues.map[json["@type"]]!,
    id: json["@id"],
    url: json["url"],
    name: json["name"],
    isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
    description: json["description"],
    breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
    inLanguage: inLanguageValues.map[json["inLanguage"]]!,
    itemListElement: json["itemListElement"] == null ? [] : List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))),
    potentialAction: json["potentialAction"] == null ? [] : List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "@type": graphTypeValues.reverse[type],
    "@id": id,
    "url": url,
    "name": name,
    "isPartOf": isPartOf?.toJson(),
    "description": description,
    "breadcrumb": breadcrumb?.toJson(),
    "inLanguage": inLanguageValues.reverse[inLanguage],
    "itemListElement": itemListElement == null ? [] : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
    "potentialAction": potentialAction == null ? [] : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
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
  Target target;
  QueryInput queryInput;

  PotentialAction({
    required this.type,
    required this.target,
    required this.queryInput,
  });

  factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
    type: potentialActionTypeValues.map[json["@type"]]!,
    target: Target.fromJson(json["target"]),
    queryInput: queryInputValues.map[json["query-input"]]!,
  );

  Map<String, dynamic> toJson() => {
    "@type": potentialActionTypeValues.reverse[type],
    "target": target.toJson(),
    "query-input": queryInputValues.reverse[queryInput],
  };
}

enum QueryInput {
  REQUIRED_NAME_SEARCH_TERM_STRING
}

final queryInputValues = EnumValues({
  "required name=search_term_string": QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class Target {
  TargetType type;
  UrlTemplate urlTemplate;

  Target({
    required this.type,
    required this.urlTemplate,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
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
  SEARCH_ACTION
}

final potentialActionTypeValues = EnumValues({
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType {
  BREADCRUMB_LIST,
  COLLECTION_PAGE,
  WEB_SITE
}

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "CollectionPage": GraphType.COLLECTION_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard {
  SUMMARY_LARGE_IMAGE
}

final twitterCardValues = EnumValues({
  "summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE
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
