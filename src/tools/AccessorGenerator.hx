package tools;
import haxe.macro.Context;
import haxe.macro.Expr;

/**
 * ...
 * @author 
 */
class AccessorGenerator {
	public static macro function build():Array<Field> {
		var fields:Array<Field> = Context.getBuildFields();
		var newFields = fields.copy();
		for (field in fields) {
			switch (field.kind) {
				case FVar(t, e): // OK
				default: continue;
			}
			var mdoc = field.meta.filter((m) -> m.name == ":doc")[0];
			if (mdoc == null) continue;
			field.meta.remove(mdoc);
			var name = field.name;
			var get = "get_" + name;
			var set = "set_" + name;
			var expr = macro $i{name};
			var c = macro class X {
				@:doc function $set(value) $expr = value;
				@:doc function $get() return $expr;
			};
			var fget = c.fields[0];
			fget.doc = field.doc;
			field.doc = null;
			var fset = c.fields[1];
			newFields.push(fget);
			newFields.push(fset);
			//trace(mdoc);
		}
		return newFields;
	}
}