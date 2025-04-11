package;

import flixel.FlxG;

class Data
{
	public var muteSound(default, set):Bool = false;
	public var bg:Bool = true;

	function set_muteSound(value:Bool):Bool
	{
		try
		{
			FlxG.sound.muted = value;
		}
		catch (e:Dynamic) {}
		muteSound = value;

		if (Prefs.isInitialized)
			Prefs.save();

		return value;
	}
    public function new()
    {}
}

class Prefs
{
	public static var data:Data = null;
	public static var defaultData:Data = null;

	public static var isInitialized:Bool = false;

	public static function load():Void
	{
		if (data == null)
			data = new Data();
		if (defaultData == null)
			defaultData = new Data();

		for (key in Reflect.fields(data))
		{
			Reflect.setField(data, key, Reflect.field(FlxG.save.data, key));
		}
		isInitialized = true;
	}

	public static function save():Void
	{
		for (key in Reflect.fields(data))
		{
			Reflect.setField(FlxG.save.data, key, Reflect.field(data, key));
		}

		FlxG.save.flush();
	}

	public static function initialize():Void
	{
		FlxG.save.bind('Calculator', 'Video_Bot');
		load();
	}
}
