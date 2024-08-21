sub main()
    ' Empieza a escribir tu codigo a partir de esta linea

    print "Problema 1: Algoritmo para Encontrar el Número Mayor en un Array"
    numeroMayor([2,3,-5,-100])

    print "__________________________________________________________________"

    print "Problema 2: Algoritmo para Calcular el Factorial de un Número"
    factorial(3)
    factorial(0)
    factorial(1)

    print "__________________________________________________________________"

    print "Problema 3: Algoritmo para Generar la Serie de Fibonacci n=4"
    print fibonacci(4)
end sub


sub factorial(num as integer)
    n = num
    fact = 1
    array = [n]
    cant = array.count()
    if n = 0
        print "El factorial de 0 es 1"
    end if
    if n = 1
        print "El factorial de 1 es 1"
    end if
    if n > 1
        while cant < n
            n = n - 1
            array.push(n)
        end while
        for each number in array
            fact = fact*number
        end for
        print "El factorial de", num, "es", fact
    end if
end sub
sub numeroMayor(array as object)
    nm = array.getEntry(0)
    for each element in array
        if element > nm
            nm = element
        end if
    end for
    print "El número mayor del array [2,3,-5,-100] es", nm
end sub

function fibonacci (n as integer)
    grupo = [0,1]
    cantidad = grupo.count()

    while cantidad < n -1
        cantidad = grupo.count()
        z = grupo[cantidad-1]+ grupo[cantidad-2]
        grupo.push(z)
    end while
    return grupo
end function