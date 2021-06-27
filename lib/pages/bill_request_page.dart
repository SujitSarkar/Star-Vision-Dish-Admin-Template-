import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:star_vision_admin/widgets/bill_request_table_body.dart';
import 'package:star_vision_admin/widgets/form_decoration.dart';

class BillRequestPage extends StatefulWidget {
  @override
  _BillRequestPageState createState() => _BillRequestPageState();
}

class _BillRequestPageState extends State<BillRequestPage> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      child: Column(
        children: [
          // ///Search Header
          // Container(
          //   height: 50,
          //   margin: EdgeInsets.only(top: 10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Container(
          //         width: publicProvider.pageWidth(size),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: Padding(
          //                 padding: EdgeInsets.only(left: 10),
          //                 child: TextFormField(
          //                   decoration: formDecoration(size).copyWith(
          //                     labelText: 'Search by Customer Name',
          //                   ),
          //                 ),
          //               ),
          //             ),
          //
          //             ///Search Button
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: size.height * .008),
          //               child: OutlinedButton(
          //                 onPressed: (){},
          //                 child: Padding(
          //                     padding: EdgeInsets.symmetric(vertical: size.height*.011),
          //                     child: Icon(Icons.search,color: Colors.grey)),
          //               ),
          //             ),
          //
          //             ///Clear Button
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: size.height * .008),
          //               child: OutlinedButton(
          //                 onPressed: (){},
          //                 child: Padding(
          //                     padding: EdgeInsets.symmetric(vertical: size.height*.011),
          //                     child: Icon(Icons.clear,color: Colors.redAccent)),
          //               ),
          //             ),
          //
          //             ///Reload Button
          //             Padding(
          //               padding: EdgeInsets.symmetric(horizontal: size.height * .008),
          //               child: OutlinedButton(
          //                 onPressed: (){},
          //                 child: Padding(
          //                     padding: EdgeInsets.symmetric(vertical: size.height*.011),
          //                     child: Icon(Icons.refresh,color: Color(0xff006F64),)),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Divider(),

          ///Table Header
          Container(
            height: 40,
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _tableHeaderBuilder(size, 'ID'),
                    _tableHeaderBuilder(size, 'Name'),
                    _tableHeaderBuilder(size, 'Billing Number'),
                    _tableHeaderBuilder(size, 'Payment Method'),
                    _tableHeaderBuilder(size, 'Billing Month'),
                    _tableHeaderBuilder(size, 'Payment date'),
                    _tableHeaderBuilder(size, 'Amount'),
                    _tableHeaderBuilder(size, ''),
                  ],
                ),
                Divider(height: 5.0,color: Colors.grey.shade900)
              ],
            ),
          ),

          ///Table Body
          _isLoading
              ?Padding(
            padding:  EdgeInsets.only(top: 100),
            child: Center(child: spinCircle()),
          ): Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 50,
              itemBuilder: (context,index)=>BillRequestTableBody(index: index),
            ),
          )
          //     :Center(child: Column(
          //   children: [
          //     SizedBox(height: 100),
          //     Text('কোন ডেটা নেই!',
          //         style: TextStyle(fontFamily: 'hindSiliguri',
          //             fontSize: size.height*.026,color: Color(0xffF5B454))),
          //     TextButton(
          //         onPressed: ()async{
          //           setState(()=>_isLoading=true);
          //           await databaseProvider.getBodliKhanaDataList().then((value){
          //             setState(()=>_isLoading=false);
          //           });
          //         },
          //         child: Text('রিফ্রেশ করুন',style: TextStyle(fontFamily: 'hindSiliguri',fontSize: size.height*.021,),)
          //     )
          //   ],
          // ))
        ],
      ),
    );
  }

  Widget _tableHeaderBuilder(Size size,String tableHeader){
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          tableHeader,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: size.height*.022,
              fontWeight: FontWeight.bold,
              fontFamily: 'hindSiliguri'
          ),),
      ),
    );
  }
}