package;

import Discord.DiscordClient;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;
import lime.app.Application;

class TitleState extends FlxState
{
	var bg:FlxSprite;
	var playButton:FlxButton;

	var exitGame:FlxButton;

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

		exitGame = new FlxButton(0, 0, "Exit", function()
		{
			openfl.system.System.exit(0);
		});
		exitGame.scale.x = 0.5;
		add(exitGame);

		if (!DiscordClient.isInitialized)
		{
			DiscordClient.initialize();
			Application.current.onExit.add(function(exitCode)
			{
				DiscordClient.shutdown();
			});
		}

		super.create();
	}
}
