object knightRider {
    method peso() = 500
    method peligrosidad() = 10  
}
object bumbleblee {
    var estado = auto
    method peso() = 800 
    method peligrosidad() = estado.peligrosidad() 
    method transformase() {estado = estado.nuevoEstado()}
}
object auto {
    method peligosidad() = 15 
    method nuevoEstado() = robot  
}
object robot {
    method peligrosidad() = 30  
    method nuevoEstado() = auto 
}
object ladrillos {
    var property cantidad = 0 //property hace los metodos de setter y getter, se hace publico
    method peligrosidad() = 2
    method peso() = cantidad * 2 
  //  method cantidad(unValor) {cantidad = unValor} esto lo hace el property  
  //  method cantidad() = cantidad esto lo hace el property
}
object arena {
    var property peso = 0
    method peligrosidad() = 1  
}
object bateriaAntiaerea {
    var tieneMisiles = false
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method peso() = if(tieneMisiles) 300 else 200
    method cargarMisiles(){tieneMisiles = true}
    method descargarMisiles(){tieneMisiles = false}   
}
object contenedor {
    const contenido = []
    method peso() = 100 + contenido.sum({c => c.peso()})
    method peligrosidad() = 
    if (contenido.isEmpty()) 0 else contenido.max({p => p.peligosidad()}).peligosidad()
    method agregarCosa(unaCosa) {contenido.add(unaCosa)}
    method quitarCosa(unaCosa) {contenido.remove(unaCosa)}
    method agregarListaDeCosas(unaLista){contenido.addAll(unaLista)}
    method vaciarContenedor(){contenido.clear()}
}
object residuosRadiactvos {
    var property peso = 0
    method peligrosidad() = 200  
}
object embalajeDeSeguridad {
    var property cosaEnvuelta = arena
    method envolver(unaCosa) {cosaEnvuelta = unaCosa}
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligosidad()*0.5 

  
}