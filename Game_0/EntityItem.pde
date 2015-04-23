class EntityItem extends Entity
{
  Item item;

  EntityItem(PVector position, String type)
  {
    super(position);
    this.type="Entity.Item."+type;
    this.hitbox = new PVector(blockSize, blockSize);
    this.sprite = spriteManager.getSprite(this.type);
    item = new Item("Null", 0, -1, type);
  }

  void update()
  {
    super.update();
    if ((this.position.x<=getPlayer().getPosition().x+getPlayer().getHitbox().x && this.position.x>=getPlayer().getPosition().x) ||
      (this.position.x+this.hitbox.x<=getPlayer().getPosition().x+getPlayer().getHitbox().x && this.position.x+this.hitbox.x>=getPlayer().getPosition().x))
    {
      if ((this.position.y<=getPlayer().getPosition().y+getPlayer().getHitbox().y && this.position.y>=getPlayer().getPosition().y) ||
        (this.position.y+this.hitbox.y<=getPlayer().getPosition().y+getPlayer().getHitbox().y && this.position.y+this.hitbox.y>=getPlayer().getPosition().y))
      {
        if (getPlayer().emptyInventorySlot()!=-1)
        {
          getPlayer().addItem(getPlayer().emptyInventorySlot(),item);
          alive=false;
        }
      }
    }
  }


  void draw()
  {
    super.draw();
    /*if(this.getType().equals("Entity.Item.Weapon"))
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
     }*/
  }
}

