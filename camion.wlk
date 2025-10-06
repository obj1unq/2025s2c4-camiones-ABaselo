import cosas.*

object camion {
	
	const property cosas = #{}
	
	const tara = 1000

	const pesoMaximo = 2500

	method cargar(unaCosa) {
		cosas.reaccionar()
		cosas.add(unaCosa)
	}

	method descarga(cosa){
		self.validarDescarga(cosa)
		cosas.remove(cosa)
	}

	method validarDescarga(cosa){
		if(not cosas.contains(cosas)){
			self.error("ERROR, no contiene cosas ")
		}
	}
	method todoPesoPar(){
		return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel){
		self.validarElDeNivel(nivel)
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})

	}
	method validarElDeNivel(nivel){
		if(not cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})){
			self.error("ERROR no se encontro nivel de peligrosidad")
		}
	}

	method pesoTotal() =	 self.pesosCosas() + tara
	
	
	method pesosCosas() =  self.pesos().sum()


	method pesos() = cosas.map({cosa => cosa.peso()})

	method excedidoDePeso() = self.pesoTotal() > pesoMaximo
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})

	method objetoMasPeligrosoQue(nivel) = self.objetosQueSuperanPeligrosidad(cosas.nivelPeligrosidad())

	method puedeCircularEnRuta(nivelParaCircular){
		return not self.objetosQueSuperanPeligrosidad(nivelParaCircular).isEmpty()
	}

	method tienenAlgoQuePesaEntre(minCosa,maxCosa){
		return cosas.any({cosa => cosa.peso().between(minCosa, maxCosa)})
	}

	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}

	method totalBultos() = cosas.sum({cosa => cosa.cantBultos()})

	method transportar(destino, camino) {
		self.validarViaje(destino, camino)

		destino.descarga(cosas, self)

		self.vaciarCamion()
	  
	}

	method validarViaje(destino, camino){

		//camino.validarCircular(self)
	
		//destino.validarDescarga(self)
	}

	method vaciarCamion(){
		cosas.clear()
	}	


}


object ruta9{
	
	method nivelPeligrosidad(){
		return 11
	}

	method validarCircular(camion) {
		if(not camion.puedeCircularEnRuta(self.nivelPeligrosidad())){
			self.error("Supera el nivel de peligrosidad permitido")
		}
	  
	}
	
}

object caminosVecinales{
	var pesoMax = 0

	method pesoMaximo(peso) {
		pesoMax = peso	  
	}

	method execedidoDePeso(camion) = pesoMax < camion.pesoTotal()

	method validarCircular(camion){

		if(self.execedidoDePeso(camion)){
				self.error("Supera el peso permitido")
		}
	} 
}
