class SpriteManager
{
  HashMap<String, PImage> sprites;
  
  PImage blockDirtSprite;
  
  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();
    
    sprites.put("Block.Dirt", blockDirtSprite.get());
  }
  
  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/Block_Dirt.png");
  }
  
  PImage getSprite(String type, int size)
  {
    PImage temp = sprites.get(type);
    temp.resize(0, size);
    return sprites.get(type);
  }
}
