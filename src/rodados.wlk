object interiorComodo {
	method capacidad() = 5
	method peso() = 700
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorPulenta {
	method peso() = 800
	method velocidadMaxima() = 130
}

object motorBataton {
	method peso() = 500
	method velocidadMaxima() = 80
}

object traffic {
	var property interior = null
	var property motor = null
	
	method velocidadMaxima() {
		return motor.velocidadMaxima()
	}
	method capacidad() {
		return interior.capacidad()
	}
	method peso() {
		return 4000 + interior.peso() + motor.peso()
	}
	method color() {
		return "blanco"
	}
}

class ChevroletCorsa {
	var property color = null
	
	method capacidad() = 4
	method velocidadMaxima() = 150
	method peso() = 1300
}

class RenaultKwid {
	var tanqueAdicional = false
	
	
}

class AutoEspecial {
	var property capacidad
	var property velocidadMaxima
	var property color
	var property peso
}

class Dependencia {
	var flota = []
	var property empleados
	
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}
	
	method pesoTotalFlota() {
		return flota.sum{r => r.peso()}
	}
	
	method estaBienEquipada() {
		return flota.size() >= 3 and self.todosSuperanVelocidad(100)
	}
	
	method todosSuperanVelocidad(velocidad) {
		return flota.all{r => r.velocidadMaxima() >= velocidad}
	}
	
	method capacidadTotalEnColor(color) {
		return self.rodadosEnColor(color).sum{r => r.capacidad()}
	}
	
	method rodadosEnColor(color) {
		return flota.filter{r => r.color() == color}
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max{r => r.velocidadMaxima()}.color()
	}
	
	method capacidadTotal() {
		return flota.sum{r => r.capacidad()}
	}
	
	method capacidadFaltante() {
		return 0.max(empleados - self.capacidadTotal())
	}
	
	method esGrande() {
		return empleados >= 40 and flota.size() >= 5
	}
}

class Pedido {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadPasajeros
	var property coloresRechazados = []
	
	method velocidadRequerida() = distanciaARecorrer / tiempoMaximo
	
	method puedeSatisfacerPedido(unAuto) {
		return unAuto.velocidadMaxima() - self.velocidadRequerida() >= 10
				and unAuto.capacidad() >= cantidadPasajeros
	}
}


































