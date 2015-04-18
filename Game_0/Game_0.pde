int blockSize;
SpriteManager spriteManager;
ArrayList<Entity> entities;
Block[][] blocks;

void setup()
{
  size(1000,600);
  background(0);
  
  blockSize = 10;
  
  spriteManager = new SpriteManager();
  entities = new ArrayList<Entity>();
  blocks = new Block[width/blockSize][height/blockSize];
  
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
  renderBlocks();
}

void renderBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      if (i < 100 && i > 97)
      {
        PVector blockPos = new PVector(i, j);
        BlockDirt newDirt = new BlockDirt(blockPos);
        newDirt.draw();
      }
    }
  }
}
