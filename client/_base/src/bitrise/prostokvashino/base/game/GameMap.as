package bitrise.prostokvashino.base.game
{
	import bitrise.prostokvashino.base.game.action.ActionBase;
	import bitrise.prostokvashino.base.game.action.AddScore;
	import bitrise.prostokvashino.base.game.action.HideAction;
	import bitrise.prostokvashino.base.game.action.VectorMoveAction;
	import bitrise.prostokvashino.base.game.action.WaitAction;
	import bitrise.prostokvashino.base.points.Building;
	import bitrise.prostokvashino.base.points.Graph;
	import bitrise.prostokvashino.base.points.Map;
	import bitrise.prostokvashino.base.points.PointBase;
	
	public class GameMap extends Map
	{
		
		public var cars:Vector.<GameCar>;
		public var graph:Graph;
		
		public function GameMap()
		{
			super();
			cars = new Vector.<GameCar>();
		}
		
		public function compile():void {
			graph = new Graph(this);
		}
		
		public function addCar(car:GameCar):GameCar {
			cars.push(car);
			return car;
		}
		
		public function goBuildingToBuilding(car:GameCar, from:Building, to:Building):void {
			const path:Vector.<PointBase> = graph.pathNameToName(from.name, to.name);
			if (path) {
				path.shift();
				path.pop();
				car.actions.push(new VectorMoveAction(path.concat().reverse()), new WaitAction(5000 * Math.random()), new AddScore(100 * Math.random()), new VectorMoveAction(path), new HideAction(2000));
				car.render(0);
				scene.addChild(car.carSprite);
			}
		}
		
		public function render(delta:int):void {
			for each(var car:GameCar in cars) {
				car.render(delta);
			}
		}
	}
}