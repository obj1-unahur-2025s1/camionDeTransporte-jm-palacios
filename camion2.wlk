object camion {
    const carga = []

    method cargarCosa(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciaDeCarga()}
    method descargarCosa(unaCosa){carga.remove(unaCosa)}
    method pesoTotal() = 1000 + self.pesoCarga()
    method pesoCarga() = carga.sum({e => e.peso()})
    method pesoDeCargaEsPar() = carga.all({p => p.peso().even()}) 
    method hayCosaConPeso(unPeso) = carga.any({p => p.peso()==unPeso})
    method cosaConPeligrosidad(unNivel) = carga.find({e => e.peligosidad() == unNivel})
    method cosasSuperanPeligrosidad(unNivel) = carga.filter({e => e.peligosidad() > unNivel}) 
    method cosasMasPeligrosasQue(unaCosa) = self.cosasSuperanPeligrosidad(unaCosa.peligosidad())
    method excedidoDePeso () = self.pesoTotal() > 2500
    method puedeCircular(unNivel) =
        not self.excedidoDePeso() and self.cosasSuperanPeligrosidad(unNivel).isEmpty() 
    method tieneAlgoQuePesaEntre(min, max) = carga.any({e => e.peso().between(min, max)})
    method cosaMasPesada() = carga.max({e => e.peso()})          

}