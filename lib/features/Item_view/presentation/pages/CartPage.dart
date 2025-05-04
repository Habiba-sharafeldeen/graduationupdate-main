import 'package:flutter/material.dart';
import 'package:graduation/features/home/presentation/pages/home_page.dart';

class CartPage extends StatelessWidget{
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff1F4529),),
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
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
return const MyHomePage();
  }));
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
    Navigator.pop(context);
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
       body: 
    Column(children: [
        const Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23,bottom:25 ),
              child: Text('My Cart',style: TextStyle(fontSize: 40,color: Color(0xff1F4529)),),
            ),
          ],
        ),
        Expanded(child: ListView.builder(
          itemCount: 3,
          padding: const EdgeInsets.all(12),
          itemBuilder: (context,index){
        return Padding(padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color:  const Color(0xffE8ECD7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Image.asset('assets/images/49613023-4087-4f29-92b7-db4e8a8cfbb0.jpg',height: 36,),
           title: const Text('ProductName'),
           subtitle: const Text('\$700.00'),
           trailing: IconButton(
            icon:const Icon(Icons.cancel,),
           onPressed:(){}
           ),
          ),
        ),
        );
          }),
          ),

          Padding(padding: const EdgeInsets.all(36),
          child: Container(
            decoration: BoxDecoration(
              color:const Color(0xff1F4529),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(24),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(children: [
                  Text('Total Price',style: TextStyle(color: Colors.white),),
                  Text('\$2100.00',style: TextStyle(color: Colors.white)),
                ],),
               // SizedBox(width: 630,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade100),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  
                  padding: const EdgeInsets.all(12),
                  child: const Row(
                  children: [
                    Text('Pay Now',style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward_ios,size: 16,color: Colors.white,),
                  ],
                ),)
                
              ],
            ),
          ),
          ),
          
      
       ],),

       );
  }
}