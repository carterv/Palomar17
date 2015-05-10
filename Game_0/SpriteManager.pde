class SpriteManager
{
  HashMap<String, PImage> sprites;

  SpriteManager()
  {
    sprites = new HashMap<String, PImage>();

    sprites.put("Block.1", loadImage("/Sprites/BlockDirt.png"));
    sprites.put("Inventory", loadImage("/Sprites/Inventory2.png"));
    sprites.put("InventoryTab0", loadImage("/Sprites/Tab0.png"));
    sprites.put("InventoryTab1", loadImage("/Sprites/Tab1.png"));
    sprites.put("InventoryTab2", loadImage("/Sprites/Tab2.png"));
    sprites.put("InventoryTab3", loadImage("/Sprites/Tab3.png"));
    sprites.put("SelectedItem", loadImage("/Sprites/SelectedItem.png"));
    sprites.put("SelectedEquipment", loadImage("/Sprites/SelectedEquipment.png"));
    sprites.put("EquipmentSlot", loadImage("/Sprites/EquipmentSlot.png"));
    sprites.put("EquipmentSlotBoots", loadImage("/Sprites/EquipmentSlotBoots.png"));
    sprites.put("EquipmentSlotChest", loadImage("/Sprites/EquipmentSlotChest.png"));
    sprites.put("EquipmentSlotPants", loadImage("/Sprites/EquipmentSlotPants.png"));
    sprites.put("EquipmentSlotHelmet", loadImage("/Sprites/EquipmentSlotHelmet.png"));
    sprites.put("EquipmentSlotWeapon", loadImage("/Sprites/EquipmentSlotWeapon.png"));
    sprites.put("Entity.Player", loadImage("/Sprites/charactertemplate2.png"));
    sprites.put("Entity.Player.Right", loadImage("/Sprites/PlayerRight.png"));
    sprites.put("Entity.Player.Left", loadImage("/Sprites/PlayerLeft.png"));
    sprites.put("Enemy.Blob", loadImage("/Sprites/EnemyBlob.png"));
    sprites.put("Projectile.Melee", loadImage("/Sprites/ProjectileSword.png"));
    sprites.put("Projectile.Staff.Flame", loadImage("/Sprites/ProjectileStaffFlame.png"));
    sprites.put("Projectile.Ranged", loadImage("/Sprites/ProjectileBow.png"));
    sprites.put("Item.Weapon.Melee", loadImage("/Sprites/ItemMelee.png"));
    sprites.put("Item.Weapon.Ranged", loadImage("Sprites/ItemRanged.png"));
    sprites.put("Item.Weapon.Staff.Flame", loadImage("Sprites/ItemStaffFlame.png"));
    sprites.put("Item.Consumable.Potion", loadImage("/Sprites/ItemPotion.png"));
    sprites.put("1", loadImage("/Sprites/DamageOne.png"));
    sprites.put("2", loadImage("/Sprites/DamageTwo.png"));
    sprites.put("3", loadImage("/Sprites/DamageThree.png"));
    sprites.put("4", loadImage("/Sprites/DamageFour.png"));
    sprites.put("5", loadImage("/Sprites/DamageFive.png"));
    sprites.put("6", loadImage("/Sprites/DamageSix.png"));
    sprites.put("7", loadImage("/Sprites/DamageSeven.png"));
    sprites.put("8", loadImage("/Sprites/DamageEight.png"));
    sprites.put("9", loadImage("/Sprites/DamageNine.png"));
    sprites.put("0", loadImage("/Sprites/DamageZero.png"));
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

