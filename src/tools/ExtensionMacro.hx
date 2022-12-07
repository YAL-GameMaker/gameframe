package tools;

import haxe.macro.Expr;
import sf.gml.SfYyExtension;
import sf.gml.SfYyJsonParser;
import sys.io.File;

/**
 * ...
 * @author YellowAfterlife
 */
class ExtensionMacro {
	public static macro function build(path:String, ?unprefix:String):Array<Field> {
		var text = File.getContent(path);
		var ext:SfYyExtension = SfYyJsonParser.parse(text, true);
		var fields:Array<Field> = [];
		for (file in ext.files) {
			for (func in file.functions) {
				var funcName = func.name;
				var realName = func.name;
				if (unprefix != null && StringTools.startsWith(funcName, unprefix)) {
					funcName = funcName.substr(unprefix.length);
				}
				var field:Field;
				if (func.argCount < 0) {
					field = (macro class {
						@:expose($v{realName})
						static function $funcName(args:haxe.Rest<Any>):Any;
					}).fields[0];
				} else {
					field = (macro class {
						@:expose($v{realName})
						static function $funcName():Any;
					}).fields[0];
				}
				field.doc = func.help;
				var fun:Function = switch (field.kind) {
					case FFun(f): f;
					default: continue;
				}
				for (i => arg in func.args) {
					fun.args.push({
						name: "arg" + i,
						type: fun.ret, // just get that Any/whatever
					});
				}
				fields.push(field);
			}
		}
		return fields;
	}
}