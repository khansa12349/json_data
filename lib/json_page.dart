import 'package:flutter/material.dart';
import 'package:import_data/items.dart';
class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Showing Json Data Using List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),

        ),
        body: FutureBuilder(
            future: fetchItems(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var ItemList = snapshot.data as List<Items>;
                return ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey.shade200,
                    child: ListTile(


                     title: Text('${ItemList[index].name}',
                      style:
                      const TextStyle(
                        fontSize: 14,
                            color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      subtitle:
                      Text('${ItemList[index].code}',
                        style:
                        const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                }
                );
              } else
              {
                return  const CircularProgressIndicator();
              }
            }
        )
    );
  }

  Future<List<Items>> fetchItems(BuildContext context) async {
    final jsonString =
    await DefaultAssetBundle.of(context).loadString('assets/items.json');
    return itemsFromJson(jsonString);
  }
}

