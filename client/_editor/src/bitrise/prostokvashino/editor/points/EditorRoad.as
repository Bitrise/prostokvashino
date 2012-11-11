package bitrise.prostokvashino.editor.points
{
	import bitrise.prostokvashino.base.points.RoadBase;
	
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.JointStyle;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	
	import spark.primitives.Line;

	public class EditorRoad extends RoadBase
	{
		private var sprite:EditorSprite;
		
		public var select:Boolean = false;
		
		override public function redraw():void {
			if (sprite) {
				const g:Graphics = sprite.graphics;
				g.clear();
				var first:Boolean = true;
				
				if (select) {
					g.lineStyle(4, 0xFF0000, 1, true, LineScaleMode.NORMAL, null, JointStyle.BEVEL);
				} else {
					g.lineStyle(2, 0xFFFF00, 0.5, true, LineScaleMode.NORMAL, null, JointStyle.BEVEL);
				}
				
				for each(var point:EditorPoint in vector) {
					if (first) {
						first = false;
						g.moveTo(point.x, point.y);
					} else {
						g.lineTo(point.x, point.y);
					}
				}
				g.lineStyle(0, 0, 0);
				for each(point in vector) {
					if (select) {
						if (point.select) {
							g.beginFill(0xFF0000, 1);
							g.drawCircle(point.x, point.y, 5);
						} else {
							g.beginFill(0xFF0000, 1);
							g.drawCircle(point.x, point.y, 3)
						}
					} else {
						g.beginFill(0xFFFF00, 1);
						g.drawCircle(point.x, point.y, 3);
					}
					
					g.endFill();
				}
			}
		}
		
		override public function draw(display:Sprite):void {
			clear(display);
			if (!sprite) {
				sprite = new EditorSprite();
				sprite.road = this;
				display.addChild(sprite);
			}
			redraw();
		}
		
		override public function clear(display:Sprite):void {
			if (sprite) {
				display.removeChild(sprite);
				sprite = null;
			}
		}
		
	}
}