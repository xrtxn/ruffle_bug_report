package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.filters.GlowFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GradientGlowFilter;

	public class ruffle_bug_report extends MovieClip
	{
		private var fillsmc:MovieClip;
		private var bordersmc:MovieClip;
		private var intbordersmc:MovieClip;
		public function ruffle_bug_report()
		{
			super();
			init();
		}

		private function init():void
		{
			bordersmc = new AreasMC_HU();
			bordersmc.addEventListener(Event.ADDED_TO_STAGE, bordersCenter);
			addChild(bordersmc);

			var effectsmc:libmc_AreaEffects = new libmc_AreaEffects();

			// Better visualization, but example works without it
			bordersmc.transform.colorTransform = new ColorTransform(0, 0.8984375, 0, 1, 0, 0, 0, 0);
			// Bad strength calculation
			bordersmc.filters = bordersmc.filters.concat(new GlowFilter(
						0xB3B3B3, // RGB(179,179,179)
						0.3, // Alpha ≈76/255 (0.298 rounded to 0.3)
						8, // blurX
						8, // blurY
						3, // strength // higher strength makes it more noticable
						2, // quality/passes
						true, // inner glow
						true // knockout
					)
				);
		}

		private function bordersCenter(e:Event):void
		{
			trace("centerClip");
			bordersmc.removeEventListener(Event.ADDED_TO_STAGE, bordersCenter);

			bordersmc.x = stage.stageWidth / 2;
			bordersmc.y = stage.stageHeight / 2;

			bordersmc.scaleX = bordersmc.scaleX / 3;
			bordersmc.scaleY = bordersmc.scaleY / 3;
		}
	}
}
