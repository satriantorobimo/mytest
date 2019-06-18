class DataModels {
  List<Data> data;

  DataModels({this.data});

  DataModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String section;
  List<Items> items;

  Data({this.section, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String productName;
  String productImage;
  String link;

  Items({this.productName, this.productImage, this.link});

  Items.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    productImage = json['product_image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['link'] = this.link;
    return data;
  }
}