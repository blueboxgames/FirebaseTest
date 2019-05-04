package
{
  import feathers.controls.Drawers;
  import feathers.core.IFeathersControl;
  import feathers.themes.MetalWorksMobileTheme;
  import feathers.controls.StackScreenNavigator;
  import feathers.controls.StackScreenNavigatorItem;
  import starling.events.Event;
  
  import views.Register;

  public class Main extends Drawers
  {
    /**
     * @private
     */
    private var navigator:StackScreenNavigator;

    public function Main(content:IFeathersControl=null)
    {
      new MetalWorksMobileTheme();
      super(content);
    }

    override protected function initialize():void
    {
      super.initialize();

      this.navigator = new StackScreenNavigator();
      this.content = this.navigator;
      this.addView(Register.NAME, Register);
    }

    private function addView(screenType:String, screenClass:Object, pushTranstion:Function = null, popTranstion:Function = null):void
    {
      var item:StackScreenNavigatorItem = new StackScreenNavigatorItem(screenClass);
      if( pushTranstion != null )
        item.pushTransition = pushTranstion;
      if( popTranstion != null )
        item.popTransition = popTranstion;
      item.addPopEvent(Event.COMPLETE);
      item.setScreenIDForPushEvent(Register.NAME, Register.NAME);
      this.navigator.addScreen(screenType, item);
      this.navigator.rootScreenID = Register.NAME;
    }
  }
}