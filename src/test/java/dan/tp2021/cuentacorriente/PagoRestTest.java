package dan.tp2021.cuentacorriente;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import java.time.Instant;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import dan.tp2021.cuentacorriente.domain.Cliente;
import dan.tp2021.cuentacorriente.domain.Efectivo;
import dan.tp2021.cuentacorriente.domain.Pago;
import dan.tp2021.cuentacorriente.service.dao.ClienteRepository;
import dan.tp2021.cuentacorriente.service.interfaces.PagoService;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)

public class PagoRestTest {

	private String ENDPOINT_PAGO = "/api/pago";
	private RestTemplate restTemplate = new RestTemplate();

	@Autowired
	TestRestTemplate testRestTemplate;

	@Autowired
	private PagoService pagoService;
	
	@Autowired
	private ClienteRepository clienteRepo;

	@LocalServerPort
	String puerto;

	

	/*
	 * Testea que se guarde un pago correctamente
	 */
	@Test
	void guardarPago() {
		String server = "http://localhost:" + puerto + ENDPOINT_PAGO;

		Pago pago = new Pago();
		

		Efectivo efe = new Efectivo();
		efe.setNroRecibo(321532);
		efe.setObservacion("Medio de pago efectivo");

		Cliente c1 = new Cliente();
		c1.setRazonSocial("ClienteRaton01");
		clienteRepo.saveAndFlush(c1);

		pago.setCliente(c1);
		pago.setFechaPago(Instant.now());
		pago.setMedio(efe);

		HttpEntity<Pago> requestPago = new HttpEntity<>(pago);
		ResponseEntity<Pago> respuesta = restTemplate.exchange(server, HttpMethod.POST, requestPago, Pago.class);

		assertTrue(respuesta.getStatusCode().equals(HttpStatus.OK));

		pago = respuesta.getBody();
		// Chequeo que no este persistido
		Optional<Pago> pag = pagoService.buscarPorId(pago.getId());

		assertNotEquals(Optional.empty(), pag);

		pagoService.borrarPago(pago);
		clienteRepo.delete(c1);

	}
}
