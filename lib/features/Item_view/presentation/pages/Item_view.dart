import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/core/utils/colors.dart';
import 'package:graduation/features/store_portfollio/presentation/pages/store_page.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  String selectedSize = 'Medium'; // Default selected size

  void selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  List images = [
    "https://www.dresscodeme.com/wp-content/uploads/2023/06/49-5.jpg",
    "https://www.dresscodeme.com/wp-content/uploads/2023/06/49-1.jpg",
    "https://www.dresscodeme.com/wp-content/uploads/2023/06/49-4.jpg",
    "https://www.dresscodeme.com/wp-content/uploads/2023/06/49-8.jpg"
  ];
  List imagess = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-10-23T145255.520.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/10/20241011_120447_0000.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/09/Untitled-design-87.png',
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/20241001_104542_0000.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: GoogleFonts.roboto(fontWeight: FontWeight.w800),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * .08,
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(5)),
          child: Text(
            "Add To Cart",
            style: GoogleFonts.abel(
                fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCollectionWidget(images: images),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        'Ucla Oversized Sweater In Black',
                        maxLines: 1,
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ),
                    Text(
                      '1900.00 EGP',
                      style: GoogleFonts.abel(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: ColorManager.primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const StarsWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Size",
                        style: GoogleFonts.abel(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizeButton(
                            size: 'S',
                            isSelected: selectedSize == 'S',
                            onPressed: () => selectSize('S'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizeButton(
                            size: 'M',
                            isSelected: selectedSize == 'M',
                            onPressed: () => selectSize('M'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizeButton(
                            size: 'L',
                            isSelected: selectedSize == 'L',
                            onPressed: () => selectSize('L'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizeButton(
                            size: 'X',
                            isSelected: selectedSize == 'X',
                            onPressed: () => selectSize('X'),
                          ),
                        ],
                      )
                    ]),
              ),
              ChooseColorWidget(images: images),
              const MadeByWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: Text(
                  "Similar Product",
                  style: GoogleFonts.abel(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RecommandItemsWidget(imagess: imagess),
                    RecommandItemsWidget(imagess: imagess),
                    RecommandItemsWidget(imagess: imagess),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageCollectionWidget extends StatelessWidget {
  const ImageCollectionWidget({
    super.key,
    required this.images,
  });

  final List images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * .5,
                  fit: BoxFit.contain,
                  imageUrl: images[index]),
            );
          }),
    );
  }
}

class ChooseColorWidget extends StatelessWidget {
  const ChooseColorWidget({
    super.key,
    required this.images,
  });

  final List images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Choose Color",
          style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .16,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * .1,
                      fit: BoxFit.contain,
                      imageUrl:
                          "https://www.dresscodeme.com/wp-content/uploads/2023/06/44-4.jpg"),
                );
              }),
        ),
      ]),
    );
  }
}

class RecommandItemsWidget extends StatelessWidget {
  const RecommandItemsWidget({
    super.key,
    required this.imagess,
  });

  final List imagess;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemWidget(
            imagess: imagess,
            index: 0,
          )
        ],
      ),
    );
  }
}

class MadeByWidget extends StatelessWidget {
  const MadeByWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const StorePorfollio()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: MediaQuery.of(context).size.width * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorManager.primaryColor, width: .1)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height * .043,
                      backgroundColor: ColorManager.primaryColor,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * .04,
                        backgroundColor: Colors.white,
                        child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width * .1,
                            fit: BoxFit.contain,
                            imageUrl:
                                'https://www.dresscodeme.com/wp-content/themes/dress-code/img/dc-logo.png'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.anton(),
                                "Dress Code Me"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.abel(),
                                "Dresssadbsahdgsahjdghajsdghjsagdhjsagdhjsagdhjsagdhjasgdhsagdhjsagdhj Code Me"),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const StarsWidget(),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          shape:
                              WidgetStatePropertyAll(RoundedRectangleBorder()),
                          backgroundColor: WidgetStatePropertyAll(
                              ColorManager.primaryColor)),
                      child: Text(
                        "Shop Now",
                        style: GoogleFonts.anton(color: Colors.white),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(Icons.star_border_outlined),
          Icon(Icons.star_border_outlined),
          Icon(Icons.star_border_outlined),
          Icon(Icons.star_border_outlined),
          Icon(Icons.star_border_outlined),
          SizedBox(
            width: 20,
          ),
          Text("4.5"),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "|500 Sold",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onPressed;

  const SizeButton({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: ColorManager.primaryColor)
              // Rounded corners
              ),
          iconColor: isSelected ? Colors.white : Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          size,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: isSelected ? Colors.white : ColorManager.primaryColor),
        ),
      ),
    );
  }
}
