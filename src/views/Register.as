package views
{
  import feathers.controls.Screen;
  import feathers.layout.AnchorLayout;
  import feathers.controls.LayoutGroup;
  import feathers.layout.VerticalLayout;
  import feathers.layout.VerticalAlign;
  import feathers.layout.HorizontalAlign;
  import feathers.controls.TextInput;
  import feathers.controls.Button;
  import feathers.layout.AnchorLayoutData;
  import feathers.events.FeathersEventType;
  import starling.events.Event;

  public class Register extends Screen
  {
    static public const NAME:String = "registerView";

    private var usernameInput:TextInput = new TextInput();
    private var passwordInput:TextInput = new TextInput();

    public function Register()
    {
      super();
    }

    override protected function initialize():void
    {
      super.initialize();
      this.layout = new AnchorLayout();
      this.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);
      initalizeForm();
    }

    /**
     * @private
     */
    private function initalizeForm():void
    {
      /**
       * Setting form layout settings.
       */
      var form:LayoutGroup = new LayoutGroup();
      var formLayout:VerticalLayout = new VerticalLayout();
      formLayout.gap = 5;
      formLayout.verticalAlign = VerticalAlign.MIDDLE;
      formLayout.horizontalAlign = HorizontalAlign.CENTER;
      form.layout = formLayout;

      usernameInput.text = "Username";
      usernameInput.addEventListener(FeathersEventType.FOCUS_IN, usernameInput_focusInHandler);
      
      passwordInput.text = "Password";
      passwordInput.addEventListener(FeathersEventType.FOCUS_IN, passwordInput_focusInHandler);
      passwordInput.displayAsPassword = true;
      

      var confirmButton:Button = new Button();
      confirmButton.label = "Register";

      form.addChild(usernameInput);
      form.addChild(passwordInput);
      form.addChild(confirmButton);

      this.addChild(form);
    }

    private function usernameInput_focusInHandler(event:Event):void
    {
      /**
       * Removing intialized input on input in.
       */
      this.usernameInput.removeEventListener(FeathersEventType.FOCUS_IN, usernameInput_focusInHandler);
      this.usernameInput.text = "";
    }

    private function passwordInput_focusInHandler(event:Event):void
    {
      this.passwordInput.removeEventListener(FeathersEventType.FOCUS_IN, passwordInput_focusInHandler);
      this.passwordInput.text = "";
    }
  }
}