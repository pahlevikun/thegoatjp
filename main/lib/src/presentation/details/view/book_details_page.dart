import 'package:thegoatjp/src/h.dart';

export 'book_details_page.dart';
export 'book_details_view.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookItemEntity book;

  @override
  BookDetailsPageState createState() => BookDetailsPageState();
}

class BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Injector.locator<BookDetailsBloc>(),
      child: const BookDetailsView(),
    );
  }
}
