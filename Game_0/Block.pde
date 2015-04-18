abstract class Block
{
  PVector position;
  String type;
  PImage sprite;
  
  Block(PVector position, String type)
  {
    this.position = position;
    this.type = "Block.Null";
  }
  
  void update()
  {
  }
  
  void draw()
  {
    if (sprite != null) image(sprite, position.x, position.y);
  }
}
