package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		// test string
		trace('Hello world');
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
