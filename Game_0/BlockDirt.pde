class BlockDirt extends Block
{
  public BlockDirt(PVector position)
  {
    super(position);
    
    type = "block.dirt"
    sprite = spriteManager.getSprite(type);
  }
}
