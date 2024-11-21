Class Persona
    public nombre as string
    public edad as int

    construct (nombre: string, edad: int) 
        self.nombre = nombre 
        self.edad = edad


Class GrupoPersonas
    construct() 
        personas = new array of Persona 
    
    def add(nombre: string, edad: int) 
        persona = new Persona(nombre, edad) 
        personas.append(persona) 

    // Función que devuelve la cantidad de personas en el conjunto 
    def size(): int 
        return personas.size() 
    
    // Función que devuelve el subconjunto de personas mayores de edad 
    def mayores_de_edad(): array of Persona 
        mayores = new array of Persona foreach persona in personas 
        if persona.edad >= 18 mayores.append(persona) 
        return mayores
