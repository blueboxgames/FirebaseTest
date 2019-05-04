package views
{
  import feathers.controls.Screen;
  import feathers.layout.AnchorLayout;

  public class Home extends Screen
  {
    static public const NAME:String = "homeView";
    public function Home()
    {
      super();
    }
    
    override protected function initialize():void
    {
      super.initialize();
      this.layout = new AnchorLayout();
    }
  }
}