# MarvelCharacterListSample

# Project info
> - Xcode 12.4
> - Swift 5.3
> - VIP with xibs.
> - Cocoapods

<br/>

En la pantalla de MarvelCharactersList se uitlizan:

- Alamofire para las llamadas.
- Gloss para la lectura del json recibido.
- Kingsfisher para la carga de imagenes en la pantalla.
- Arquitectura VIP modificada para su uso mediante Xibs.

- Diseño por storyboard con una tabla sencilla y su correspondiente celda.

En la pantalla de MarvelCharacterDetails se utilizan:
- Alamofire para las llamadas.
- Decodificacion normal para la lectura del json recibido.
- Kingsfisher para la carga de imagenes en la pantalla.
- Arquitectura VIP modificada para su uso mediante Xibs.

- Diseño por storyboard de la ficha del personaje indicando varios datos del mismo.



# Architecture: VIP
Clean code architecture modified and created by Uncle Bob : https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template

Base on a VIP architecture, this one has the capacity of apply this architecture by using only Xib files.

## Architecture strutcure:
ViewController
Presenter: Will handle the info extrated from API services calling.
Interactor: Will be in charge of API services calling.
Router: Will route to the desired ViewController.
Model: Will contain the models and structures used on the desired scene,
Factorable: Union nexus of the architecture.

<br/>

# Cocoapods

The most extended dependency manager. Will help to install pods (dependencies) and use them.

## Used third party libraries:
### Alamofire: https://cocoapods.org/pods/Alamofire
Http networking library for service calling. Used this one because is one of the most extended one.

### Kingsfisher: https://github.com/onevcat/Kingfisher
Used for downloading and caching remote images caming from json service call.

</br>


# Unit Testing

For this code test, I only include unit testing for APIManager, both from app and package. In a future app and Image extension, we can cover much more source tested.

I only follow the unit testing method, not test driven using TDD (not possible BDD because I havn't had client side), but in a future project we can work with both testing methodologies.

<br>

## Version History
* 0.0.1
 * [Add changes]
