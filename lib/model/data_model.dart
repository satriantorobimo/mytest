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
  String sectionTitle;
  List<Items> items;

  Data({this.section,this.sectionTitle, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v, section));
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
  String articleTitle;
  String articleImage;
  String link;

  Items({this.productName, this.productImage, this.link, this.articleImage, this.articleTitle});

  Items.fromJson(Map<String, dynamic> json, String section) {
    if(section == 'products'){
      productName = json['product_name'];
      productImage = json['product_image'];
      link = json['link'];
    }else{
      articleTitle = json['article_title'];
      articleImage = json['article_image'];
      link = json['link'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['article_title'] = this.articleTitle;
    data['article_image'] = this.articleImage;
    data['link'] = this.link;
    return data;
  }
}