module PawPunk.Test
import PawPunk.*

class AnObj extends IScriptable{
    public let value: String;
}

fun Test(){
    let anobj = new AnObj();
    anobj.value = "aval";
    let serial = SerializeObject(anobj);
    Log(serial);
}
