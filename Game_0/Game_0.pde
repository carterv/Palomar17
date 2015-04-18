int blockSize;
SpriteManager spriteManager;
ArrayList<Entity> entities;
Block[][] blocks;

void setup()
{
  size(1000,600);
  background(0);
  
  blockSize = 20;
  
  spriteManager = new SpriteManager();
  entities = new ArrayList<Entity>();
  blocks = new Block[(width/blockSize)+1][height/blockSize];
  
  //for now
  entities.add(new EntityPlayer(new PVector(width/2, height/2)));
  fillBlocks();
}

void draw()
{
  background(0);
  for (Entity e : entities)
  {
    e.draw();
    e.update();
    
    //add entity removal code here
  }
  renderBlocks();
}


//for now
void fillBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      if (j > 25)
      {
        blocks[i][j] = new BlockDirt(new PVector((i-1)*blockSize, j*blockSize));
        blocks[i][j].draw();
      }
    }
  }
}

void renderBlocks()
{
  for (int i = 0; i < blocks.length; i++)
  {
    for (int j = 0; j < blocks[i].length; j++)
    {
      if(blocks[i][j] != null)
      {
        blocks[i][j].draw();
      }
    }
  }
}

