
#cod_baras  nombre  tipo  descripcion  precio
#1.000.000 productos - precio(50, 1000)

from random import choice, uniform, randrange

tipo = ["menaje","cosmetico","ocio","alimentacion","electronica","deportes","ropa"]

descripcion = ["muy buena", "buena", "normal", "mala", "muy mala"]

provincias = ['Alava','Albacete','Alicante','Almeria','Asturias','Avila','Badajoz','Barcelona','Burgos','Caceres',
'Cadiz','Cantabria','Castellon','Ciudad Real','Cordoba','La Coruna','Cuenca','Gerona','Granada','Guadalajara',
'Guipuzcoa','Huelva','Huesca','Islas Baleares','Jaen','Leon','Lerida','Lugo','Madrid','Malaga','Murcia','Navarra',
'Orense','Palencia','Las Palmas','Pontevedra','La Rioja','Salamanca','Segovia','Sevilla','Soria','Tarragona',
'Santa Cruz de Tenerife','Teruel','Toledo','Valencia','Valladolid','Vizcaya','Zamora','Zaragoza']

dniLetras = ['T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E']

puestos = ["cajero","cajera","reponedor","reponedora","dependiente","dependienta","mozo de almacen","moza de almacen","encargado","encargada"]

def generador_productos():
    productosW = open("productos.txt","w")
    lista_codigos = []
    cadenaFinal = ""

    for cod_barras in range(1, 1000001):
        fila = ""
        fila += str(cod_barras) + ";"
        fila += "producto" + str(cod_barras) + ";"
        fila += choice(tipo) + ";"
        fila += choice(descripcion) + ";"
        fila += str(randrange(50,1001)) + "\n"

        cadenaFinal += fila

        lista_codigos.append(cod_barras)
    productosW.write(cadenaFinal)
    productosW.close()
    print("termino productos")
    #print(cadenaFinal)
    #print(lista_codigos)

    return lista_codigos

#id_tienda  nombre  ciudad barrio provincia
#200.000 tiendas -
def generador_tiendas():
    tiendasW = open("tiendas.txt","w")
    lista_tiendas = []
    cadenaFinal = ""

    for id_tienda in range(1,200001):
        fila = ""
        fila += str(id_tienda) + ";"
        fila += "tienda" + str(id_tienda) + ";"
        fila += "ciudad" + str(randrange(1,21)) + ";"
        fila += "barrio" + str(randrange(1,21)) + ";"
        fila += choice(provincias) + "\n"

        cadenaFinal += fila

        lista_tiendas.append(id_tienda)
    tiendasW.write(cadenaFinal)
    tiendasW.close()
    print("termino tiendas")
    #print(cadenaFinal)
    #print(lista_tiendas)

    return lista_tiendas

#id_tienda  codigobarras  stock
#1 tienda - 100 productos
#stock entre 10 y 200
def generador_tiendaProducto():
    tiendas_productosW = open("tienda_productos.txt","w")
    cadenaFinal = ""
    for tienda in range(1,200001):
        productos_escogidos=[]
        rango = randrange(95,106)
        for producto in range (1,rango+1):
           
            fila = ""
            fila += str(tienda) + ";"
            productoElegido = randrange(1,1000001)
            
            
            if(not(productoElegido in productos_escogidos)):
                productos_escogidos.append(productoElegido)
                fila += str(productoElegido) + ";"
                fila += str(randrange(10, 201)) + "\n"
                tiendas_productosW.write(fila)
                
            
            
            #cadenaFinal += fila
            
            
        if(tienda%10000==0):
            print(tienda)

    #tiendas_productosW.write(cadenaFinal)
    tiendas_productosW.close()
    print("termino tienda_productos")
    #print(cadenaFinal)

#cod_trabajador  DNI  nombre  apellidos  puesto  salario  id_tiendaFK
#1.000.000 - salario(1000,5000)
def generador_trabajadores(lista_tiendas):
    trabajadoresW = open("trabajadores.txt","w")
    cadenaFinal = ""
    lista_codigoTrabajadores = []
    lista_dni = []

    for cod_trabajador in range(1, 1000001):
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
        fila += str(randrange(1000,5001)) + ";"
        fila += str(lista_tiendas[cod_trabajador%5]) + "\n"

        lista_codigoTrabajadores.append(cod_trabajador)
        if(cod_trabajador%10000==0):
            print(cod_trabajador)

        cadenaFinal += fila
        
    trabajadoresW.write(cadenaFinal)
    trabajadoresW.close()
    print("termino trabajadores")
    #print(cadenaFinal)

    return lista_codigoTrabajadores

#n_ticket, importe, fecha, codigo_trabajador_trabajador
#5000000 tickets, importe entre 100 y 10000. Fechas en 2019
def generar_tickets():
    ticketsW = open("tickets.txt","w")
    cadenaFinal = ""
    lista_numeroTicket = []

    for num_ticket in range(1, 5000001):
        fila = ""
        fila += str(num_ticket) + ";"
        fila += str(randrange(100,10000)) + ";"
        
        mes = randrange(1,13)
        if(mes == 2):
            dia = randrange(1,29)
            fila += str(2019) +  "-" + str(mes) + "-" +str(dia) +";"
        elif(mes == 4 or mes == 6 or mes==9 or mes == 11):
            dia = randrange(1,31)
            fila += str(2019) + "-" + str(mes) + "-" + str(dia)  +  ";"
        else:
            dia = randrange(1,32)
            fila += str(2019)+ "-" + str(mes) + "-" + str(dia)  + ";"

        trabajador = str(randrange(1, 1000001))
        fila += trabajador + "\n"
        lista_numeroTicket.append(num_ticket)
        if(num_ticket%10000==0):
            print(num_ticket)
        
        ticketsW.write(fila)
        #cadenaFinal += fila

    #ticketsW.write(cadenaFinal)
    ticketsW.close()

    print("Termino tickets")

    return lista_numeroTicket

#N_ticket_ticket,cod_barras_producto_cantidad
#Cada ticket tiene entre 1 y 10 productos, cantidad entre 1 y 10
def generar_tickets_productos():
    tickets_productosW = open("tickets_productos.txt","w")
    cadenaFinal = ""

    for ticket in range(1, 5000001):
        productos_escogidos=[]
        rango = randrange(1,10)
        for producto in range (1,rango+1):
            fila = ""
            fila += str(ticket) + ";"

            productoElegido = randrange(1,1000001)            
            if(not(productoElegido in productos_escogidos)):
                productos_escogidos.append(productoElegido)
                fila += str(productoElegido) + ";"
                fila += str(randrange(1, 11)) + "\n"
                tickets_productosW.write(fila)
            
            #fila += str(productoElegido) + ";"
            

            #cadenaFinal += fila
            if(ticket%10000==0):
                print(ticket)
            
    #tickets_productosW.write(cadenaFinal)
                
    tickets_productosW.close()
        
    print("Termino tickets_productos")

    

#print("Generando datos productos...")
#lista_codigos = generador_productos()

#print("Generando datos tienda...")
#lista_tiendas = generador_tiendas()

#print("Generando datos tienda_producto...")
#generador_tiendaProducto()

#print("Generando datos trabajadores...")
#lista_trabajadores = generador_trabajadores(lista_tiendas)

print("Generando datos tickets...")
lista_tickets = generar_tickets()

#print("Generando datos tickets_productos...")
#generar_tickets_productos()
print("Todo terminado")

