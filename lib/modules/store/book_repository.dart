import '../../models/data_response_model.dart';
import '../../utils/console.dart';
import 'book_model.dart';
import 'book_service.dart';

class BookRepository {
  final BookApiService _apiService = BookApiService();

  Future<List<Book>> getNewBooks() async {
    final response = await _apiService.newBooks();
    // Console.log('RESPONSE', response);
    final data = DataResponseModel.fromJson(response);
    return (data.books as List<dynamic>)
        .map((data) => Book.fromJson(data))
        .toList();
  }

  Future<List<Book>> getPopularBooks() async {
    final response = await _apiService.popularBooks();
    // Console.log('RESPONSE', response);
    final data = DataResponseModel.fromJson(response);
    return (data.books as List<dynamic>)
        .map((data) => Book.fromJson(data))
        .toList();
  }

  Future<Book> getBook(String id) async {
    final response = await _apiService.getBook(id);
    Console.log('RESPONSE', response);
    return Book.fromJson(response);
  }
}
