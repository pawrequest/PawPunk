module PawPunk.Test
import PawPunk.Funcs.*

class AnObj extends IScriptable{
    public let value: String;
}

func Test(){
    let anobj = new AnObj();
    anobj.value = "aval";
    let serial = SerializeObject(anobj);
    Log(serial);
}
