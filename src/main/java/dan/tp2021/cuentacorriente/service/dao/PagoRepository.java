package dan.tp2021.cuentacorriente.service.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import dan.tp2021.cuentacorriente.domain.Cliente;
import dan.tp2021.cuentacorriente.domain.Pago;

@Repository
public interface PagoRepository extends JpaRepository<Pago,Integer> {
	
	
	List<Pago> findByCliente(Cliente cliente);

}
