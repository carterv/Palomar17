class SpriteManager
{
  HashMap<String, PImage> sprites;

  SpriteManager()
  {
    sprites = new HashMap<String, PImage>();

    sprites.put("Block.1", loadImage("/Sprites/BlockDirt.png"));
    sprites.put("Entity.Player.Right", loadImage("/Sprites/PlayerRight.png"));
    sprites.put("Entity.Player.Left", loadImage("/Sprites/PlayerLeft.png"));
    sprites.put("Item.Weapon.Melee", loadImage("/Sprites/ItemMelee.png"));
    sprites.put("Item.Weapon.Ranged", loadImage("Sprites/ItemRanged.png"));
    sprites.put("Item.Consumable.Potion", loadImage("/Sprites/ItemPotion.png"));
    sprites.put("Inventory", loadImage("/Sprites/Inventory2.png"));
    sprites.put("InventoryTab0", loadImage("/Sprites/Tab0.png"));
    sprites.put("InventoryTab1", loadImage("/Sprites/Tab1.png"));
    sprites.put("InventoryTab2", loadImage("/Sprites/Tab2.png"));
    sprites.put("InventoryTab3", loadImage("/Sprites/Tab3.png"));
    sprites.put("SelectedItem", loadImage("/Sprites/SelectedItem.png"));
    sprites.put("SelectedEquipment", loadImage("/Sprites/SelectedEquipment.png"));
    sprites.put("Entity.Player", loadImage("/Sprites/charactertemplate2.png"));
    sprites.put("EquipmentSlot", loadImage("/Sprites/EquipmentSlot.png"));
    sprites.put("Projectile.Melee", loadImage("/Sprites/ProjectileSword.png"));
    sprites.put("Enemy.Blob", loadImage("/Sprites/EnemyBlob.png"));
    sprites.put("Projectile.Ranged", loadImage("/Sprites/ProjectileBow.png"));
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

