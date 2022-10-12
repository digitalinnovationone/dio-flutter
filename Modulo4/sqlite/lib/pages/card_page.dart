import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_detail.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';

import '../model/card_detail.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  var cardDetailtRepository = CardDetailtRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailtRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null
              ? LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetail!.id,
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  cardDetail!.url,
                                  height: 20,
                                ),
                                Text(
                                  cardDetail!.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(cardDetail!.text,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Ler Mais",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
