import 'utils.dart';
import 'node.dart';

export 'utils.dart';
export 'node.dart';

Node generateHuffmanTree(List<Node> nodes) {
  if (nodes.length <= 1) {
    Node root = nodes.removeAt(0);
    return root;
  }

  Node n1 = nodes.removeAt(0);
  Node n2 = nodes.removeAt(0);

  Node n = new Node(char: "#", prob: n1.prob + n2.prob);

  n.left = n1;
  n.right = n2;

  nodes.add(n);
  nodes = sort_node(nodes);
  return generateHuffmanTree(nodes);
}

Map<String, String> generateHuffmanTable({Node node}) {
  Map<String, String> table = _generateHuffmanTable(node: node);

  if (table.length == 1) {
    var key = table.keys.toList()[0];
    table[key] = "1";
  }

  return table;
}

Map<String, String> _generateHuffmanTable({Node node, bool left = true, code = ""}) {
  //If it is leaf node
  if (node.left == null && node.right == null) {
    return {node.char: code};
  }

  Map<String, String> table = Map<String, String>();
  table.addAll(
      _generateHuffmanTable(node: node.left, left: true, code: code + '0'));

  table.addAll(
      _generateHuffmanTable(node: node.right, left: false, code: code + '1'));

  return table;
}

Map<String, dynamic> compressor(Map<String, String> table, String message) {
  String huff_code = "";

  for (int i = 0; i < message.length; i++) {
    huff_code += table[message[i]];
  }

  Map<String, dynamic> huff_message = Map<String, dynamic>();
  huff_message["table"] = table;
  huff_message["message"] = huff_code;
  return huff_message;
}

String decompressor(Map<String, dynamic> huff_message) {
  Map<String, dynamic> huff_table = huff_message["table"];
  String message = huff_message["message"];
  Map<String, String> reversed_huff_tree =
      Map.fromEntries(huff_table.entries.map((e) => MapEntry(e.value, e.key)));

  String original_message = "";
  String char = "";

  for (int i = 0; i < message.length; i++) {
    char += message[i];
    if (huff_table.containsValue(char)) {
      original_message += reversed_huff_tree[char];
      char = "";
    }
  }
  return original_message;
}
