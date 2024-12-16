package;

import flixel.FlxG;

class CoolUtil
{
	inline public static function boundTo(value:Float, min:Float, max:Float):Float
	{
		return Math.max(min, Math.min(max, value));
	}

	public static function browserLoad(site:String)
	{
		FlxG.openURL(site);
	}
}
