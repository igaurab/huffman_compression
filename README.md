## Huffman Compression

This is an implementation of Huffman Compression Algorithm. 

**Usage:**

You will need to install [dart](https://dart.dev/) to run the program

`dart main.dart -m "Hello World!"`
`dart main.dart -m 'He said: "Hello World!"'`


**Hacking**

The `src/utils.dart` contains function `printLevelOrderTraversal` for Level Order Traversal of Huffman Tree and `printLeafNode` to print the leaf nodes of the Huffman Tree from Left to Right along with their probability distribution.

`char_frequency` : generates the frequency of the characters

`prob_dist` : calculates the probability distribution based on the `char_frequency`

If you want to provide these values directly, you can also manually make changes to the `manual.dart` accordingly.

### Example

![example](image/example.png)

**TODO**

[ ] Option to read files
[ ] Visualize the Huffman Tree in the console.