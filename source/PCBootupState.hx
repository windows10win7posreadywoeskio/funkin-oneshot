package;

import lime.utils.Bytes;
import openfl.display.Shader;
import openfl.filters.ShaderFilter;
import flixel.FlxSubState;
import openfl.filters.BitmapFilter;
import openfl.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxExtendedSprite;
import flixel.addons.plugin.FlxMouseControl;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup;
import flixel.input.gamepad.FlxGamepad;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.system.FlxSound;
import flixel.system.ui.FlxSoundTray;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.util.FlxSpriteUtil;
import lime.app.Application;
import openfl.Assets;
import flash.geom.Point;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
import Sys;
import sys.FileSystem;
#end

#if cpp
import sys.thread.Thread;
#end

class PCBootupState extends MusicBeatState
{

    var logoThing:FlxSprite;
    var leBootingText1:FlxText;
    var leBootingText2:FlxText;
    var fuckingSpinThing:FlxSprite; //I like pain
    var finished:Bool = false;
    override function create():Void
    {

        logoThing = new FlxSprite(0, 0);
        add(logoThing);
        new FlxTimer().start(5, function(tmr:FlxTimer)
            {
                if (finished == true)
                    {
                        FlxG.switchState(new PC_os_State());
                    }
                else {
                    FlxG.switchState(new TitleState());
                }
            });
        
        super.create();
    }

    override function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}