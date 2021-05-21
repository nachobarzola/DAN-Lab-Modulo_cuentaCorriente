package dan.tp2021.cuentacorriente.domain;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "ID_EFECTIVO_MEDIO_PAGO")
public class Efectivo extends MedioPago {

	private Integer nroRecibo;

	public Integer getNroRecibo() {
		return nroRecibo;
	}

	public void setNroRecibo(Integer nroRecibo) {
		this.nroRecibo = nroRecibo;
	}
}
