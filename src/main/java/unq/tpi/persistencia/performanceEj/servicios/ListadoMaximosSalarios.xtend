package unq.tpi.persistencia.performanceEj.servicios

import java.util.Comparator
import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO
import unq.tpi.persistencia.performanceEj.model.Employee

class ListadoMaximosSalarios extends AbstractListado {

	new(String fileName) {
		super(fileName)
	}

	override def doListado() throws Exception {
		val empleados = new EmployeeDAO().getTopTen()

		// Imprime el sueldo de los 10 primeros empleados en la coleccion		
		addColumn("Nombre").addColumn("Sueldo").newLine()
		(0..9).forEach[
			val e = empleados.get(it)
			addColumn(e.fullName).addColumn(e.salary).newLine()
		]
	}

}
