import 'package:flutter/material.dart';

import '../../models/lsp_model.dart';

class LspDummy extends StatefulWidget {
  const LspDummy({Key? key}) : super(key: key);

  @override
  State<LspDummy> createState() => _LspDummyState();
}

class _LspDummyState extends State<LspDummy> {
  List<LspModel> lspList = [
    LspModel('hello', '1', '1', '1'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LspDummy'),
      ),
      body: ListView.builder(
        itemCount: lspList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print(lspList[index].lspId);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    lspList[index].lspId,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
