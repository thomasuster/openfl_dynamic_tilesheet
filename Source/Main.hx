package;
import flash.display.BitmapData;
import flash.geom.Rectangle;
import flash.events.Event;
import flash.display.Sprite;
import openfl.display.Tilesheet;
class Main extends Sprite {

    var sprite:Sprite;
    var inImage:BitmapData;
    var tileSheet:Tilesheet;
    var greenImage:BitmapData;
    var wait:Int = 1;

    public function new() {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }

    public function onAdded(event:Event):Void {
        removeEventListener(Event.ADDED_TO_STAGE, onAdded);
        sprite = new Sprite();
        addChild(sprite);
        inImage = new BitmapData(1,1, true, 0x00000000);
        tileSheet = new Tilesheet(inImage);
        tileSheet.drawTiles(sprite.graphics, []);
        addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    function onEnterFrame(e:Event):Void {
        if (wait > 0) {
            wait--;
            return;
        }
        inImage.setPixel32(0,0,0xFFFF0000);
        tileSheet.addTileRect(new Rectangle(0, 0, 1, 1));
        tileSheet.drawTiles(sprite.graphics, [0,0,0]);
        removeEventListener(Event.ENTER_FRAME, onEnterFrame);
    }
}