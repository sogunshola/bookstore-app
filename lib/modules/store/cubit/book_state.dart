part of 'book_cubit.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookFailed extends BookState {
  final dynamic error;

  const BookFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class BookLoaded extends BookState {
  final List<Book> newBooks;
  final List<Book> popularBooks;
  final Book? book;

  const BookLoaded(
      {this.newBooks = const [], this.popularBooks = const [], this.book});

  BookLoaded copyWith({
    List<Book>? newBooks,
    List<Book>? popularBooks,
    Book? book,
  }) {
    return BookLoaded(
      newBooks: newBooks ?? this.newBooks,
      popularBooks: popularBooks ?? this.popularBooks,
      book: book ?? this.book,
    );
  }

  // @override
  // List<Object> get props => [newBooks, popularBooks];
}
