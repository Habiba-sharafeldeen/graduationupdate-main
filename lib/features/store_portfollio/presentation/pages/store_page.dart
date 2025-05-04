import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/core/utils/colors.dart';
import 'package:graduation/features/Category/presentation/pages/category_screen.dart';
import 'package:graduation/features/Item_view/presentation/pages/Item_view.dart';

class StorePorfollio extends StatefulWidget {
  const StorePorfollio({super.key});

  @override
  State<StorePorfollio> createState() => _StorePorfollioState();
}

class _StorePorfollioState extends State<StorePorfollio>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start above the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List images = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/JACKETS-1.jpg',
    'https://www.dresscodeme.com/wp-content/uploads/2024/07/SHIRTS-2.jpg',
    'https://www.dresscodeme.com/wp-content/uploads/2024/07/SALE-1.png',
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/New-Arrival.png'
  ];

  List imagess = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-10-23T145255.520.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/10/20241011_120447_0000.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/09/Untitled-design-87.png',
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/20241001_104542_0000.png'
  ];

  List cat = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/03/DC-Website-Bannerds-Template-for-web.webp',
    'https://www.dresscodeme.com/wp-content/uploads/2024/04/DRESSES-4.jpg',
    'https://www.dresscodeme.com/wp-content/uploads/2021/10/Sets-Banner.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: AppBar(
        //   title: CachedNetworkImage(
        //       width: 45,
        //       fit: BoxFit.contain,
        //       imageUrl:
        //           'https://www.dresscodeme.com/wp-content/themes/dress-code/img/dc-logo.png'),
        //   backgroundColor: Colors.transparent,
        // ),

        // drawer: Drawer(
        //   child: SizedBox(
        //     height: 300, // Set your custom height here
        //     child: Column(
        //       children: [
        //         UserAccountsDrawerHeader(
        //           decoration: const BoxDecoration(
        //               image: DecorationImage(
        //                   image: CachedNetworkImageProvider(
        //                       'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-11-28T140903.273.jpg'))),
        //           accountName: Text(
        //             "",
        //             style: GoogleFonts.anton(color: Colors.black),
        //           ),
        //           accountEmail: Text("",
        //               style: GoogleFonts.lato(fontWeight: FontWeight.w500)),
        //         ),
        //         ListTile(
        //           title: Text(
        //             "NEW IN",
        //             style: GoogleFonts.lato(),
        //           ),
        //           onTap: () {},
        //         ),
        //         ListTile(
        //           title: Text(
        //             "SALE",
        //             style: GoogleFonts.lato(),
        //           ),
        //           onTap: () {},
        //         ),
        //         ListTile(
        //           title: Text(
        //             "WOMEN",
        //             style: GoogleFonts.lato(),
        //           ),
        //           onTap: () {},
        //         ),
        //         ListTile(
        //           title: Text(
        //             "MEN",
        //             style: GoogleFonts.lato(),
        //           ),
        //           onTap: () {},
        //         ),
        //         ListTile(
        //           title: Text(
        //             "ABOUT US",
        //             style: GoogleFonts.lato(),
        //           ),
        //           onTap: () {},
        //         ),
        //       ],
        //     ),
        //   ),
        // ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopPortfollioWidget(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  thickness: .1,
                  color: ColorManager.primaryColor,
                ),
              ),
              PhotosCollWidget(
                image: images,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "NEW ARRAIVAL",
                        style: GoogleFonts.anton(),
                      ),
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0), // Start above the screen
                        end: Offset.zero, // End at the original position
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.easeInOut,
                      )),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: GoogleFonts.anton(),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Column(
                            children: [
                              CachedNetworkImage(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  fit: BoxFit.cover,
                                  imageUrl: cat[index]),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CategoryScreen()));
                                  },
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder()),
                                      backgroundColor:
                                          WidgetStatePropertyAll(Colors.black)),
                                  child: Text(
                                    "Shop now",
                                    style:
                                        GoogleFonts.anton(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PhotosCollWidget extends StatefulWidget {
  const PhotosCollWidget({
    super.key,
    required this.image,
  });
  final List image;
  @override
  State<PhotosCollWidget> createState() => _PhotosCollWidgetState();
}

class _PhotosCollWidgetState extends State<PhotosCollWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start above the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      width: double.infinity,
      child: Row(
        children: [
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0), // Start above the screen
              end: Offset.zero, // End at the original position
            ).animate(CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            )),
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .38,
                width: MediaQuery.of(context).size.width * .48,
                child: CachedNetworkImage(
                  imageUrl: widget.image[3],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0), // Start above the screen
                      end: Offset.zero, // End at the original position
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8, right: 8, bottom: 8),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .18,
                        width: MediaQuery.of(context).size.width * .2,
                        child: CachedNetworkImage(
                          imageUrl: widget.image[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0), // Start above the screen
                      end: Offset.zero, // End at the original position
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeInOut,
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .18,
                        width: MediaQuery.of(context).size.width * .23,
                        child: CachedNetworkImage(
                          imageUrl: widget.image[1],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Start above the screen
                  end: Offset.zero, // End at the original position
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                )),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, left: 0, top: 9),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .18,
                    width: MediaQuery.of(context).size.width * .45,
                    child: CachedNetworkImage(
                      imageUrl: widget.image[2],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.imagess, required this.index});

  final List imagess;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductViewScreen()));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width * .5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * .5,
                    fit: BoxFit.cover,
                    imageUrl: imagess[index]),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 30,
                    alignment: Alignment.center,
                    width: 40,
                    color: Colors.red,
                    child: Text("NEW",
                        style: GoogleFonts.anton(color: Colors.white)),
                  ),
                )
              ],
            ),
            Text(
              "Cropped Velvet Set",
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.w800, color: Colors.grey.shade600),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Row(
                children: [
                  Text(
                    "1,119,00 EGP ",
                    style: GoogleFonts.abel(
                        fontWeight: FontWeight.w800, color: Colors.black),
                  ),
                  Text(
                    "1,900,00",
                    style: GoogleFonts.abel(
                        fontWeight: FontWeight.w800,
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black),
                  ),
                  // Text(
                  //   "  Save 35%",
                  //   style: GoogleFonts.abel(
                  //       fontWeight: FontWeight.w800,
                  //       fontSize: 12,
                  //       color: Colors.red),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ViewCollectionPhotosWidget extends StatefulWidget {
  const ViewCollectionPhotosWidget({
    super.key,
    required this.images,
  });

  final List images;

  @override
  State<ViewCollectionPhotosWidget> createState() =>
      _ViewCollectionPhotosWidgetState();
}

class _ViewCollectionPhotosWidgetState extends State<ViewCollectionPhotosWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(-1, 0), // Start above the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [
        SlideTransition(
          position: _animation,
          child: StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: CachedNetworkImage(
                width: 100, fit: BoxFit.contain, imageUrl: widget.images[0]),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // Start above the screen
            end: Offset.zero, // End at the original position
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: CachedNetworkImage(
                width: 100, fit: BoxFit.cover, imageUrl: widget.images[1]),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1), // Start above the screen
            end: Offset.zero, // End at the original position
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: CachedNetworkImage(
                width: 100, fit: BoxFit.contain, imageUrl: widget.images[2]),
          ),
        ),
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0), // Start above the screen
            end: Offset.zero, // End at the original position
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: CachedNetworkImage(
                width: 100, fit: BoxFit.contain, imageUrl: widget.images[3]),
          ),
        ),
      ],
    );
  }
}

