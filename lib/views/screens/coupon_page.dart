import 'package:cupon_app/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../helper/coupon_db_helper.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CouponDBHelper.couponDBHelper.fetchAllRecords(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error : ${snapShot.error}"),
              ),
            );
          } else if (snapShot.hasData) {
            List<CouponDB> data = snapShot.data;
            data
                .map((e) => Card(
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text("${e.name}"),
                          ],
                        ),
                      ),
                    ))
                .toList();
          } else {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
