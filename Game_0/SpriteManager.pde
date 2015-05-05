class SpriteManager
{
  HashMap<String, PImage> sprites;

  SpriteManager()
  {
    sprites = new HashMap<String, PImage>();

    sprites.put("Block.1", loadImage("/Sprites/BlockDirt.png"));
    sprites.put("Item.Weapon", loadImage("/Sprites/ItemWeapon.png"));
    sprites.put("Entity.Player.Right", loadImage("/Sprites/PlayerRight.png"));
    sprites.put("Entity.Player.Left", loadImage("/Sprites/PlayerLeft.png"));
    sprites.put("Entity.Item.Melee", loadImage("/Sprites/ItemMelee.png"));
    sprites.put("Item.Melee", loadImage("/Sprites/ItemMelee.png"));
    sprites.put("Entity.Item.Ranged", loadImage("Sprites/ItemRanged.png"));
    sprites.put("Item.Ranged", loadImage("Sprites/ItemRanged.png"));
    sprites.put("Inventory", loadImage("/Sprites/Inventory.png"));
    sprites.put("SelectedItem", loadImage("/Sprites/SelectedItem.png"));
    sprites.put("Entity.Player", loadImage("/Sprites/charactertemplate2.png"));
    sprites.put("Projectile.Sword", loadImage("/Sprites/ProjectileSword.png"));
    sprites.put("Enemy.Blob", loadImage("/Sprites/EnemyBlob.png"));
  }
  
  PImage getSprite(String type)
  {
    return sprites.get(type).get();
  }

  PImage getSprite(String type, int size)
  {
    PImage temp = sprites.get(type).get();
    temp.resize(0, size);
    return temp;
  }
}

