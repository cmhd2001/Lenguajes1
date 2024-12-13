class Moneda
    attr_reader :valor

    def initialize(valor)
        @valor = valor
    end

    def en(divisa)
        divisa.cambia(self)
    end

    def cambia(moneda)
        raise NotImplementedError "Este metodo debe ser implementado por cada subclase"
    end
end

class Dolar < Moneda

    def initialize(valor)
        super(valor)
    end

    def to_s
        "#{@valor} USD"
    end

    def cambia(divisa)
        divisa.de_dolar(self)
    end

    def de_dolar(:dolares)
        self
    end

    def de_euro(:euros)
        Dolar.new(euro.valor * 1.04829)
    end    

    def de_yen(:yenes)
        Dolar.new(yen.valor / 152.27074)
    end

    def de_bolivar(:bolivares)
        Dolar.new(bolivar.valor / 46.7537 )
    end

    def de_bitcoin(:bitcoins)
        Dolar.new(bitcoin.valor * 92871.2)
    end
end

class Euro < Moneda

    def initialize(valor)
        super(valor)
    end

    def to_s
        "#{@valor} EUR"
    end

    def cambia(divisa)
        divisa.de_euro(self)
    end

    def de_dolar(:dolares)
        Euro.new(dolar.valor / 1.04829)
    end

    def de_euro(:euros)
        self
    end    

    def de_yen(:yenes)
        Euro.new(yen.valor / 159.597)
    end

    def de_bolivar(:bolivares)
        Euro.new(bolivar.valor / 49.077359 )
    end

    def de_bitcoin(:bitcoins)
        Euro.new(bitcoin.valor * 88761.54)
    end
end

class Yen < Moneda

    def initialize(valor)
        super(valor)
    end

    def to_s
        "#{@valor} JPY"
    end
    
    def cambia(divisa)
        divisa.de_yen(self)
    end

    def de_dolar(:dolares)
        Yen.new(dolar.valor * 152.288)
    end

    def de_euro(:euros)
        Yen.new(euro.valor * 159.597)
    end    

    def de_yen(:yenes)
        self
    end

    def de_bolivar(:bolivares)
        Yen.new(bolivar.valor * 3.257239)
    end

    def de_bitcoin(:bitcoins)
        Yen.new(bitcoin.valor * 14125895.62)
    end
end

class Bolivar < Moneda
    
    def initialize(valor)
        super(valor)
    end
    
    def to_s
        "#{@valor} VES"
    end

    def cambia(divisa)
        divisa.de_bolivar(self)
    end

    def de_dolar(:dolares)
        Bolivar.new(dolar.valor * 46.7537)
    end

    def de_euro(:euros)
        Bolivar.new(euro.valor * 49.077359)
    end    

    def de_yen(:yenes)
        Bolivar.new(yen.valor / 3.257239)
    end

    def de_bolivar(:bolivares)
       self
    end

    def de_bitcoin(:bitcoins)
        Bolivar.new(bitcoin.valor * 4342072.22344)
    end
end

class Bitcoin < Moneda
    
    def initialize(valor)
        super(valor)
    end
    
    def to_s
        "#{@valor} BTC"
    end

    def cambia(divisa)
        divisa.de_bitcoin(self)
    end

    def de_dolar(:dolares)
        Bitcoin.new(dolar.valor / 92871.2)
    end

    def de_euro(:euros)
        Bitcoin.new(euro.valor / 88761.54)
    end    

    def de_yen(:yenes)
        Bitcoin.new(yen.valor / 14125895.62)
    end

    def de_bolivar(:bolivares)
        Bitcoin.new(bolivar.valor / 4342072.22344)
    end

    def de_bitcoin(:bitcoins)
        self
    end
end

module Divisas
    def dolares
        Dolar.new(self)
    end

    def euros
        Euro.new(self)
    end

    def yenes 
        Yen.new(self)
    end

    def bolivares 
        Bolivar.new(self)
    end

    def bitcoins
        Bitcoin.new(self)
    end
end

class Float
    include Divisas
end

begin

    d = Dolar.new(33.44.dolares)

    puts d.en(:bolivares)


end