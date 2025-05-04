import 'package:flutter/material.dart';
import 'package:graduation/features/Category/presentation/pages/category_screen.dart';
import 'package:graduation/features/Item_view/presentation/pages/CartPage.dart';
import 'package:graduation/features/store_portfollio/presentation/pages/store_page.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Text(
            'Ma7ali | محلي ',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 31, 69, 41)),
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 16,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                    'assets/images/f08642dc-2f4c-485f-9365-acef9b44885c.jpg'),
              ),
            ),
          ),
        ],
      ),
       drawer: Drawer(
      child:ListView(
        padding:EdgeInsets.zero,
        children:[
          const DrawerHeader(
       padding: EdgeInsets.all(16), 
       decoration: BoxDecoration(
        color:Color(0xff1F4529),
       ),
       child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/images/Woman-Icon-Teen-Profile-Graphics-26722130-1.jpg'),
        ),
        SizedBox(width: 16,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User Namme',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xffE8ECD7),),),
            SizedBox(height: 4,),
             Text('UserName@gmail.com',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color:Color(0xffE8ECD7),),),

          ],
        ),
        ],
       ),
          ),
          ListTile(
  leading: const Icon(Icons.call,color: Colors.blueGrey,),
  title: const Text('01288384'),
  onTap: (){
    Navigator.pop(context);
  },
),
ListTile(
  leading: const Icon(Icons.home,color: Colors.blueGrey,),
  title: const Text('Home'),
onTap: (){
    Navigator.pop(context);
  },
),



ListTile(
  leading: const Icon(Icons.location_city,color: Colors.blueGrey,),
  title: const Text('Tanta'),
  onTap: (){
    Navigator.pop(context);
  },
),
ListTile(
  leading: const Icon(Icons.favorite,color: Colors.blueGrey,),
  title: const Text('Favourite'),
  onTap: (){
    Navigator.pop(context);
  },
),
ListTile(
  leading: const Icon(Icons.card_travel,color: Colors.blueGrey,),
  title: const Text('My Cart'),
 onTap: (){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
return const CartPage();
  }));
 },
  
),


ListTile(
  leading: const Icon(Icons.settings,color: Colors.blueGrey,),
  title: const Text('Settings'),
  onTap: (){
    Navigator.pop(context);
  },
),

ListTile(
  leading: const Icon(Icons.logout,color: Colors.redAccent,),
  title: const Text('Logout'),
  onTap: (){
    Navigator.pop(context);
  },
),
        
     ] ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: ListView(
          children: [
            const Text(
              'Find It.Love It.Own It.',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                labelText: 'Search Here',
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Shop Our Top Categories',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Categorieslistview(),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/f08642dc-2f4c-485f-9365-acef9b44885c.jpg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Todays Best Deals For You!',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Bigcardlistview(),
                const Text(
                  'Choose By Brand',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Finalcontainerlistview(),
                const Text(
                  'weekly Popular Products',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Bigcardlistview(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Todays Best Deals For You!',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Buttoncollectionlistview(),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            Bigcardlistview(),
            const SizedBox(
              height: 15,
            ),
            Bigcardlistview(),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Most Selling Product',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 25,
            ),
            Bigcardlistview(),
            const SizedBox(
              height: 50,
            ),
            // Customrow(),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

//ElevatedButton(onPressed: (){
// Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
//   return SignUpPage();
// }));
// },
//   child: Text('Sign Up',style: TextStyle(color: Colors.black, fontSize: 15),),),

class Bigcard extends StatelessWidget {
  const Bigcard({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.height * .3,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                "assets/images/778d34770c352bb45ed3b9394b1540b6.jpg",
              ),
            )),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.height * .31,
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'HomePod mini',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            r'$99.00',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '5 Colors Available',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 17.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 17.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 17.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 17.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                          size: 17.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ],
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Categorieslistview extends StatelessWidget {
  const Categorieslistview({super.key});

  final List<CategoryModel> category = const [
    CategoryModel(
        CategoryName: 'Hand Bag',
        Image: 'assets/images/64185e5d291c410fd84041217d537f91.jpg'),
    CategoryModel(
        CategoryName: 'Sneakers',
        Image: 'assets/images/151f03a8a627cdf8b8fee9ebe1d67aaa.jpg'),
    CategoryModel(
        CategoryName: 'Travel',
        Image: 'assets/images/2231300d90274ba6f0ac93b65e213d29.jpg'),
    CategoryModel(
        CategoryName: 'Shoes',
        Image: 'assets/images/959ce4ceb59e03701a343e73ca5eb3df.jpg'),
    CategoryModel(
        CategoryName: 'Clothes',
        Image: 'assets/images/c43ef5d84f32d541f4746d71c4f82675.jpg'),
    CategoryModel(
        CategoryName: 'SkinCare',
        Image: 'assets/images/0203b2e05549d0d03fa3d4a1551582e4.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CategoryScreen()));
              },
              child: CategoryCard(
                category: category[index],
              ),
            );
          }),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * .25,
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
          //ممكن احط ايمدج من الاسيتست
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(category.Image),
          ),
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          textAlign: TextAlign.center,
          category.CategoryName,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}

class CategoryModel {
  final String Image;
  final String CategoryName;

  const CategoryModel({required this.CategoryName, required this.Image});
}

class Bigcardlistview extends StatelessWidget {
  List imagess = [
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/Untitled-design-2024-10-23T145255.520.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/10/20241011_120447_0000.png',
    'https://www.dresscodeme.com/wp-content/uploads/2024/09/Untitled-design-87.png',
    'https://www.dresscodeme.com/wp-content/uploads/2023/09/20241001_104542_0000.png'
  ];

  Bigcardlistview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: MediaQuery.of(context).size.height * .4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return ItemWidget(
              imagess: imagess,
              index: index,
            );
          }),
    );
  }
}

