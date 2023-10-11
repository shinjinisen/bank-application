// actor {
//   public func greet(name : Text) : async Text {
//     return "Hello, " # name # "!";
//   };
// };
import Debug "mo:base/Debug";
import Float "mo:base/Float";
import Time "mo:base/Time";
actor DBank{
  stable var currentValue:Float=300;
  stable var startTime=Time.now();
  // startTime:=Time.now();
  Debug.print(debug_show(startTime));
  // currentValue :=300;
  
  let id= 122393458454;

  Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));

  public func topUp(amount:Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  
  public func topDown(amount:Float){
    let temp:Float=currentValue-amount;
    if(temp>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print("Amount too large");
    }
  };

  public func compound(){
    let currentTime=Time.now();
    let timeElapsedNS=currentTime-startTime;
    let timeElapsedS=timeElapsedNS/1000000000;
    currentValue:=currentValue*(1.01**Float.fromInt(timeElapsedS));
    startTime:=currentTime;
  };
  public query func checkBalance(): async Float{
    return currentValue;
  };


  // topUp();
}
