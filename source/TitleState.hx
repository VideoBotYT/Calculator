package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxUINumericStepper;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	var bg:FlxSprite;
	var playButton:FlxButton;

	override function create()
	{
		bg = new FlxSprite(0, 0).loadGraphic(Paths.image("VideoBot"));
		bg.scale.set(0.25, 0.25);
		bg.screenCenter();
		add(bg);

		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(Paths.music("calculator-note"), 1);
		}

		playButton = new FlxButton(0, FlxG.height / 2 + 200, "PLAY", function()
		{
			FlxG.sound.play(Paths.sound("button"), 0.5);
			new FlxTimer().start(1.4, function(tmr:FlxTimer)
			{
				FlxG.switchState(new PlayState());
			});
		});
		playButton.screenCenter(X);
		add(playButton);

		super.create();
	}
}
