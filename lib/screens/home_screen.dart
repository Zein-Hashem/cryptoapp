import 'package:cryptoapp/controllers/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http.dart';

class HomeScreen extends StatelessWidget {

final CoinController controller =Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff494f55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,top:60),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Crypto Market",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)

              ,Obx(

            ()=>controller.isLoading.value?const Center(child: CircularProgressIndicator(),):
                ListView.builder(
                    shrinkWrap:true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey[700]!,
                                          offset: const Offset(4, 4),
                                          blurRadius: 5
                                        )
                                      ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(controller.coinList[index].image),

                                    ),
                                  ),
                                  const SizedBox(width:30),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10,),
                                      Text(controller.coinList[index].name,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                                      Text("${controller.coinList[index].priceChangePercentage24H.toStringAsFixed(2)}%",style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w600),)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width:10),

                              Column(

                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [

                                  const SizedBox(height: 10,),
                                  Text('\$ ${controller.coinList[index].currentPrice}',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                                  Text(controller.coinList[index].symbol,style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.w600),)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
