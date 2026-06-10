import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.group.FlxGroup.FlxTypedGroup;
import haxe.Json;
import lime.utils.Assets;
import flixel.FlxState;

using haxe.io.Path;

class FileSelect extends FlxState
{
	var files:Array<Entry> = [];

	var textGroup:FlxTypedGroup<FlxText>;
	var selectextFile:Int = 0;

	override function create()
	{
		super.create();

		getFiles();

		textGroup = new FlxTypedGroup<FlxText>();
		add(textGroup);

		for (i => file in files)
		{
			var newText:FlxText = new FlxText(0, 0, 0, file.name, 16);
			newText.ID = i;
			textGroup.add(newText);
		}
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		for (text in textGroup)
		{
			text.y = text.ID * (text.size * 2);

			text.color = FlxColor.WHITE;
			if (selectextFile == text.ID) text.color = FlxColor.YELLOW;
		}
	}

	function getFiles()
	{
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
