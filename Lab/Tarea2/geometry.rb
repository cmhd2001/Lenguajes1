# Clase Circulo
class Circulo
    attr_accessor :radio

    def initialize(radio)
        if (radio < 0)
            raise "Radio inválido."
        else 
            @radio = radio
        end
    end

    def radio=(radio)
        if (radio < 0)
            raise "Radio inválido."
        else 
            @radio = radio
        end
    end

    def radio
        @radio
    end 

    def area
        area =  3.1416 * @radio * @radio
    end
end

# Subclase Cilindro de la clase Circulo
class Cilindro < Circulo
    attr_accessor :altura

    def initialize(radio, altura)
        super(radio) # Utilizamos el initialize de la superclase para inicializar el radio

        if (altura < 0)
            raise "Altura inválida."
        else
            @altura = altura
        end
    end

    def altura
        @altura
    end

    def altura=(altura)
        @altura = altura
    end

    def volumen
        volumen = 3.1416 * @radio * @radio * @altura
    end

end

begin 

    C = Circulo.new 4

    puts C.area

    C.radio=3

    puts C.radio

    A = Cilindro.new(4, 5)

    puts A.altura

    puts A.volumen
end