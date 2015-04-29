class Block
{
  PVector position;
  String type;
  PImage sprite;
  int id;
  
  Block(PVector position, int id)
  {
    this.position = position;
    this.id = id;
    type = "Block." + id;
    sprite = spriteManager.getSprite("Block." + id);
  }
  
  void update()
  {
  }
  
  void draw()
  {
    if (sprite != null)
    {
      image(sprite, position.x, position.y);
    }
  }
}
