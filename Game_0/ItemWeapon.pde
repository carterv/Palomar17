class ItemWeapon extends Item
{
  ItemWeapon(String modType, float modValue, float modDuration, String type)
  {
    super(modType, modValue, modDuration);
    this.type="Item."+type;
  }
  
  void draw()
  {
    //image();
  }
}
