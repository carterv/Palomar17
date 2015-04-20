class SpriteManager
{
  HashMap<String, PImage> sprites;
  
  PImage blockDirtSprite;
  PImage itemWeapon;
  
  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();
    
    sprites.put("Block.Dirt", blockDirtSprite.get());
    sprites.put("Item.Weapon", itemWeapon.get());
  }
  
  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/Block_Dirt.png");
    itemWeapon = loadImage("/Sprites/ItemWeapon.png");
  }
  
  PImage getSprite(String type)
  {
    PImage temp = sprites.get(type);
    //temp.resize(0, size);
    return sprites.get(type);
  }
  
  PImage getSprite(String type, int size)
  {
    PImage temp = sprites.get(type);
    temp.resize(0, size);
    return sprites.get(type);
  }
}
