import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../book_model.dart';
import '../book_repository.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final _bookRepository = BookRepository();
  BookCubit() : super(BookInitial());

  Future<void> getBooks() async {
    final currentState = state;
    try {
      final newBooks = await _bookRepository.getNewBooks();
      final porpularBooks = await _bookRepository.getPopularBooks();
      if (currentState is BookLoaded) {
        emit(currentState.copyWith(
            newBooks: newBooks, popularBooks: porpularBooks));
      } else {
        emit(BookLoaded(newBooks: newBooks, popularBooks: porpularBooks));
      }
    } catch (e) {
      emit(BookFailed(error: e.toString()));
    }
  }

  // Future<void> getPopularBooks() async {
  //   final currentState = state;
  //   try {
  //     final books = await _bookRepository.getPopularBooks();
  //     Console.log('POPULAR BOOK', books);
  //     if (currentState is BookLoaded) {
  //       emit(currentState.copyWith(popularBooks: books));
  //     } else {
  //       emit(BookLoaded(popularBooks: books));
  //     }
  //   } catch (e) {
  //     emit(BookFailed(error: e.toString()));
  //   }
  // }

  Future<void> getOneBook(String id) async {
    final currentState = state;
    emit(BookLoading());
    try {
      final book = await _bookRepository.getBook(id);
      if (currentState is BookLoaded) {
        emit(currentState.copyWith(book: book));
      }
    } catch (e) {
      emit(BookFailed(error: e.toString()));
    }
  }
}
