import lime.utils.Assets;
import flixel.FlxState;

using haxe.io.Path;

class FileSelect extends FlxState
{
	var files = [];

	override function create()
	{
		super.create();

		for (file in Assets.list(TEXT))
		{
			if (file.extension() != 'json')
				continue;

			if (file.withoutDirectory().withoutExtension() != 'meta')
				continue;

			if (file.split('/').length != 3)
				continue;

			trace(file);
		}
	}
}
