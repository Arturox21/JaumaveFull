import 'package:flutter/material.dart';
import 'package:mave/modelos/events_model.dart';
import 'package:mave/widgets/shared/theme.dart';
import 'package:mave/modelos/Ver_Eventos.dart';

class PopularCard extends StatelessWidget {
  final EventModel event;

  const PopularCard(
    this.event, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 298, //258
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 266,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://api.jaumaveonline.com:8463/optimize/${event.image!}"),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            event.name!,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '${event.day!} ${event.month!} • ${event.time!}',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            width: double.infinity,
            height: 33,
            child: TextButton(
              /*child: Padding(
                padding: EdgeInsets.only(bottom: 7),
              ),*/
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerEventos(
                              title: event.name!,
                              image: event.image!,
                              description: event.details!,
                              location: event.location!,
                              day: event.day!,
                              month: event.month!,
                              time: event.time!,
                            )));
              },
              style: TextButton.styleFrom(
                backgroundColor: orangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Ver',
                style: whiteTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
