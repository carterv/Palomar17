class SpriteManager
{
  HashMap<String, PImage> sprites;

  PImage blockDirtSprite;
  PImage itemWeapon;
  PImage entityPlayerRight;
  PImage entityPlayerLeft;
  PImage itemMelee;
  PImage itemRanged;
  PImage inventory;
  PImage selectedItem;
  PImage entityPlayer;

  SpriteManager()
  {
    this.loadSprites();
    sprites = new HashMap<String, PImage>();

    sprites.put("Block.1", blockDirtSprite.get());
    sprites.put("Item.Weapon", itemWeapon.get());
    sprites.put("Entity.Player.Right", entityPlayerRight.get());
    sprites.put("Entity.Player.Left", entityPlayerLeft.get());
    sprites.put("Entity.Item.Melee", itemMelee.get());
    sprites.put("Item.Melee", itemMelee.get());
    sprites.put("Entity.Item.Ranged", itemRanged.get());
    sprites.put("Item.Ranged", itemRanged.get());
    sprites.put("Inventory", inventory.get());
    sprites.put("SelectedItem", selectedItem.get());
    sprites.put("Entity.Player", entityPlayer.get());
  }

  void loadSprites()
  {
    blockDirtSprite = loadImage("/Sprites/BlockDirt.png");
    itemWeapon = loadImage("/Sprites/ItemWeapon.png");
    entityPlayerRight = loadImage("/Sprites/PlayerRight.png");
    entityPlayerLeft = loadImage("/Sprites/PlayerLeft.png");
    itemMelee = loadImage("/Sprites/ItemMelee.png");
    itemRanged = loadImage("Sprites/ItemRanged.png");
    inventory = loadImage("/Sprites/Inventory.png");
    selectedItem = loadImage("/Sprites/SelectedItem.png");
    entityPlayer = loadImage("/Sprites/charactertemplate2.png");
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

