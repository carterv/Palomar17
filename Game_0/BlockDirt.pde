class BlockDirt extends Block
{
  BlockDirt(PVector position)
  {
    super(position);
    
    type = "Block.Dirt";
    sprite = spriteManager.getSprite(type);
  }
}
