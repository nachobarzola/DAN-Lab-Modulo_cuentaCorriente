package dan.tp2021.cuentacorriente.rest;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dan.tp2021.cuentacorriente.domain.Pago;
import dan.tp2021.cuentacorriente.service.interfaces.PagoService;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/api/pago")
public class PagoRest {

	@Autowired
	PagoService pagoService;

	@PostMapping
	@ApiOperation(value = "Crea un pago")
	public ResponseEntity<Pago> crear(@RequestBody Pago pago) {

		;

		if (pago.getMedio() != null && pago.getCliente() != null) {

			if (pagoService.guardarPedido(pago) != null) {
				return ResponseEntity.ok(pago);
			}

		}

		return ResponseEntity.badRequest().build();

	}

	@PutMapping(path = "/{idPago}")
	@ApiOperation(value = "Actualiza un pago dado un id")
	public ResponseEntity<Pago> actualizar(@RequestBody Pago pago, @PathVariable Integer idPago) {
		if (!pagoService.buscarPorId(idPago).isEmpty()) {
			if (pagoService.actualizarPago(pago) != null) {
				return ResponseEntity.ok(pago);
			}

		}
		return ResponseEntity.notFound().build();

	}

	@DeleteMapping(path = "/{idPago}")
	@ApiOperation(value = "Borra un pago dado un id")
	public ResponseEntity<Pago> borrar(@PathVariable Integer idPago) {
		Optional<Pago> pago = pagoService.buscarPorId(idPago);

		if (pago.isPresent()) {
			pagoService.borrarPago(pago.get());
			return ResponseEntity.ok(pago.get());

		}
		return ResponseEntity.notFound().build();
	}

	@GetMapping(path = "/{idPago}")
	@ApiOperation(value = "Obtiene un pago dado un id")
	public ResponseEntity<Pago> obtener(@PathVariable Integer idPago) {
		Optional<Pago> pago = pagoService.buscarPorId(idPago);
		if (!pago.isEmpty()) {
			return ResponseEntity.ok(pago.get());
		}

		return ResponseEntity.notFound().build();

	}

	// TODO: b. Retorna el estado de cuenta corriente de un cliente con un detalle
	// de:
	// i. Pagos
	// ii. Facturas (pedidos enviados)

}
