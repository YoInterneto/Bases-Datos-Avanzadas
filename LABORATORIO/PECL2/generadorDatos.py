
#cod_baras  nombre  tipo  descripcion  precio
#1.000.000 productos - precio(50, 1000)

from random import choice, uniform, randrange

tipo = ["menaje","cosmetico","ocio","alimentacion","electronica","deportes","ropa"]

descripcion = ["muy buena", "buena", "normal", "mala", "muy mala"]

provincias = ['Alava','Albacete','Alicante','Almería','Asturias','Avila','Badajoz','Barcelona','Burgos','Cáceres',
'Cádiz','Cantabria','Castellón','Ciudad Real','Córdoba','La Coruña','Cuenca','Gerona','Granada','Guadalajara',
'Guipúzcoa','Huelva','Huesca','Islas Baleares','Jaén','León','Lérida','Lugo','Madrid','Málaga','Murcia','Navarra',
'Orense','Palencia','Las Palmas','Pontevedra','La Rioja','Salamanca','Segovia','Sevilla','Soria','Tarragona',
'Santa Cruz de Tenerife','Teruel','Toledo','Valencia','Valladolid','Vizcaya','Zamora','Zaragoza']

dniLetras = ['T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E']

puestos = ["cajero","cajera","reponedor","reponedora","dependiente","dependienta","mozo de almacen","moza de almacen","encargado","encargada"]

def generador_productos():

    lista_codigos = []
    cadenaFinal = ""

    for cod_barras in range(1, 200):
        fila = ""
        fila += str(cod_barras) + ";"
        fila += "producto" + str(cod_barras) + ";"
        fila += choice(tipo) + ";"
        fila += choice(descripcion) + ";"
        fila += str(round(uniform(50,1001),2)) + ";\n"

        cadenaFinal += fila

        lista_codigos.append(cod_barras)

    print(cadenaFinal)
    print(lista_codigos)

    return lista_codigos

#id_tienda  nombre  ciudad barrio provincia
#200.000 tiendas -
def generador_tiendas():

    lista_tiendas = []
    cadenaFinal = ""

    for id_tienda in range(1,20):
        fila = ""
        fila += str(id_tienda) + ";"
        fila += "tienda" + str(id_tienda) + ";"
        fila += "ciudad" + str(randrange(1,21)) + ";"
        fila += "barrio" + str(randrange(1,21)) + ";"
        fila += choice(provincias) + "\n"

        cadenaFinal += fila

        lista_tiendas.append(id_tienda)

    print(cadenaFinal)
    print(lista_tiendas)

    return lista_tiendas

#id_tienda  codigobarras  stock
#1 tienda - 100 productos
#stock entre 10 y 200
def generador_tiendaProducto(lista_codigos, lista_tiendas):

    cadenaFinal = ""

    for tienda in lista_tiendas:
        rango = randrange(95,106)
        lista_productosElegidos = []
        for producto in range (1,rango+1):
            fila = ""

            fila += str(tienda) + ";"

            productoElegido = choice(lista_codigos)
            while(productoElegido in lista_productosElegidos):
                productoElegido = choice(lista_codigos)
            lista_productosElegidos.append(productoElegido)

            fila += str(productoElegido) + ";"
            fila += str(randrange(10, 201)) + "\n"

            cadenaFinal += fila

    print(cadenaFinal)

#cod_trabajador  DNI  nombre  apellidos  puesto  salario  id_tiendaFK
#1.000.000 - salario(1000,5000)
def generador_trabajadores(lista_tiendas):

    cadenaFinal = ""
    lista_codigoTrabajadores = []
    lista_dni = []

    for cod_trabajador in range(1, 20):
        fila = ""
        fila += str(cod_trabajador) + ";"

        dni = randrange(10000000, 100000000)
        while(dni in lista_dni):
            dni = randrange(10000000, 100000000)
        lista_dni.append(dni)
        dniCompleto = str(dni) + dniLetras[dni%23]

        fila += dniCompleto + ";"
        fila += "nombre" + str(randrange(1,101)) + ";"
        fila += "apellido1" + str(randrange(1,81)) + "-" + "apellido2" + str(randrange(1,80)) + ";"
        fila += choice(puestos) + ";"
        fila += str(round(uniform(1000,5001),2)) + ";"
        fila += str(lista_tiendas[cod_trabajador%5]) + "\n"

        lista_codigoTrabajadores.append(cod_trabajador)

        cadenaFinal += fila

    print(cadenaFinal)

    return lista_codigoTrabajadores




lista_codigos = generador_productos()
lista_tiendas = generador_tiendas()
generador_tiendaProducto(lista_codigos, lista_tiendas)
generador_trabajadores(lista_tiendas)


