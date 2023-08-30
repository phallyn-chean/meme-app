import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:meme_app/models/cart_card_models.dart';
import 'package:meme_app/models/meme_models.dart';
import 'package:meme_app/providers/cart_counter_provider.dart';
import 'package:meme_app/services/meme_services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MemeServices memeServices = MemeServices();
  late Future<MemeModels> memes;

  @override
  void initState() {
    super.initState();
    memes = memeServices.getMemesApi();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var memeCardProvider = Provider.of<CartCounterProvider>(context, listen: false);
    int cartCounter = context.watch<CartCounterProvider>().getCartCount;
    return Scaffold(
      backgroundColor: const Color(0xffEFE9FF),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Meme App",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 5),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      maxRadius: 10,
                      child: Text("$cartCounter"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder<MemeModels>(
        future: memes,
        builder: (context, snapshot) {
          return Scrollbar(
            radius: const Radius.circular(10),
            thumbVisibility: true,
            thickness: 5,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: DynamicHeightGridView(
                builder: (context, index) {
                  if (snapshot.hasData) {
                    String memeId = snapshot.data!.data!.memes![index].id.toString();
                    String memeName = snapshot.data!.data!.memes![index].name.toString();
                    String memeImageUrl = snapshot.data!.data!.memes![index].url.toString();

                    // ignore: unused_local_variable
                    CartCardModels addCartItems = CartCardModels(id: memeId, nameCart: memeName, imageUrlCart: memeImageUrl);
                    return Card(
                      elevation: 10,
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(memeImageUrl),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.download),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error Occured : ${snapshot.error}"),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  }
                },
                itemCount: snapshot.hasData ? snapshot.data!.data!.memes!.length : 1,
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 10,
              ),
            ),
          );
        },
      ),
    );
  }
}
