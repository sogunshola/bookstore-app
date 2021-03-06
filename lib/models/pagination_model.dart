class PaginationModel {
  int page = 1;
  late int pageCount;
  int perPage = 10;
  int? total;
  int? skipped;

  PaginationModel(
      {required this.page,
      required this.pageCount,
      required this.perPage,
      this.total,
      this.skipped});

  PaginationModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageCount = json['pageCount'];
    perPage = json['perPage'];
    total = json['total'];
    skipped = json['skipped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['pageCount'] = pageCount;
    data['perPage'] = perPage;
    data['total'] = total;
    data['skipped'] = skipped;
    return data;
  }
}
