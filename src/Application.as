package
{
  import flash.events.Event;
  import flash.geom.Rectangle;
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.display3D.Context3DProfile;
  import flash.display3D.Context3DRenderMode;

  import starling.core.Starling;

  /**
   * Main Application constructor.
   * 
   * @author Fudo Sakurai
   */

  public class Application extends Sprite
  {
    /**
     * @private
     */
    private var GFX:Starling;
    private var defaultFrameRate:Number;

    /**
     * Constructor of the application.
     */
    public function Application()
    {
      this.stage.scaleMode = StageScaleMode.NO_SCALE;
      this.stage.align = StageAlign.TOP_LEFT;

      this.loaderInfo.addEventListener(Event.COMPLETE, loaderInfo_completeHandler);
    }

    private function loaderInfo_completeHandler(event:Event):void
    {
      this.loaderInfo.removeEventListener(Event.COMPLETE, loaderInfo_completeHandler);
      var viewPort:Rectangle = new Rectangle(0,0, stage.fullScreenWidth, stage.fullScreenHeight);

      this.GFX = new Starling(Main, this.stage, viewPort, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE_EXTENDED);
      this.GFX.addEventListener("rootCreated", gfx_rootCreatedHandler);
      this.GFX.supportHighResolutions = true;
      this.GFX.skipUnchangedFrames = true;
      this.GFX.showStats = true;
      this.GFX.showStatsAt("right", "top", 0.5);
      this.GFX.start();
    }

    private function gfx_rootCreatedHandler(event:*):void
    {
      this.stage.addEventListener("deactivate", stage_deactivateHandler, false, 0, true);
    }

    private function stage_deactivateHandler(event:Event):void
    {
      this.GFX.stop(true);
      this.defaultFrameRate = this.defaultFrameRate;
      this.stage.frameRate = 0;
      this.stage.addEventListener("activate", stage_activateHandler, false, 0, true);
    }

    private function stage_activateHandler(event:Event):void
    {
      this.stage.removeEventListener("activate", stage_activateHandler);
      this.stage.frameRate = this.defaultFrameRate;
      this.GFX.start();
    }
  }
}