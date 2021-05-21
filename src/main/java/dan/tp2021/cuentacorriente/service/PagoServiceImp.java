package dan.tp2021.cuentacorriente.service;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import dan.tp2021.cuentacorriente.domain.Pago;
import dan.tp2021.cuentacorriente.service.dao.PagoRepository;
import dan.tp2021.cuentacorriente.service.interfaces.PagoService;

public class PagoServiceImp implements PagoService {
	
	@Autowired PagoRepository pagoRepo;
	
	@Override
	public Pago guardarPedido(Pago pago) {
		
		return pagoRepo.save(pago);
	}

	@Override
	public Optional<Pago> buscarPorId(Integer id) {
		
		return pagoRepo.findById(id);
	}

	@Override
	public void borrarPago(Pago pago) {
			pagoRepo.delete(pago);
	}

	@Override
	public Pago actualizarPago(Pago pago) {
		// TODO Auto-generated method stub
		return null;
	}

	
		
}
