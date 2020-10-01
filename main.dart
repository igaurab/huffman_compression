import 'src/huffman.dart';
import 'package:args/args.dart';

runHuffman(String message) {
  Map<String, int> chars = char_frequency(message);
  Map<String, double> pd = d_sort_map(prob_dist(chars));
  List<Node> nodes = generateNodeFromMap(pd);
  Node root = generateHuffmanTree(nodes);
  Map<String, String> table = generateHuffmanTable(node: root);
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
}

int main(List<String> args) {
  String message;
  var help = {
    "message": "enter the message you want to compress",
    "help": "-m: message [String] ",
    "char_count": 'Enter character count. Format: {"word": count}',
    "prob_dist":
        'Enter probability distribution of chars. Format: {"word": count}'
  };
  var parser = ArgParser();
  parser.addMultiOption(
    'message',
    abbr: 'm',
    help: help['message'],
  );

  parser.addFlag(
    'help',
    abbr: 'h',
    help: help['help'],
  );
  var argsResult = parser.parse(args);

  if (argsResult['help']) {
    print("""
    Huffman Compression
    --------------------
    ${parser.usage}
    """);
  } else if (argsResult['message'] != null) {
    message = argsResult['message'][0];
    runHuffman(message);
  } else {
    print("[Error] Incorrect Input Format");
  }

  return 1;
}
