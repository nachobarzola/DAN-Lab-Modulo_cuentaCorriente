package dan.tp2021.cuentacorriente.service.interfaces;

import java.util.List;

public interface PedidoRestExternoService {
	
	//En realidad son los pedidos enviados por el cliente
	public List<?> obtenerFacturas(Integer idCliente);

}
