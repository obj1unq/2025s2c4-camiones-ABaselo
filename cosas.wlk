object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }

}

object arenaAGranel{
var  property  peso = 0 

method nivelPeligrosidad() { return 1 }


}
 object bumblebee {
	var property estado = auto 

	method peso() { return 800 }

	method nivelPeligrosidad(){return estado.nivelPeligrosidad() }
   
	method reaccionar(){
		estado = robot
	}
 }

 object auto {
	method nivelPeligrosidad(){return 15 }   
 }


object robot {
	method nivelPeligrosidad() {return 30}
  
}





