import 'dart:math';
import 'dart:collection';

import 'node.dart';

double dp(double val, {int places = 3}) {
  double mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}

Map<String, int> char_frequency(String str) {
  Map<String, int> unique = Map<String, int>();

  for (int i = 0; i < str.length; i++) {
    unique.update(
      str[i],
      (value) {
        value++;
        return value;
      },
      ifAbsent: () => 1,
    );
  }
  return unique;
}

double getTotalDouble(Map<String, double> map) {
  double total = map.values.reduce((value, element) {
    return value + element;
  });
  return total;
}

int getTotalInt(Map<String, int> map) {
  int total = map.values.reduce((value, element) {
    return value + element;
  });
  return total;
}

Map<String, double> prob_dist(Map<String, int> word_freq) {
  Map<String, double> prob_dist = Map<String, double>();
  int total = getTotalInt(word_freq);
  word_freq.forEach((key, value) {
    prob_dist[key] = value / total;
  });
  return prob_dist;
}

List<Node> generateNodeFromMap(Map<String, double> pd) {
  List<Node> huff_nodes = new List<Node>();
  pd.forEach((key, value) {
    huff_nodes.add(Node(char: key, prob: value));
  });
  return huff_nodes;
}
List<Node> sort_node(List<Node> nodes) {
  nodes.sort((a, b) => a.prob > b.prob ? 1 : -1);
  return nodes;
}

Map<String, double> d_sort_map(map, {reverse = false}) {
  if (reverse) {
    return SplayTreeMap<String, double>.from(
        map, (a, b) => map[a] > map[b] ? -1 : 1);
  }

  return SplayTreeMap<String, double>.from(
      map, (a, b) => map[a] > map[b] ? 1 : -1);
}

Map<String, int> i_sort_map(map, {reverse = false}) {
  if (reverse) {
    return SplayTreeMap<String, int>.from(
        map, (a, b) => map[a] > map[b] ? -1 : 1);
  }

  return SplayTreeMap<String, int>.from(
      map, (a, b) => map[a] > map[b] ? 1 : -1);
}

void printLevelOrderTraversal(Node root) {
  if (root == null) return;

  List<Node> queue = new List<Node>();

  queue.add(root);

  while (!queue.isEmpty) {
    Node node = queue.removeAt(0);
    print("${node.char}: ${dp(node.prob)}");

    if (node.left != null) {
      queue.add(node.left);
    }

    if (node.right != null) {
      queue.add(node.right);
    }
  }
}
printLeafNode(Node root) {
  if (root == null) return;

  //Leaf Node
  if (root.left == null && root.right == null) {
    print("${root.char}: ${root.prob}");
  }

  if (root.left != null) {
    printLeafNode(root.left);
  }

  if (root.right != null) {
    printLeafNode(root.right);
  }
}