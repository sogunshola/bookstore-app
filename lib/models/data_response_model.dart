
/// Data response model.
///
/// Regardless of the method by which the query and variables were sent, the
/// response in this example app is returned in the body of the request in JSON
/// format. A query might result in some data and some errors, and those are
/// returned in a JSON object of the form:
///
/// {
///   "data": { ... }
///   "errors": [ ... ]
/// }
///
/// If there were no errors returned, the "errors" field is not present on the
/// response.
class DataResponseModel {
  DataResponseModel(
      {this.data, this.error, required this.books, required this.total});

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    // final List<dynamic> _errors = json['errors'] as List<dynamic>;

    return DataResponseModel(
        // data: json['data']['data'] as Map<String, dynamic>,
        // errors: _errors
        //     .map<DataResponseErrorModel>((dynamic json) =>
        //         DataResponseErrorModel.fromJson(json as Map<String, dynamic>))
        //     .toList(),
        error: json['error'],
        books: json['books'],
        total: json['total']);
  }

  final Map<String, dynamic>? data;
  // final List<DataResponseErrorModel>? errors;
  final List<dynamic>? books;
  // final String message;
  final String? error;
  final String total;
}
