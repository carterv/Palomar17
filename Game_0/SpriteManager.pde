class SpriteManager
{
  HashMap<String, PImage> sprites;
  
  PImage blockDirtSprite;
  
  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();
    
    sprites.put("block.dirt", blockDirtSprite.get());
  }
  
  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/Block_Dirt.png");
  }
  
  PImage getSprite(String type, int drawSize)
  {
    PImage temp = sprites.get(type);
    return temp;
  }
}
