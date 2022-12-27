import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
    
class LoadingCharactersList extends StatelessWidget {

  const LoadingCharactersList({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 20),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                height: 200,
                width: 130,
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12)
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                height: 15,
                width: 130,
                margin: EdgeInsets.only(right: 20, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12)
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Container(
                height: 15,
                width: 50,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12)
                  ),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}