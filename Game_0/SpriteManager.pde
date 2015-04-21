class SpriteManager
{
  HashMap<String, PImage> sprites;
  
  PImage blockDirtSprite;
  PImage itemWeapon;
  PImage entityPlayerRight;
  PImage entityPlayerLeft;
  
  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();
    
    sprites.put("Block.Dirt", blockDirtSprite.get());
    sprites.put("Item.Weapon", itemWeapon.get());
    sprites.put("Entity.Player.Right", entityPlayerRight.get());
    sprites.put("Entity.Player.Left", entityPlayerLeft.get());
  }
  
  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/BlockDirt.png");
    itemWeapon = loadImage("/Sprites/ItemWeapon.png");
    entityPlayerRight = loadImage("/Sprites/PlayerRight.png");
    entityPlayerLeft = loadImage("/Sprites/PlayerLeft.png");
  }
  
  PImage getSprite(String type)
  {
    return sprites.get(type);
  }
  
  PImage getSprite(String type, int size)
  {
    PImage temp = sprites.get(type);
    temp.resize(0, size);
    return sprites.get(type);
  }
}
