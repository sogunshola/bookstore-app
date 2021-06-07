import '../../shared/abstract_api.dart';

class BookApiService extends AbstractApiService {
  BookApiService() : super(resource: '1.0');

  Future newBooks() async {
    return await get(url: 'new');
  }

  Future getBook(String id) async {
    return await get(url: 'books/$id');
  }

  Future popularBooks() async {
    return await get(url: 'search/nest');
  }
}
