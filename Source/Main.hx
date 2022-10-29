package;

import feathers.controls.Alert;
import feathers.controls.Application;
import feathers.controls.Button;
import feathers.controls.Header;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.controls.Panel;
import feathers.controls.TextInput;
import feathers.events.TriggerEvent;
import feathers.layout.HorizontalAlign;
import feathers.layout.VerticalAlign;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;
import feathers.text.TextFormat;
import openfl.events.Event;
import openfl.text.TextFormatAlign;
import prominic.demo.Writer;

class Main extends Application {

	var _buttonPopup:Button;
	var _buttonSaveTimestamp:Button;
	var _contentGroup:LayoutGroup;
	var _contentGroupLayout:VerticalLayout;
	var _dialog:Panel;
	var _fileNameLabel:Label;
	var _filePathInput:TextInput;
	var _filePathLabel:Label;
	var _header:Header;
	var _labelHelloWorld:Label;
	var _labelTestFileName:Label;
	var _labelTestFilePath:Label;
	var _layout:VerticalLayout;

	public function new() {

		super();

		_createScene();

	}

	function _createScene() {

		_layout = new VerticalLayout();
		this.layout = _layout;

		_header = new Header( Labels.Title );
		_header.layoutData = new VerticalLayoutData( 100 );
		this.addChild( _header );

		_contentGroup = new LayoutGroup();
		_contentGroup.layoutData = new VerticalLayoutData( 100, 100 );
		_contentGroupLayout = new VerticalLayout();
		_contentGroupLayout.verticalAlign = VerticalAlign.TOP;
		_contentGroupLayout.horizontalAlign = HorizontalAlign.CENTER;
		_contentGroupLayout.gap = 16;
		_contentGroupLayout.setPadding( 32 );
		_contentGroup.layout = _contentGroupLayout;
		this.addChild( _contentGroup );

		_labelHelloWorld = new Label( Labels.HelloWorld );
		_labelHelloWorld.textFormat = TextFormats.HEADING;
		_contentGroup.addChild( _labelHelloWorld );

		_buttonPopup = new Button( Labels.ShowDialog );
		_buttonPopup.addEventListener( TriggerEvent.TRIGGER, _buttonPopupTriggered );
		_contentGroup.addChild( _buttonPopup );

		_contentGroup.addChild( new LayoutGroup() );

		_labelTestFilePath = new Label( Labels.TestFilePath );
		_labelTestFilePath.textFormat = TextFormats.BOLD;
		_contentGroup.addChild( _labelTestFilePath );

		_filePathLabel = new Label( Writer.getDefaultPath() );
		_filePathLabel.textFormat = TextFormats.MONOSPACE_SMALL;
		_filePathLabel.textFormat.align = TextFormatAlign.CENTER;
		_filePathLabel.layoutData = new VerticalLayoutData( 100 );
		_filePathLabel.wordWrap = true;
		_contentGroup.addChild( _filePathLabel );

		_labelTestFileName = new Label( Labels.TestFileName );
		_labelTestFileName.textFormat = TextFormats.BOLD;
		_contentGroup.addChild( _labelTestFileName );

		_filePathInput = new TextInput();
		_filePathInput.textFormat = TextFormats.MONOSPACE;
		_filePathInput.restrict = Writer.ALLOWED_FILE_NAME_CHARS;
		_filePathInput.maxChars = Writer.MAX_FILE_NAME_LENGTH;
		_filePathInput.text = Writer.DEFAULT_FILE_NAME;
		_filePathInput.addEventListener( Event.CHANGE, _filePathInputChanged );
		_contentGroup.addChild( _filePathInput );

		_buttonSaveTimestamp = new Button( Labels.TestWriting );
		_buttonSaveTimestamp.addEventListener( TriggerEvent.TRIGGER, _buttonSaveTimestampTriggered );
		_contentGroup.addChild( _buttonSaveTimestamp );

	}

	function _buttonPopupTriggered( e:TriggerEvent ) {

		Alert.show( Labels.GenesisDescription, Labels.Genesis, [ Labels.OK ] );

	}

	function _buttonSaveTimestampTriggered( e:TriggerEvent ) {

		if ( Writer.writeData( _filePathInput.text, Date.now().toString() ) ) {

			_writeSuccess();

		} else {

			_writeFailed();

		}

	}

	function _filePathInputChanged( e:Event ) {

		_buttonSaveTimestamp.enabled = _filePathInput.text.length > 0;

	}

	function _writeSuccess() {

		Alert.show( Labels.SuccessDescription, Labels.Success, [ Labels.OK ] );

	}

	function _writeFailed() {

		Alert.show( Labels.ErrorDescription, Labels.Error, [ Labels.OK ] );
		
	}

}

enum abstract Labels( String ) to String {

	var Error = "Error";
	var ErrorDescription = "Test writing has failed";
	var Genesis = "Genesis";
	var GenesisDescription = "Apps catalog for Domino ecosystem";
	var HelloWorld = "Hello World!";
	var OK = "OK";
	var ShowDialog = "Show Dialog";
	var Success = "Success";
	var SuccessDescription = "Test writing has been successful";
	var TestFileName = "Test File Name:";
	var TestFilePath = "Test File Path:";
	var TestWriting = "Test writing current timestamp to file";
	var Title = "Genesis Haxe / OpenFL / Feathers UI Demo";

}

class TextFormats {

	public static final BOLD = new TextFormat( "_sans", 14, null, true );
	public static final HEADING = new TextFormat( "_sans", 24 );
	public static final MONOSPACE = new TextFormat( "_typewriter", 16 );
	public static final MONOSPACE_SMALL = new TextFormat( "_typewriter", 12 );

}
