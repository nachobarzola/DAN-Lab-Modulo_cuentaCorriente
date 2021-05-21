package dan.tp2021.cuentacorriente.service.interfaces;

import java.util.List;
import java.util.Optional;


import dan.tp2021.cuentacorriente.domain.Pago;

public interface PagoService {

	public Pago guardarPago(Pago pago);
	
	public Optional<Pago> buscarPorId(Integer id);

	public void borrarPago(Pago pago);

	public Pago actualizarPago(Pago pago);

	public List<Pago> buscarPagoPorIdCliente(Integer idCliente);
	
}
