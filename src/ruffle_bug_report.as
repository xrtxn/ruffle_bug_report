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
			fillsmc = new AreasMC_HU();
			bordersmc = new AreasMC_HU();
			intbordersmc = new AreasMC_HU();
			fillsmc.addEventListener(Event.ADDED_TO_STAGE, fillsCenter);
			bordersmc.addEventListener(Event.ADDED_TO_STAGE, bordersCenter);
			intbordersmc.addEventListener(Event.ADDED_TO_STAGE, intbordersCenter);
			addChild(fillsmc);
			addChild(bordersmc);
			addChild(intbordersmc);

			var effectsmc:libmc_AreaEffects = new libmc_AreaEffects();

			// FILL
			trace(effectsmc.FILL2.transform.colorTransform);
			fillsmc.transform.colorTransform = new ColorTransform(0, 0.8515625, 0, 1, 0, 0, 0, 0);
			fillsmc.filters = fillsmc.filters.concat(effectsmc.FILL2.filters);

			// BORDER
			trace(effectsmc.BORDER2.transform.colorTransform);
			bordersmc.transform.colorTransform = new ColorTransform(0, 0.8984375, 0, 1, 0, 0, 0, 0);
			bordersmc.filters = bordersmc.filters.concat(effectsmc.BORDER2.filters);

			// INTBORDER
			trace(effectsmc.INTBORDER2.transform.colorTransform);
			intbordersmc.transform.colorTransform = new ColorTransform(0, 0.75, 0, 1, 0, 0, 0, 0);
			intbordersmc.filters = intbordersmc.filters.concat(effectsmc.INTBORDER2.filters);

		}

		private function fillsCenter(e:Event):void
		{
			trace("centerClip");
			fillsmc.removeEventListener(Event.ADDED_TO_STAGE, fillsCenter);

			fillsmc.x = stage.stageWidth / 2;
			fillsmc.y = stage.stageHeight / 2;

			fillsmc.scaleX = fillsmc.scaleX / 3;
			fillsmc.scaleY = fillsmc.scaleY / 3;
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

		private function intbordersCenter(e:Event):void
		{
			trace("centerClip");
			intbordersmc.removeEventListener(Event.ADDED_TO_STAGE, intbordersCenter);

			intbordersmc.x = stage.stageWidth / 2;
			intbordersmc.y = stage.stageHeight / 2;

			intbordersmc.scaleX = intbordersmc.scaleX / 3;
			intbordersmc.scaleY = intbordersmc.scaleY / 3;
		}
	}
}