class Finalcontainer extends StatelessWidget {
  const Finalcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Staples',
                  image: 'assets/images/c43ef5d84f32d541f4746d71c4f82675.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Sproutes',
                  image: 'assets/images/4d49a7108db132150bf9c9125c8ee5a1.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Grocery outlet',
                  image: 'assets/images/151f03a8a627cdf8b8fee9ebe1d67aaa.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Mollie stones',
                  image: 'assets/images/0203b2e05549d0d03fa3d4a1551582e4.jpg',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Sports Basement',
                  image: 'assets/images/0430bf16e89056a9301c106a4c595130.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Container Store',
                  image: 'assets/images/778d34770c352bb45ed3b9394b1540b6.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Target',
                  image: 'assets/images/959ce4ceb59e03701a343e73ca5eb3df.jpg',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomContainer(
                  maintext: 'Bevmo!',
                  image: 'assets/images/64185e5d291c410fd84041217d537f91.jpg',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  String maintext;
  String image;
  CustomContainer({super.key, required this.maintext, required this.image});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(image), // مسار الصورة
          ),
          // SizedBox(
          //   width: 20,
          // ),
          // Column(
          //   children: [
          //     Text(
          //       '$maintext',
          //       style: TextStyle(color: Colors.black, fontSize: 24),
          //     ),
          //     Text(
          //       'Delivery With In 24 hours',
          //       style: TextStyle(color: Colors.grey, fontSize: 14),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class Finalcontainerlistview extends StatelessWidget {
  const Finalcontainerlistview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StorePorfollio()));
                },
                child: const Finalcontainer());
          }),
    );
  }
}

class Buttoncollectionlistview extends StatelessWidget {
  const Buttoncollectionlistview({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Buttonscollection(Title: 'Gadgets'),
                Buttonscollection(Title: 'Fashion'),
                Buttonscollection(Title: 'Toys'),
                Buttonscollection(Title: 'Education'),
                Buttonscollection(Title: 'Beauty'),
                Buttonscollection(Title: 'Travel'),
                Buttonscollection(Title: 'Fitness'),
                Buttonscollection(Title: 'Furniture'),
                Buttonscollection(Title: 'Sneakers'),
              ],
            );
          }),
    );
  }
}

class Buttonscollection extends StatelessWidget {
  String Title;
  Buttonscollection({super.key, required this.Title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              Title,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}
