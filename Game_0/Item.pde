abstract class Item{
  
  private String modType;
  private float modValue;
  private float modDuration;
  private String type;
  
  Item(String modType, float modValue, float modDuration, String type)
  {
    this.modType=modType;
    this.modValue=modValue;
    this.modDuration=modDuration;
    this.type="Item.Null";
  }
  
  void draw()
  {
    
  }
  
  String getModType()
  {
    return this.modType;
  }
  
  void setModType(String modType)
  {
    this.modType=modType;
  }
  
  float getModValue()
  {
    return this.modValue;
  }
  
  void setModValue(float modValue)
  {
    this.modValue=modValue;
  }
  
  float getModDuration()
  {
    return this.modDuration;
  }
  
  void setModDuration()
  {
    this.modDuration=modDuration;
  }
  
  String getType()
  {
    return this.type;
  }
}
