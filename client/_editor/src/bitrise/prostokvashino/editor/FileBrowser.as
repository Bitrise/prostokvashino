package bitrise.prostokvashino.editor
{
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;

	public class FileBrowser
	{
		
		public static function brows(url:String):ArrayCollection {
			var file:File = File.applicationDirectory.resolvePath( url );
//			if ( file.exists ) {
				
//				var loader:Loader = new Loader();
				if ( file.isDirectory ) {
//					loader.addDirectory( file.clone() );
				} else {
//					loader.addFile( file );
				}
//				return loader.list;
				
//			} else {
				
				return null;
				
//			}
		}
		
	}
}
import flash.events.FileListEvent;
import flash.events.IOErrorEvent;
import flash.filesystem.File;

import mx.collections.ArrayCollection;

internal final class Loader {
	
	//--------------------------------------------------------------------------
	//
	//  Class variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private static const _ROOT:File = new File( File.applicationDirectory.nativePath );
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Constructor
	 */
	public function Loader() {
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private var _count:uint = 0;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	public const list:ArrayCollection = new ArrayCollection();
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
//	public function addDirectory(file:File):void {
//		file.addEventListener( FileListEvent.DIRECTORY_LISTING,	this.handler_directory_listing );
//		file.addEventListener( IOErrorEvent.IO_ERROR,			this.handler_directory_error );
//		file.getDirectoryListingAsync();
//		++this._count;
//	}
	
//	public function addFile(file:File):void {
//		
//		var url:String = _ROOT.getRelativePath( file, true );
//		
//		var loader:ILoadable = ResourceCatcher.loadResourceBundle( url );
//		if ( loader.complete ) {
//			this.addBundle( url );
//		} else {
//			loader.addEventListener( Event.COMPLETE,	this.handler_loader_complete );
//			loader.addEventListener( ErrorEvent.ERROR,	this.handler_loader_error );
//			++this._count;
//		}
//		
//	}
//	
//	//--------------------------------------------------------------------------
//	//
//	//  Private methods
//	//
//	//--------------------------------------------------------------------------
//	
//	/**
//	 * @private
//	 */
//	private function addBundle(bundleName:String):void {
//		var source:Array = this.list.source;
//		var i:uint = source.length;
//		if ( i > 0 ) {
//			while ( i-- ) {
//				if ( bundleName >= ( source[ i ] as ResourceDefinition ).bundleName ) {
//					break;
//				}
//			}
//			++i;
//		}
//		for each ( var resource:ResourceDefinition in ResourceCatcher.catchResourceBundle( bundleName, this.bitmap ) ) {
//			this.list.addItemAt( resource, i++ );
//		}
//	}
//	
//	//--------------------------------------------------------------------------
//	//
//	//  Event handlers
//	//
//	//--------------------------------------------------------------------------
//	
//	/**
//	 * @private
//	 */
//	private function handler_directory_listing(event:FileListEvent):void {
//		--this._count;
//		var file:File = event.target as File;
//		file.removeEventListener( FileListEvent.DIRECTORY_LISTING,	this.handler_directory_listing );
//		file.removeEventListener( IOErrorEvent.IO_ERROR,			this.handler_directory_error );
//		for each ( file in event.files ) {
//			if ( file.isDirectory ) {
//				this.addDirectory( file );
//			} else {
//				this.addFile( file );
//			}
//		}
//	}
//	
//	/**
//	 * @private
//	 */
//	private function handler_directory_error(event:IOErrorEvent):void {
//		--this._count;
//		var file:File = event.target as File;
//		file.removeEventListener( FileListEvent.DIRECTORY_LISTING,	this.handler_directory_listing );
//		file.removeEventListener( IOErrorEvent.IO_ERROR,			this.handler_directory_error );
//	}
//	
//	/**
//	 * @private
//	 */
//	private function handler_loader_complete(event:Event):void {
//		--this._count;
//		var loader:ILoadable = event.target as ILoadable;
//		loader.removeEventListener( Event.COMPLETE, this.handler_loader_complete );
//		loader.removeEventListener( ErrorEvent.ERROR, this.handler_loader_error );
//		if ( loader is ILoader ) {
//			this.addBundle( ( loader as ILoader ).url );
//		}
//	}
//	
//	/**
//	 * @private
//	 */
//	private function handler_loader_error(event:ErrorEvent):void {
//		--this._count;
//		var loader:ILoadable = event.target as ILoadable;
//		loader.removeEventListener( Event.COMPLETE, this.handler_loader_complete );
//		loader.removeEventListener( ErrorEvent.ERROR, this.handler_loader_error );
//	}
	
}