object knightRider {
	method peso() =  500 
	method nivelPeligrosidad() =  10 

}

object arenaAGranel{
var  property  peso = 0 

method nivelPeligrosidad() { return 1 }


}
 object bumblebee {
	var property estado = auto 

	method peso() { return 800 }

	method nivelPeligrosidad() = estado.nivelPeligrosidad() 
   
	method reaccionar(){
		estado = robot
	}
 }

 object auto {
	method nivelPeligrosidad() =  15    
 }


object robot {
	method nivelPeligrosidad() =  30
  
}

object paqueteDeLadrillos{
	
	const pesoPorLadrillo = 2

	var cantDeLadrillos = 0

	method peso() = cantDeLadrillos * pesoPorLadrillo
	

	method cantDeLadrillos() = cantDeLadrillos

	method agregar(cant) {
	  cantDeLadrillos += cant
	}

	method sacar(cant){
		self.validarSacarLadrillos(cant)
		cantDeLadrillos -= cant
	}

	method validarSacarLadrillos(cant) {
		if(cant>cant){
			self.error("la cantidad de ladrillos no esta disponible, supera la cantidad que almacena")
		}
	  
	}

	method nivelPeligrosidad() = 2

	method cantBultos(){

		 if ( cantDeLadrillos <= 100){
			return 1
		 }
		 else if (cantDeLadrillos.between(101, 300)){
			return 2
		 }
		 else{
			return 3
		 }	
		
	}

	 method reaccionar(){
		self.agregar(12)
	 } 
}

object arenaAGranl {
	var property peso = 0 

	method nivelPeligrosidad() = 1

	method agregar(cant) {
		peso += cant
	}

	method sacar(cant) {
		self.validarSacarArena(cant)
		peso -= cant
	  
	}

	method validarSacarArena(cant){
		if(peso < cant){
			self.error("ERROR, no cuenta con la cantidad de arena disponible")
		}
	}
	method cantBultos() = 1

	method reaccionar(){
		self.agregar(20)
	}


}

object bateriaAntiarea{

	var estado = desArmado

	method peso() = estado.peso()

	method estado() = estado

	method nivelPeligrosidad() = estado.nivelPeligrosidad()

	method cantBultos() = estado.cantBultos()

	method reaccionar(){
		estado = armado
	}
	
}
	
object armado {
	
	method peso() = 300
	
	method nivelPeligrosidad() = 100

	method cantBultos() = 2
}

object desArmado {
	
	method peso() = 200
	
	method nivelPeligrosidad() = 0

	method cantBultos() = 1
}






