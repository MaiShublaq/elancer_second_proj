import 'package:elancer_second_proj/api/controllers/csp_api_controller.dart';
import 'package:elancer_second_proj/models/product.dart';
import 'package:elancer_second_proj/widgets/slider-image_product.dart';
import 'package:elancer_second_proj/widgets/slider_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key,
  required this.id}) : super(key: key);
final int id;
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Future<Product?> _future;
  Product? _products = null;
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CspApiController().getproductDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor:const  Color(0xFFFFDA1A),
         title:Text('Product Details',style:TextStyle(
           fontWeight: FontWeight.bold,
           color:Colors.lightBlue
         )),
         centerTitle: true,
         shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
       ),
        backgroundColor: Colors.lightBlue.shade50,
        body: FutureBuilder<Product?>(
        future: _future,
        builder: (context, snapshot)
     {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return const Center(child: CircularProgressIndicator());
       }
       if (snapshot.hasData ) {
         _products = snapshot.data ?? null;
         return ListView(
           children: [
             SliderImageProduct(slider: _products!.images),
       SizedBox(height: 20,),
       Card(
       elevation: 5,
       color: Color(0xFFFFDA1A),
       shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15),
       ),
       child:SizedBox(
       width: 353,
       height: 300,
       child:Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
       child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children:  [
       SizedBox(height: 20,),
       Row(
         children:[

           Text(_products!.nameEn,style:TextStyle(
             fontSize: 19,
             color: Colors.lightBlue,
           ),
             overflow: TextOverflow.clip,
           ),
     const Spacer(),
     const Icon(Icons.star,color: Color(0xFFFFDA1A)),
     Text('${_products!.overalRate}'),
     const SizedBox(width:2),
     ]
       ),
       SizedBox(height: 10,),
       Text(_products!.infoEn,
     overflow: TextOverflow.clip,
       )
       ],
       ),
       )

       )


       )],
         );
       }

       else {
         return Center(
           child: Column(
             children: const [
               Icon(Icons.warning, size: 80),
               Text(
                 'NO DATA',
                 style: TextStyle(
                   color: Colors.grey,
                   fontWeight: FontWeight.bold,
                   fontSize: 24,
                 ),
               )
             ],
           ),
         );
       }
     }
    )
     );
  }
}
