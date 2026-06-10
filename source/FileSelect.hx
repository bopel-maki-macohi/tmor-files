import haxe.Json;
import lime.utils.Assets;
import flixel.FlxState;

using haxe.io.Path;

class FileSelect extends FlxState
{
	var files:Array<Entry> = [];

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

			try
			{
				var entry:Entry = Json.parse(Assets.getText(file));

				if (entry != null)
					files.push(entry);
			}
			catch (e)
			{
				trace(e);
			}
		}
	}
}
