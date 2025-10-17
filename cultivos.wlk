import wollok.game.*

class Maiz {

	var property position = game.center()
	var property image = "corn_baby.png"
	const property esCultivo = true

	const property esMercado = false
	

	method precio()=150

	method esAdulto()= image == "corn_adult.png"

	method image() {
		return image
	}

	method crecer(){
		if(self.image() == "corn_baby.png"){
			image = "corn_adult.png"
		}
	}
}

class Trigo {
	var property position = game.center()
	var property etapa = 0
	const property esCultivo = true
	const property esMercado = false

	method image(){
		return "wheat_" + etapa + ".png"
	}

	method precio()=(etapa -1) * 100

	method esAdulto()= etapa >= 2

	method crecer(){
		if(etapa == 3){
			etapa = 0
		}else{
			etapa += 1
		}
	}
}

class Tomaco{
	var property position = game.center()
	const property esCultivo = true
	const esAdulto = true
	const property precio = 80

	const property esMercado = false

	method esAdulto()= esAdulto

	method image(){
		return "tomaco.png"
	}

	method crecer(){
		if(game.getObjectsIn(game.at(self.position().x(), self.position().y() + 1)).size() == 0){
		position = game.at(self.position().x(), self.position().y() +1)}
		if (self.position().y() == game.height()){
			position = game.at(self.position().x(), 0)
		}
	}
}