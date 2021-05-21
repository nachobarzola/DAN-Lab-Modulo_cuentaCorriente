package dan.tp2021.cuentacorriente.service.dao;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dan.tp2021.cuentacorriente.domain.Cliente;

@Repository
@Transactional(readOnly = true)
public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

}
