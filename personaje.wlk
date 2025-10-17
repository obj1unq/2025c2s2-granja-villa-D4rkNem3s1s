import bonus.*
import wollok.game.*
import cultivos.*

object personaje {
	var property position = game.center()
	var property image = "mplayer.png"
	const property esCultivo = false
	var property monedas = 0
	const property cultivos = []
	const property esMercado = false
	var property edad = 20

	method crecer() {
		edad += 1
	}
	
	method sembrar(cultivo) {
		if (game.getObjectsIn(position).size() == 1) {
			game.addVisual(cultivo)
			cultivo.position(self.position())
		}
	}
	
	method cosechar() {
		if (self.hayCultivo()) {
			var cultivo = game.getObjectsIn(position).find({ cultivo => cultivo.esCultivo() })
			self.sePuedeCosechar(cultivo)
			cultivos.add(cultivo)
			game.removeVisual(cultivo)
		}else{
			self.error("No hay nada que cosechar")
		}
	}

	method sePuedeCosechar(cultivo){
		if(!cultivo.esAdulto()){
			self.error("No es adulto todavia")
		}
	}
	//game.getObjectsIn(position).forEach({objeto => if(objeto.esCultivo()){game.removeVisual(objeto)}})
	method regar() {
		self.validarRegar()
		game.getObjectsIn(position).forEach({ cultivo => cultivo.crecer() })
	}
	

	method validarRegar() {
		if (game.getObjectsIn(position).size() < 2) self.error(
				"no hay cultivo que regar"
			)
	}
	
	method hayCultivo() = game.getObjectsIn(position).size() == 2
	
	method vender() {
		const tienda = game.getObjectsIn(self.position()).find({objeto => objeto.esMercado()})
		if(cultivos.size() > 0){
			tienda.venderCosecha(cultivos)
		}
	}

	method intentarVender(){
		if(game.getObjectsIn(self.position()).filter({objeto => objeto.esMercado()}).size() > 0){
			self.vender()
		}else{
			self.error("No estoy en la tienda :(")
		}
	}

	method informacion() {
		game.say(self, {"Monedas = " + self.monedas() + "y cultivos = " + self.cultivos().size()})
	}

	method dejarAspersor(){
		const regador = new Aspersor()
		game.addVisual(regador)
		regador.position(self.position())
		regador.inicializar()
	}
}