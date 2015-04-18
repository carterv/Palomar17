int blockSize;
SpriteManager spriteManager;
ArrayList<Entity> entities;

void setup()
{
  size(1000,600);
  background(0);
  
  blockSize = 10;
  
  spriteManager = new SpriteManager();
  entities = new ArrayList<Entity>();
  
  //for now
  entities.add(new EntityPlayer(new PVector(width/2, height/2)));
}

void draw()
{
  for (Entity e : entities)
  {
    e.draw();
    e.update();
    
    //add entity removal code here
  }
}
