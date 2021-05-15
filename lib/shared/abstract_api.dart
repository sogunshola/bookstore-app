import 'package:flutter/material.dart';

import '../configs/http_client.dart';
import '../models/pagination_model.dart';

abstract class AbstractApiService extends HttpClient {
  String resource;
  AbstractApiService({@required this.resource}) : super(resource: resource);
  Future getAll(
      {PaginationModel pagination,
      Map<String, dynamic> args = const {}}) async {
    return await get(url: '', data: {
      "page": pagination.page,
      "perPage": pagination.perPage,
      ...args
    });
  }

  Future findOne(String id, {Map<String, dynamic> args = const {}}) async {
    return await get(url: id, data: {...args});
  }

  Future create({dynamic payload}) async {
    return await post(url: '', data: payload);
  }

  Future update(String id, {dynamic payload}) async {
    return await patch(url: id, data: payload);
  }

  Future remove(String id) async {
    return await delete(url: id);
  }
}
