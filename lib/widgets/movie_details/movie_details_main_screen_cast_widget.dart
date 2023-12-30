import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainScreenCastWidget extends StatelessWidget {
  const MovieDetailsMainScreenCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Актёрский состав", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white),),
        ),
        SizedBox(
          height: 300,
          child: Scrollbar(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 20,
                itemExtent: 130,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black.withOpacity(0.2)),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2)
                            )
                          ]
                      ),
                      child: const ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Image(image: AssetImage(AppImages.actor)),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Jeffrey Wright', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 7,),
                                  Text('Наблюдатель (голос)', maxLines: 3, overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 7,),
                                  Text('27 эпизодов', maxLines: 1, overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: TextButton(onPressed: (){}, child: const Text("Полный актёрский и съёмочный состав")),
        ),
      ],
    );
  }
}
