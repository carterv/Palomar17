abstract class Block
{
  PVector position;
  String type;
  
  Block(PVector position, String type)
  {
    this.position = position;
    this.type = "Block.null";
  }
  
  void draw()
  {
    rect(position.x, position.y, blockSize, blockSize);
  }
}
