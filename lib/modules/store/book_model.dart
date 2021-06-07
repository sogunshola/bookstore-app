///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class Book {
/*
{
  "error": "0",
  "title": "Web Scraping with Python, 2nd Edition",
  "subtitle": "Collecting More Data from the Modern Web",
  "authors": "Ryan Mitchell",
  "publisher": "O'Reilly Media",
  "language": "English",
  "isbn10": "1491985577",
  "isbn13": "9781491985571",
  "pages": "308",
  "year": "2018",
  "rating": "4",
  "desc": "If programming is magic then web scraping is surely a form of wizardry. By writing a simple automated program, you can query web servers, request data, and parse it to extract the information you need. The expanded edition of this practical book not only introduces you web scraping, but also serves ...",
  "price": "$35.87",
  "image": "https://itbook.store/img/books/9781491985571.png",
  "url": "https://itbook.store/books/9781491985571"
} 
*/

  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? isbn13;
  int? pages;
  String? year;
  double? rating;
  String? desc;
  String? price;
  String? image;
  String? url;

  Book({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
  });
  Book.fromJson(Map<String, dynamic> json) {
    error = json["error"]?.toString();
    title = json["title"]?.toString();
    subtitle = json["subtitle"]?.toString();
    authors = json["authors"]?.toString();
    publisher = json["publisher"]?.toString();
    language = json["language"]?.toString();
    isbn10 = json["isbn10"]?.toString();
    isbn13 = json["isbn13"]?.toString();
    pages = int.parse(json["pages"] ?? "0");
    year = json["year"]?.toString();
    rating = double.parse(json["rating"] ?? "0");
    desc = json["desc"]?.toString();
    price = json["price"]?.toString();
    image = json["image"]?.toString();
    url = json["url"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["error"] = error;
    data["title"] = title;
    data["subtitle"] = subtitle;
    data["authors"] = authors;
    data["publisher"] = publisher;
    data["language"] = language;
    data["isbn10"] = isbn10;
    data["isbn13"] = isbn13;
    data["pages"] = pages;
    data["year"] = year;
    data["rating"] = rating;
    data["desc"] = desc;
    data["price"] = price;
    data["image"] = image;
    data["url"] = url;
    return data;
  }
}