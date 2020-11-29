# Botones

Este paquete define los botones "animados" para el proyecto de transformación. 

Instalación:

Desde XCode: File->Swift Packages->Add PackageDependency
Introducimos la url de este repositorio.


Ejemplo de uso:


1.- Insertamos un botón en nuestro formulario(UIButton).

2.- En el inspector de objetos actualizamos la Clase del botón a: MiListaButton del módulo: Botones.

En nuestro ViewController utilizamos como sigue:

3.- Definimos la variable:
    @IBOutlet weak var boton: MiListaButton!
    
4.- En el método viewDidLoad de tu controlador de vista inicializamos el estado:

    boton.estaEnLista(enMiLista: false)
    
5.- En el método que gestiona el evento de "boton pulsado" llamamos al método para que se muestre la animación:
    
    @IBAction func boton_pulsado(_ sender: MiListaButton) {
        sender.animacion()
    }
    



