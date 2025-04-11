package options;

using StringTools;

class Options extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Calculator Options';
		rpcTitle = 'Calculator Options';

		var option:Option = new Option("Mute Sound", "When enabled the sound shall be muted.", "muteSound", "bool", false);
		addOption(option);

		var option:Option = new Option("Enable Background", "When enabled it shows the background in the calculator", "bg", 'bool', true);
		addOption(option);

		super();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.ESCAPE)
		{
			FlxG.sound.play(Paths.sound('button'));
		}
	}
}
