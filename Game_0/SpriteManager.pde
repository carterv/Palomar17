static class SpriteManager
{
  HashMap<String, PImage> sprites;
  
  SpriteManager()
  {
    sprites = new HashMap<String, PImage>();
    
    sprites.put("block.dirt", blockDirtSprite.get());
  }
  
  PImage getSprite(String type, int drawSize)
  {
    PImage temp = sprites.get(type);
    return temp;
  }
}
