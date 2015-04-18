class EntityItem extends Entity
{
  
  EntityItem(PVector position, String type)
  {
    super(position);
    this.type="Entity.Item."+type;
    this.hitbox = new PVector(blockSize, blockSize);
  }
  
  void update()
  {
    super.update();
  }
  
  void draw()
  {
    if(this.getType().equals("Entity.Item.Weapon"))
    {
      fill(255,0,0);
      ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
    }
    else if(this.getType().equals("Entity.Item.Armor"))
    {
      fill(0,0,255);
      ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
    }
    else if(this.getType().equals("Entity.Item.Potion"))
    {
      fill(0,255,0);
      ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
    }
    else if(this.getType().equals("Entity.Item.Gold"))
    {
      fill(255,255,0);
      ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
    }
    else
    {
      //error/unkown/misc item
      fill(0,255,255);
      ellipse(this.getPosition().x,this.getPosition().y,blockSize/2,blockSize/2);
    }
  }
}

