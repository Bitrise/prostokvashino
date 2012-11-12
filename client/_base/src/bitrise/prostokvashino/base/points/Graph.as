package bitrise.prostokvashino.base.points
{
	import bitrise.core.utils.GeomUtils;
	
	import flash.utils.Dictionary;
	
	import spark.primitives.Path;

	public class Graph
	{
		
		public var nodes:Vector.<Node>;
		public var named:Object;
		private var mem:Object;
		
		public function Graph(map:Map) {
			named = new Object();
			nodes = new Vector.<Node>();
			mem = new Object();
			
			const points:Vector.<PointBase> = new Vector.<PointBase>();
			for each(var road:RoadBase in map.vector) {
				if (road.vector.length > 1) {
					add(road.vector[0], road.vector[1]);
					for(var i:uint = 1; i < road.vector.length - 1; i++) {
						add(road.vector[i], road.vector[i-1], road.vector[i+1]);
					}
					add(road.vector[road.vector.length - 1], road.vector[road.vector.length - 2]);
				}
			}
		}
		
		private function add(point:PointBase, ...rest):void {
			const vector:Vector.<PointBase> = Vector.<PointBase>(rest);
			const main:Node = getNode(point.x, point.y) as Node;
			if (point.name) {
				if (main.name) {
					delete named[main.name];
				}
				main.name = point.name;
				named[main.name] = main;
			}
			for each(point in vector) {
				const child:Node = getNode(point.x, point.y) as Node;
				if (child != main) {
					var contains:Boolean = false;
					for each(var weight:Weight in main.environment) {
						if (weight.node == child) {
							contains = true;
							break;
						}
					}
					if (!contains) {
						weight = new Weight();
						weight.node = child;
						weight.weight = GeomUtils.lineLength(child.x, child.y, main.x, main.y);
						main.environment.push(weight);	
					}
				}
				
			}
		}
		
		public function getNode(x:Number, y:Number):PointBase {
			const key:String = Math.round(x) + "_" + Math.round(y);
			var node:Node = mem[key];
			if (!node) {
				node = new Node();
				node.x = x;
				node.y = y;
				mem[key] = node;
				nodes.push(node);
			}
			return node;
		}
		
		public function pathNameToName(from:String, to:String):Vector.<PointBase> {
			const fromNode:Node = named[from];
			const toNode:Node = named[to];
			if (!fromNode || !toNode)
				throw new Error();
			return pathNodeToNode(fromNode, toNode);
		}
		
		public function pathNameToNode(from:String, to:Node):Vector.<PointBase> {
			const fromNode:Node = named[from];
			if (!fromNode)
				throw new Error();
			return pathNodeToNode(fromNode, to);
		}
		
		public function pathNodeToName(from:Node, to:Node):Vector.<PointBase> {
			const toNode:Node = named[from];
			if (!toNode)
				throw new Error();
			return pathNodeToNode(from, toNode);
		}
		
		public function pathNodeToNode(from:Node, to:Node):Vector.<PointBase> {
			const vizited:Dictionary = new Dictionary();
			const active:Vector.<Path> = new Vector.<Path>();
			var path:Path = new Path();
			path.nodes.push(from);
			active.push(path);
			vizited[from] = [0, path];
			while(active.length) {
				var length:uint = active.length;
				for(var i:uint = 0; i < length; i++) {
					path = active.shift();
					const current:Node = path.nodes[0];
					for each(var weight:Weight in current.environment) {
						const mark:Array = vizited[weight.node];
						if (!mark) {
							if (weight.node == to) {
								path.nodes.unshift(weight.node);
								return Vector.<PointBase>(path.nodes);
							}
							const step:Path = new Path();
							step.nodes = path.nodes.concat();
							step.nodes.unshift(weight.node);
							step.weight = path.weight + weight.weight;
							active.push(step);
							vizited[weight.node] = [step.weight, step];
						}
					}
				}
			}
			return null;
		}
		
		public function free():void {
			for each(var node:Node in nodes) {
				node.environment.length = 0;
			}
			nodes.length = 0;
		}
	}
}
import bitrise.prostokvashino.base.points.PointBase;

import spark.primitives.Path;

class Node extends PointBase {
	
	public var environment:Vector.<Weight> = new Vector.<Weight>();
	
}

class Weight {
	
	public var node:Node;
	public var weight:Number;
	
}

class Path {
	
	public var nodes:Vector.<Node> = new Vector.<Node>();
	public var weight:Number = 0;
	public var active:Boolean = true;
	
}