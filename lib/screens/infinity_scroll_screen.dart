import 'package:app_components/services/services.dart';
import 'package:flutter/material.dart';

import '../widgets/fade_image.dart';

class InfinityScrollScreen extends StatefulWidget {
  const InfinityScrollScreen({super.key});

  static const routeName = '/infinity-scroll';

  @override
  State<InfinityScrollScreen> createState() => _InfinityScrollScreenState();
}

class _InfinityScrollScreenState extends State<InfinityScrollScreen> {
  List<String>? _images;

  int _initialImage = 1;
  final _amount = 5;

  bool _isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.microtask(_fetchImages);
    _scrollController.addListener(_listener);
  }

  Future<List<String>> _fetchImages() async {
    _isLoading = true;
    setState(() {});
    final fetchImages =
        await Services.instance.getImages(_initialImage, _amount);
    /// Si el widget no está montado, no se actualiza el estado PREVIENE ERROR
    if(!mounted) return [];
    _images = [...?_images, ...fetchImages];
    _initialImage += _amount;
    _isLoading = false;
    setState(() {});
    return _images!;
  }

  void _listener() {
    if (_scrollController.position.pixels + 100 >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _fetchImages();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinity Scroll')),
      bottomNavigationBar: _isLoading && _images != null
          ? const LinearProgressIndicator()
          : const SizedBox(),
      body: _images == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: _images?.length ?? 0,
              itemBuilder: (context, index) {
                final url = _images![index];
                return Card(
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeImage(
                      urlImage: url,
                    ),
                  ),
                );
              },
            ),
      // Uso del NotificationListener
      // body: _images == null
      //     ? const Center(child: CircularProgressIndicator())
      //     : NotificationListener<ScrollNotification>(
      //         onNotification: (scrollNotification) {
      //           if (scrollNotification.metrics.pixels ==
      //                   scrollNotification.metrics.maxScrollExtent &&
      //               !_isLoading) {
      //             _fetchImages();
      //           }
      //           return true;
      //         },
      //         child: ListView.builder(
      //           physics: const BouncingScrollPhysics(),
      //           itemCount: _images?.length ?? 0,
      //           itemBuilder: (context, index) {
      //             final url = _images![index];
      //             return Card(
      //               elevation: 10,
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(10),
      //                 child: FadeImage(
      //                   urlImage: url,
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),

      /// Uso del Future Builder
      // body: FutureBuilder(
      //   future: _fetchImages(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     return ListView.builder(
      //       physics: const BouncingScrollPhysics(),
      //       itemCount: _images?.length ?? 0,
      //       itemBuilder: (context, index) {
      //         final url = _images![index];
      //         return Card(
      //           elevation: 10,
      //           child: ClipRRect(
      //             borderRadius: BorderRadius.circular(10),
      //             child: FadeImage(
      //               urlImage: url,
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   }
      // ),
    );
  }
}
