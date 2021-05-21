package dan.tp2021.cuentacorriente.service.interfaces;

import java.util.Optional;


import dan.tp2021.cuentacorriente.domain.Pago;

public interface PagoService {

	public Pago guardarPedido(Pago pago);
	
	public Optional<Pago> buscarPorId(Integer id);

	public void borrarPago(Pago pago);

	public Pago actualizarPago(Pago pago);
	
}
