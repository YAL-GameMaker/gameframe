package ;
import gml.ds.Queue;
import gml.ds.Stack;

/**
 * ...
 * @author 
 */
@:native("gameframe_delayed")
class GfDelay {
	static var queue:Queue<GfDelayItem> = new Queue();
	static var pool:Stack<GfDelayItem> = new Stack();
	public static var frameIndex = 0;
	public static function callImpl(func:Dynamic, delay:Int, arg0:Any, arg1:Any, arg2:Any, arg3:Any) {
		var item:GfDelayItem;
		if (pool.isEmpty()) {
			item = new GfDelayItem();
		} else item = pool.pop();
		item.func = func;
		item.time = frameIndex + delay;
		item.arg0 = arg0;
		item.arg1 = arg1;
		item.arg2 = arg2;
		item.arg3 = arg3;
		queue.enqueue(item);
	}
	public static inline function call0(delay:Int, func:()->Void) {
		callImpl(func, delay, null, null, null, null);
	}
	public static inline function call1<A>(a:A, delay:Int, func:A->Void) {
		callImpl(func, delay, a, null, null, null);
	}
	public static inline function call2<A, B>(a:A, b:B, delay:Int, func:A->B->Void) {
		callImpl(func, delay, a, b, null, null);
	}
	public static inline function call3<A, B, C>(a:A, b:B, c:C, delay:Int, func:A->B->C->Void) {
		callImpl(func, delay, a, b, c, null);
	}
	public static inline function call4<A, B, C, D>(a:A, b:B, c:C, d:D, delay:Int, func:A->B->C->D->Void) {
		callImpl(func, delay, a, b, c, d);
	}
	public static function update() {
		frameIndex += 1;
		var f;
		while (!queue.isEmpty()) {
			var head = queue.head();
			if (head.time > frameIndex) break;
			queue.dequeue();
			f = head.func;
			f(head.arg0, head.arg1, head.arg2, head.arg3);
			head.clear();
			pool.push(head);
		}
	}
}
@:native("gameframe_delayed_item")
class GfDelayItem {
	public var func:Dynamic;
	public var time:Int;
	public var arg0:Any;
	public var arg1:Any;
	public var arg2:Any;
	public var arg3:Any;
	public function new() {
		
	}
	public inline function clear() {
		func = null;
		arg0 = null;
		arg1 = null;
		arg2 = null;
		arg3 = null;
	}
}