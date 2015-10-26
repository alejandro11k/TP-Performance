package unq.tpi.persistencia.performanceEj.servicios

import unq.tpi.persistencia.performanceEj.daos.EmployeeDAO

class ListadoMaximosSalarios extends AbstractListado {

	new(String fileName) {
		super(fileName)
	}

	override def doListado() throws Exception {
		val empleados = new EmployeeDAO().getTopTen()

		// Imprime el sueldo de los 10 primeros empleados en la coleccion		
		addColumn("Nombre").addColumn("Sueldo").newLine()
		empleados.forEach[
			addColumn(it.fullName).addColumn(it	.salary).newLine()
		]
	}

}
