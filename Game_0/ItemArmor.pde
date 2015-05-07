class ItemArmor extends Item
{
  private String modType;
  private double modVal;
  private String modElem;
  private double modElemVal;
  d
  public ItemArmor(PVector position, String type, String modType, double modVal)
  {
    super(position,type);
    this.modType=modType;
    this.modVal=modVal;
    modElem="null";
  }
  
  public ItemArmor(PVector position, String type, String modType, double modVal, String modElem, double modElemVal)
  {
    super(position,type);
    this.modType=modType;
    this.modVal=modVal;
    this.modElem=modElem;
    this.modElemVal=modElemVal;
  }
  
  public String getModType()
  {
    return modType;
  }
  
  public double getModVal()
  {
    return modVal;
  }
  
  public void setModVal(double modVal)
  {
    this.modVal=modVal;
  }
  
  public String getModElem()
  {
    return modElem;
  }
  
  public void setModElem(String modElem)
  {
    this.modElem=modElem;
  }
  
  public double getModElemVal()
  {
    return modElemVal;
  }
  
  public void setModElemVal(double modElemVal)
  {
    this.modElemVal=modElemVal;
  }
}