class ImagesDesWidget extends StatelessWidget {
  const ImagesDesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
                height: 300,
                width: MediaQuery.of(context).size.width * .5,
                fit: BoxFit.cover,
                imageUrl:
                    'https://www.dresscodeme.com/wp-content/uploads/2023/09/New-Arrival.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
                height: 300,
                width: MediaQuery.of(context).size.width * .4,
                fit: BoxFit.cover,
                imageUrl:
                    'https://www.dresscodeme.com/wp-content/uploads/2023/09/JACKETS-1.jpg'),
          )
        ],
      ),
    );
  }
}

class TopPortfollioWidget extends StatelessWidget {
  const TopPortfollioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        children: [
          CachedNetworkImage(
              // placeholder: ,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .3,
              fit: BoxFit.fill,
              imageUrl:
                  'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-11-28T140903.273.jpg'),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .007,
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.height * .089,
              backgroundColor: ColorManager.primaryColor,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * .085,
                backgroundColor: Colors.white,
                child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * .25,
                    fit: BoxFit.contain,
                    imageUrl:
                        'https://www.dresscodeme.com/wp-content/themes/dress-code/img/dc-logo.png'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: MediaQuery.of(context).size.width * .05,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dress Code me',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.anton(fontSize: 18),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          'Shop for Women\'s colothes in Egypt',
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
