package prominic.demo;

#if web
import js.Browser;
#end

#if sys
import lime.system.System;
import sys.io.File;
#end

class Writer {

    public static final ALLOWED_FILE_NAME_CHARS:String = "a-z A-Z 0-9";
    public static final DEFAULT_FILE_NAME:String = "default.txt";
    public static final MAX_FILE_NAME_LENGTH:Int = 32;

    public static function getDefaultPath():String {

        #if sys

        return System.applicationStorageDirectory;

        #elseif web

        return "{browser_local_storage}/";

        #end

        return "";

    }

    public static function writeData( filename:String, data:String ):Bool {

        #if web

        try {

            var storage = Browser.getLocalStorage();
            storage.setItem( filename, data );
            return true;

        } catch ( e ) {

            return false;

        }

        #elseif sys

        try {

            File.saveContent( System.applicationStorageDirectory + filename, data );
            return true;

        } catch ( e ) {

            return false;

        }

        #end

        return false;

    }

}