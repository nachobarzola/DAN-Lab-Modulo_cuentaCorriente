package dan.tp2021.cuentacorriente.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;




import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(
  use = JsonTypeInfo.Id.NAME,
  include = JsonTypeInfo.As.PROPERTY, property = "tipo"
)
@JsonSubTypes({
    @JsonSubTypes.Type(value = Cheque.class, name = "cheque"),
    @JsonSubTypes.Type(value = Efectivo.class, name = "efectivo"),
    @JsonSubTypes.Type(value = Transferencia.class, name = "transferencia")
})
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MedioPago {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // valor autonumerico
	protected Integer id;

	protected String observacion;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

}
