package dan.tp2021.cuentacorriente.domain;

import java.time.Instant;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;



@Entity
public class Pago {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //valor autonumerico
	@Column(name="ID_PAGO")
	private Integer id;
	
	@OneToOne
	@JoinColumn(name="ID_CLIENTE")
	private Cliente cliente;
		
	@OneToOne
	@JoinColumn(name="ID_MEDIO_PAGO")
	private MedioPago medio;
	
	private Instant fechaPago;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Instant getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(Instant fechaPago) {
		this.fechaPago = fechaPago;
	}
	public MedioPago getMedio() {
		return medio;
	}
	public void setMedio(MedioPago medio) {
		this.medio = medio;
	}
	
	
}
