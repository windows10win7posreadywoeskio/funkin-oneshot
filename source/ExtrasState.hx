package;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.effects.FlxFlicker;
import flixel.tweens.FlxTween;
import flixel.addons.ui.FlxInputText;

#if desktop
import Discord.DiscordClient;
#end
/**
 * thanks blantados for the extras code lol!!!11!!
 * i just wanted to give credit because you know the drill
 */
using StringTools;

class ExtrasState extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	var curDifficulty:Int = 2;

	var scoreText:FlxText;
	var enterText:FlxText;
	var diffText:FlxText;
	var comboText:FlxText;
	var passwordText:FlxInputText;

	var extras:FlxSprite;
	var blackScreen:FlxSprite;

	var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));

    public var curCol:FlxColor = 0x00FF00;

    var wrongPass:Bool = false;

    override function create()
    {
        bg.scrollFactor.x = 0;
		bg.color = FlxColor.GRAY;
		add(bg);



        FlxG.mouse.visible = true;

        blackScreen = new FlxSprite(-100, -100).makeGraphic(Std.int(FlxG.width * 0.5), Std.int(FlxG.height * 0.5), FlxColor.BLACK);
		blackScreen.screenCenter();
		blackScreen.scrollFactor.set();
		blackScreen.visible = true;
		add(blackScreen);

		enterText = new FlxText(0, 0, 0, "Enter password.", 48);
		enterText.setFormat('Pixel Arial 11 Bold', 48, FlxColor.WHITE, CENTER);
		enterText.screenCenter();
		enterText.y -= 100;
		enterText.visible = true;
		add(enterText);

		passwordText = new FlxInputText(0, 300, 550, '', 36, FlxColor.WHITE, FlxColor.BLACK);
		passwordText.fieldBorderColor = FlxColor.WHITE;
		passwordText.fieldBorderThickness = 3;
		passwordText.maxLength = 2000;
		passwordText.screenCenter(X);
		passwordText.y += 75;
		passwordText.visible = true;
		add(passwordText);

        Conductor.changeBPM(128.0);
		FlxG.sound.playMusic(Paths.music('offsetSong'), 1, true);

        super.create();
    }

    function startSong(songName:String):Void
        {
            FlxG.sound.music.stop();
            FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX', 'shared'));
    
            var songFormat = StringTools.replace(songName, " ", "-");
            switch (songFormat) {
                case 'Dad-Battle': songFormat = 'Dadbattle';
                case 'Philly-Nice': songFormat = 'Philly';
                case 'Scary-Swings': songFormat = 'Scary Swings';
            }
    
            var poop:String = Highscore.formatSong(songFormat, curDifficulty);
    
            PlayState.SONG = Song.loadFromJson(poop, songName);
            PlayState.isStoryMode = false;
            PlayState.storyDifficulty = curDifficulty;
            PlayState.storyWeek = 1;
            trace('CUR WEEK: EXTRA WEEK');
            LoadingState.loadAndSwitchState(new PlayState());
        }
    
    override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.sound.music.volume < 0.7)
        {
            FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
        }
    
        curCol = bg.color;

        if (FlxG.keys.pressed.ESCAPE)
            {
                //unloadAssets();
                FlxG.switchState(new MainMenuState());
            }


        if (passwordText.text != "" && FlxG.keys.justPressed.ENTER)
            {	
                switch (passwordText.text)
                {
                    case 'i love oneshot niko rule34':
                        trace('UR SCREWED');
                        trace('GOOD LUCK LMFAO');
                        ClientPrefs.unlockedOpposition = true; 
                        startSong('opposition');
                    case 'you got the wrong server pal':
                        CoolUtil.browserLoad('https://discord.gg/znXnsNGjHx');
                    case 'tutorialbopeebofreshdadbattlespookeezsouthmonsterpicophillyblammedsatinpantieshighmilfcocoaeggnogwinterhorrorlandsenpairosesthorns':
                        CoolUtil.browserLoad('https://discord.gg/x5sMXwv8q7');
                    case 'bandu and huggy gets into argument':
                        startSong('Piracy');
                    default: 
                        wrongPass = true;
                 }	
            }

        if (wrongPass == true)
            {
                FlxG.sound.play(Paths.soundRandom('missnote', 1, 3, 'shared'));
                passwordText.text = '';
                wrongPass = false;
                trace('Wrong password, bozo!');
            }
    }
}