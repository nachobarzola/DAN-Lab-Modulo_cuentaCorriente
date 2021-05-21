package dan.tp2021.cuentacorriente.service.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dan.tp2021.cuentacorriente.domain.Pago;

@Repository
public interface PagoRepository extends JpaRepository<Pago,Integer> {

}
