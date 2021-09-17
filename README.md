# MarvelCharacterListSample

# Project info
> - Xcode 12.4
> - Swift 5.3
> - VIP with xibs.
> - Cocoapods

<br/>

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

#### Kingsfisher: https://github.com/onevcat/Kingfisher
Used for downloading and caching remote images caming from json service call.

</br>


# Unit Testing
Testing has been developed with some examples, focused mainly on MarvelCharactersLists.

Coverage 61% aprox.

<br>

## Version History
* 0.0.1
 * [Add changes]
