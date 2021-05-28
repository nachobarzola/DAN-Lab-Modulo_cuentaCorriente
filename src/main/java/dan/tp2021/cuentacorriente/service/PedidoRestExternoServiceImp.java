package dan.tp2021.cuentacorriente.service;

import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import dan.tp2021.cuentacorriente.service.interfaces.PedidoRestExternoService;

@Service
public class PedidoRestExternoServiceImp implements PedidoRestExternoService {

	private static String API_REST_PEDIDO = "http://localhost:9002/";
	private static String ENDPOINT_PEDIDO = "api/pedido";

	@Override
	public List<?> obtenerFacturas(Integer idCliente) {

		RestTemplate restProducto = new RestTemplate();
		String uri = API_REST_PEDIDO + ENDPOINT_PEDIDO + "?idCliente=" + idCliente;
		//
		ResponseEntity<List<?>> respuesta;

		//

		respuesta = restProducto.exchange(uri, HttpMethod.GET, null, new ParameterizedTypeReference<List<?>>() {
		});

		if (respuesta.getStatusCode().equals(HttpStatus.OK)) {
			return respuesta.getBody();
		} else {
			return null;
		}
	}

}
