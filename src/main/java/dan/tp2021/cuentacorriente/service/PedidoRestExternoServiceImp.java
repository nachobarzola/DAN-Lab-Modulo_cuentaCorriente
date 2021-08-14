package dan.tp2021.cuentacorriente.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.circuitbreaker.CircuitBreaker;
import org.springframework.cloud.client.circuitbreaker.CircuitBreakerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import dan.tp2021.cuentacorriente.service.interfaces.PedidoRestExternoService;

@Service
public class PedidoRestExternoServiceImp implements PedidoRestExternoService {
	@SuppressWarnings("rawtypes")
	@Autowired
	CircuitBreakerFactory circuitBreakerFactory;
	
	@Autowired
	RestTemplate restPedido;

	private static String API_REST_PEDIDO = "http://modulo-pedidos/";
	private static String ENDPOINT_PEDIDO = "api/pedido";

	@Override
	public List<?> obtenerFacturas(Integer idCliente) {
		CircuitBreaker circuitBreaker = circuitBreakerFactory.create("circuitbreaker");

		String uri = API_REST_PEDIDO + ENDPOINT_PEDIDO + "?idCliente=" + idCliente;
		//
		List<?> respuesta;

		//
		respuesta = circuitBreaker.run(() -> 
		restPedido.getForObject(uri,List.class),
		throwable -> defaultResponse());

			return respuesta;
		
	}
	
	public List<?> defaultResponse() {
		return null;
			
	}

}
