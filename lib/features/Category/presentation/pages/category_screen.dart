import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/core/utils/colors.dart';
import 'package:graduation/features/store_portfollio/presentation/pages/store_page.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List imagess = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-10-23T145255.520.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/10/20241011_120447_0000.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/09/Untitled-design-87.png',
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/20241001_104542_0000.png'
  ];

  List sub_cat = [
    "All",
    "Jacts&Coats",
    "Tops",
    "T-shirts",
    "Hoodies",
    "Basics",
    "Bags",
    "Pants"
  ];

  int index_s = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                Text(
                  "Women",
                  style: GoogleFonts.anton(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
              child: ListView.builder(
                  itemCount: sub_cat.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        index_s = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: index == index_s
                                  ? ColorManager.primaryColor
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              sub_cat[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: GridView.builder(
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            childAspectRatio: .55,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        imagess: imagess,
                        index: index,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
