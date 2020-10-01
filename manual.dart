import 'src/huffman.dart';

void main() {
  String message = "Hello World";
  /*
  Map<String,int> chars = {
    'a' : 2,
    'z' : 2,
  }

  Map<String,double> pd = {
    'a' : 0.5,
    'z' : 0.5
  }
   */
  bool m = true; //Set this to false, if you want to provide chars or pd as input
  Map<String, int> chars = char_frequency(message);
  Map<String, double> pd = d_sort_map(prob_dist(chars));
  List<Node> nodes = generateNodeFromMap(pd);
  Node root = generateHuffmanTree(nodes);
  Map<String, String> table = generateHuffmanTable(node: root);

  if (m) {
    Map<String, dynamic> encoded_message = compressor(table, message);
    String original_message = decompressor(encoded_message);

    print("table: ${encoded_message['table']}");
    print("encoded message: ${encoded_message['message']}");
    print("Retrived Message: ${original_message}");

    var len_enc = encoded_message['message'].length;
    var len_mess = message.length * 8; // Assume each char takes 8 bits

    var comp_perctange = ((len_mess - len_enc) / len_mess) * 100;
    print("-" * 30);
    print("${dp(comp_perctange, places: 2)} % compressed ");
  } else {
    print("table: ${table}");
  }
}
