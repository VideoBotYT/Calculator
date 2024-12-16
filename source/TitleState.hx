package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	var bg:FlxSprite;
	var playButton:FlxButton;

	override function create()
	{
		bg = new FlxSprite(0, 0).loadGraphic("assets/images/VideoBot.png");
		bg.scale.set(0.25, 0.25);
		bg.screenCenter();
		add(bg);

		playButton = new FlxButton(0, FlxG.height / 2 + 200, "PLAY", function()
		{
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
