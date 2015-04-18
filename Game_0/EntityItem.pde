class EntityItem extends Entity
{
  
  Item(PVector position, Sting type)
  {
    super(position);
    type="Entity.Item."+type;
  }
  
  void update()
  {
    super.update;
  }
  
  void draw()
  {
    if(type.equals(Entity.Item.Weapon))
    {
      fill(255,0,0);
    }
  }
}

