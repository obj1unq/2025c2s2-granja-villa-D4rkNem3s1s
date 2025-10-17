import cultivos.*
import wollok.game.*
import personaje.*
import posiciones.*

class Aspersor {
    var property position = game.center()

    const property esMercado = false
    const property esCultivo = false

    method image() = "aspersor.png"
    

    method regar() {
        self.conseguirDirecciones().forEach({ direccion =>   
            game.getObjectsIn(direccion).filter({ objeto => objeto.esCultivo() }).forEach({ cultivo => cultivo.crecer() })
    })
    }
        
    method inicializar(){
        game.onTick(1000, "regado", {self.regar()})
    }

    method conseguirDirecciones(){
        const direcciones = [norte, sur, este, oeste, noreste, noroeste, sureste, suroeste]

        return direcciones.map({ direccion => direccion.siguiente(self.position())})
    }

    method validarRiego(posicion) {
        if (game.getObjectsIn(posicion).size() < 1)
            self.error("")
    }
}

class Tienda {
    const property position
    var property monedas = 12000
    const property comprados = []

    const property esMercado = true

    method venderCosecha(cosecha) {

        self.puedeComprar(cosecha)
        cosecha.forEach({cultivo => personaje.monedas(personaje.monedas() + cultivo.precio())
        monedas -= cultivo.precio()
        personaje.cultivos().remove(cultivo)
        comprados.add(cultivo)})

    }

    method puedeComprar(_cosecha){
        var precioTotal = 0
        _cosecha.forEach({cultivo => precioTotal = precioTotal + cultivo.precio()})
        if (monedas < precioTotal){
            self.error("BancaRota")
        }
    }



    method image()= "market.png"
}