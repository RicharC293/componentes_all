import 'package:app_components/widgets/fade_image.dart';
import 'package:flutter/material.dart';


//https://picsum.photos/
class PhotoScreen extends StatelessWidget {
  PhotoScreen({super.key});
  static const routeName = '/photo';

  final imageNetwork =
      'https://media.licdn.com/dms/image/C4E03AQGoyfc-MIJi6A/profile-displayphoto-shrink_400_400/0/1571083364795?e=1708560000&v=beta&t=k1PPvUjJpuGAKUmhkvxWEToEWZqD7shsrpMdXYuLYvE';

  final listImages =
      List.generate(50, (index) => 'https://picsum.photos/id/$index/1200');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album de fotos'),
        actions: const [
          CircleAvatar(
            child: Text('RC'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    imageNetwork,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Richar Cangui',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Mis Recuerdos'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: listImages
                .map(
                  (image) => Card(
                    elevation: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeImage(
                        urlImage: image,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
