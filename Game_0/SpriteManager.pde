class SpriteManager
{
  HashMap<String, PImage> sprites;

  PImage blockDirtSprite;
  PImage itemMelee;
  PImage itemRanged;
  PImage inventory;
  PImage entityPlayer;

  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();

    sprites.put("Block.Dirt", blockDirtSprite.get());
    sprites.put("Entity.Item.Melee", itemMelee.get());
    sprites.put("Item.Melee", itemMelee.get());
    sprites.put("Entity.Item.Ranged", itemRanged.get());
    sprites.put("Item.Ranged", itemRanged.get());
    sprites.put("Inventory", inventory.get());
    sprites.put("Entity.Player", entityPlayer.get());
  }

  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/Block_Dirt.png");
    itemMelee = loadImage("/Sprites/ItemMelee.png");
    itemRanged = loadImage("Sprites/ItemRanged.png");
    inventory = loadImage("/Sprites/Inventory.png");
    entityPlayer = loadImage("/Sprites/charactertemplate2.png");
  }

  PImage getSprite(String type)
  {
    PImage temp = sprites.get(type);
    return sprites.get(type);
  }

  PImage getSprite(String type, int size)
  {
    PImage temp = sprites.get(type);
    temp.resize(0, size);
    return sprites.get(type);
  }
}

