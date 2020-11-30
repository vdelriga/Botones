# Botones

Botones con diferentes animaciones

Instalación:

Desde XCode: File->Swift Packages->Add PackageDependency
Introducimos la url de este repositorio:
https://github.com/vdelriga/Botones.git


Ejemplo de uso:


1.- Insertamos un botón en nuestra vista(UIButton).

2.- En el inspector de objetos actualizamos la Clase del botón a por ejemplo: "MiListaButton" del módulo: Botones.

En nuestro ViewController importamos el módulo y utilizamos como sigue:

    import Botones

3.- Definimos la variable botón:

    @IBOutlet weak var boton: MiListaButton!
    
4.- En el método viewDidLoad de tu controlador de vista inicializamos el estado:

    boton.estaEnLista(enMiLista: false)
    
5.- En el método que gestiona el evento de "boton pulsado" invocamos al método que gestiona la animación:
    
    @IBAction func boton_pulsado(_ sender: MiListaButton) {
        sender.animacion()
    }
    



