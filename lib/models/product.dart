import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String name;
  Price price;
  String colour;
  int colourWayId;
  String brandName;
  bool hasVariantColours;
  bool hasMultiplePrices;
  dynamic groupId;
  int productCode;
  String productType;
  String url;
  String imageUrl;
  List<String> additionalImageUrls;
  dynamic videoUrl;
  bool showVideo;
  bool isSellingFast;
  dynamic sponsoredCampaignId;
  List<dynamic> facetGroupings;
  dynamic advertisement;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.colour,
    required this.colourWayId,
    required this.brandName,
    required this.hasVariantColours,
    required this.hasMultiplePrices,
    required this.groupId,
    required this.productCode,
    required this.productType,
    required this.url,
    required this.imageUrl,
    required this.additionalImageUrls,
    required this.videoUrl,
    required this.showVideo,
    required this.isSellingFast,
    required this.sponsoredCampaignId,
    required this.facetGroupings,
    required this.advertisement,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: Price.fromJson(json["price"]),
        colour: json["colour"],
        colourWayId: json["colourWayId"],
        brandName: json["brandName"],
        hasVariantColours: json["hasVariantColours"],
        hasMultiplePrices: json["hasMultiplePrices"],
        groupId: json["groupId"],
        productCode: json["productCode"].toInt(), // Convert to int
        productType: json["productType"],
        url: json["url"],
        imageUrl: json["imageUrl"],
        additionalImageUrls:
            List<String>.from(json["additionalImageUrls"].map((x) => x)),
        videoUrl: json["videoUrl"],
        showVideo: json["showVideo"],
        isSellingFast: json["isSellingFast"],
        sponsoredCampaignId: json["sponsoredCampaignId"],
        facetGroupings:
            List<dynamic>.from(json["facetGroupings"].map((x) => x)),
        advertisement: json["advertisement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price.toJson(),
        "colour": colour,
        "colourWayId": colourWayId,
        "brandName": brandName,
        "hasVariantColours": hasVariantColours,
        "hasMultiplePrices": hasMultiplePrices,
        "groupId": groupId,
        "productCode": productCode,
        "productType": productType,
        "url": url,
        "imageUrl": imageUrl,
        "additionalImageUrls":
            List<dynamic>.from(additionalImageUrls.map((x) => x)),
        "videoUrl": videoUrl,
        "showVideo": showVideo,
        "isSellingFast": isSellingFast,
        "sponsoredCampaignId": sponsoredCampaignId,
        "facetGroupings": List<dynamic>.from(facetGroupings.map((x) => x)),
        "advertisement": advertisement,
      };
}

class Price {
  Current current;
  Current previous;
  Current rrp;
  bool isMarkedDown;
  bool isOutletPrice;
  String currency;

  Price({
    required this.current,
    required this.previous,
    required this.rrp,
    required this.isMarkedDown,
    required this.isOutletPrice,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: Current.fromJson(json["current"]),
        previous: Current.fromJson(json["previous"]),
        rrp: Current.fromJson(json["rrp"]),
        isMarkedDown: json["isMarkedDown"],
        isOutletPrice: json["isOutletPrice"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
        "previous": previous.toJson(),
        "rrp": rrp.toJson(),
        "isMarkedDown": isMarkedDown,
        "isOutletPrice": isOutletPrice,
        "currency": currency,
      };
}

class Current {
  num? value; // Change to num
  String text;

  Current({
    required this.value,
    required this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
