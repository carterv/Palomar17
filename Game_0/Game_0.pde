int blockSize;
SpriteManager spriteManager;
Block[][] blocks;
ArrayList<Entity> entities;
final float MOVESPEED = 3.5;
int keyDown;

void setup()
{
  size(1000,600);
  background(0);
  
  blockSize = 20;
  
  spriteManager = new SpriteManager();
  EntityPlayer character = new EntityPlayer(new PVector(width/2, 480));
  entities = new ArrayList<Entity>();
  blocks = new Block[(width/blockSize)+1][height/blockSize];
  
  //for now 
  entities.add(character);
  fillBlocks();
}

void draw()
{
  background(255);
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

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    keyDown = 1;
  }
  else if (keyCode == LEFT)
  {
    keyDown = 2;
  }
}

void keyReleased()
{
  if (keyCode == RIGHT || keyCode == LEFT)
  {
    if (keyDown == 1 || keyDown == 2)
    {
      keyDown = 0;
    }
  }
}

