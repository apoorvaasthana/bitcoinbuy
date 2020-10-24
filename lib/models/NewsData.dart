class NewsData {
  List<Analysis> analysis;
  List<Blockchain> blockchain;
  List<Exchanges> exchanges;
  List<General> general;
  List<Government> government;
  List<Ico> ico;
  List<Mining> mining;

  NewsData(
      {this.analysis,
        this.blockchain,
        this.exchanges,
        this.general,
        this.government,
        this.ico,
        this.mining});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json['analysis'] != null) {
      analysis = new List<Analysis>();
      json['analysis'].forEach((v) {
        analysis.add(new Analysis.fromJson(v));
      });
    }
    if (json['blockchain'] != null) {
      blockchain = new List<Blockchain>();
      json['blockchain'].forEach((v) {
        blockchain.add(new Blockchain.fromJson(v));
      });
    }
    if (json['exchanges'] != null) {
      exchanges = new List<Exchanges>();
      json['exchanges'].forEach((v) {
        exchanges.add(new Exchanges.fromJson(v));
      });
    }
    if (json['general'] != null) {
      general = new List<General>();
      json['general'].forEach((v) {
        general.add(new General.fromJson(v));
      });
    }
    if (json['government'] != null) {
      government = new List<Government>();
      json['government'].forEach((v) {
        government.add(new Government.fromJson(v));
      });
    }
    if (json['ico'] != null) {
      ico = new List<Ico>();
      json['ico'].forEach((v) {
        ico.add(new Ico.fromJson(v));
      });
    }
    if (json['mining'] != null) {
      mining = new List<Mining>();
      json['mining'].forEach((v) {
        mining.add(new Mining.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.analysis != null) {
      data['analysis'] = this.analysis.map((v) => v.toJson()).toList();
    }
    if (this.blockchain != null) {
      data['blockchain'] = this.blockchain.map((v) => v.toJson()).toList();
    }
    if (this.exchanges != null) {
      data['exchanges'] = this.exchanges.map((v) => v.toJson()).toList();
    }
    if (this.general != null) {
      data['general'] = this.general.map((v) => v.toJson()).toList();
    }
    if (this.government != null) {
      data['government'] = this.government.map((v) => v.toJson()).toList();
    }
    if (this.ico != null) {
      data['ico'] = this.ico.map((v) => v.toJson()).toList();
    }
    if (this.mining != null) {
      data['mining'] = this.mining.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Analysis {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Analysis(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Analysis.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}  class Mining {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Mining(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Mining.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}class Ico {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Ico(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Ico.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}
class Blockchain {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Blockchain(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Blockchain.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}
class General {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  General(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  General.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}
class Exchanges {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Exchanges(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Exchanges.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
} class Government {
  String sId;
  double hotness;
  double activityHotness;
  String primaryCategory;
  int words;
  List<SimilarArticles> similarArticles;
  List<Coins> coins;
  String description;
  String publishedAt;
  String title;
  String url;
  Source source;
  String thumbnail;
  String sourceDomain;
  String originalImageUrl;

  Government(
      {this.sId,
        this.hotness,
        this.activityHotness,
        this.primaryCategory,
        this.words,
        this.similarArticles,
        this.coins,
        this.description,
        this.publishedAt,
        this.title,
        this.url,
        this.source,
        this.thumbnail,
        this.sourceDomain,
        this.originalImageUrl});

  Government.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hotness = json['hotness'];
    activityHotness = json['activityHotness'];
    primaryCategory = json['primaryCategory'];
    words = json['words'];
    if (json['similarArticles'] != null) {
      similarArticles = new List<SimilarArticles>();
      json['similarArticles'].forEach((v) {
        similarArticles.add(new SimilarArticles.fromJson(v));
      });
    }
    if (json['coins'] != null) {
      coins = new List<Coins>();
      json['coins'].forEach((v) {
        coins.add(new Coins.fromJson(v));
      });
    }
    description = json['description'];
    publishedAt = json['publishedAt'];
    title = json['title'];
    url = json['url'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    thumbnail = json['thumbnail'];
    sourceDomain = json['sourceDomain'];
    originalImageUrl = json['originalImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['hotness'] = this.hotness;
    data['activityHotness'] = this.activityHotness;
    data['primaryCategory'] = this.primaryCategory;
    data['words'] = this.words;
    if (this.similarArticles != null) {
      data['similarArticles'] =
          this.similarArticles.map((v) => v.toJson()).toList();
    }
    if (this.coins != null) {
      data['coins'] = this.coins.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['title'] = this.title;
    data['url'] = this.url;
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['thumbnail'] = this.thumbnail;
    data['sourceDomain'] = this.sourceDomain;
    data['originalImageUrl'] = this.originalImageUrl;
    return data;
  }
}

class SimilarArticles {
  String sId;
  String title;
  String publishedAt;
  String sourceDomain;
  String url;
  String thumbnail;

  SimilarArticles(
      {this.sId,
        this.title,
        this.publishedAt,
        this.sourceDomain,
        this.url,
        this.thumbnail});

  SimilarArticles.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    publishedAt = json['publishedAt'];
    sourceDomain = json['sourceDomain'];
    url = json['url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['publishedAt'] = this.publishedAt;
    data['sourceDomain'] = this.sourceDomain;
    data['url'] = this.url;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Coins {
  String sId;
  String name;
  String slug;
  String tradingSymbol;

  Coins({this.sId, this.name, this.slug, this.tradingSymbol});

  Coins.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    tradingSymbol = json['tradingSymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['tradingSymbol'] = this.tradingSymbol;
    return data;
  }
}

class Source {
  String sId;
  String name;
  String url;
  String favicon;

  Source({this.sId, this.name, this.url, this.favicon});

  Source.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    url = json['url'];
    favicon = json['favicon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['url'] = this.url;
    data['favicon'] = this.favicon;
    return data;
  }
}