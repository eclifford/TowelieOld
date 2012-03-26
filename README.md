# Towelie JS Architecture

Towelie is a [CoffeeScript](http://coffeescript.org/) centric architecture for building large, performant, testable front end applications.

## Highlights
* Integrated with [Middleman](http://middlemanapp.com/guides/coffeescript-sprockets/)(not really a dependency)
* Build with [Backbone](http://http://documentcloud.github.com/backbone/)Backbone & [Underscore](http://http://documentcloud.github.com/underscore/)
* Integrated AMD with [RequireJS](http://requirejs.org/)
* Support for JIT inclusion of Underscore Templates
* Rough in's for a Fascade and Mediator pattern for for inter module communciation as discussed [Addy Osmani](http://http://addyosmani.com/largescalejavascript/) and [Nicholas Zakas](http://http://www.youtube.com/watch?v=vXjVFPosQHw)
* CLI and Browser BDD testing with [Mocha](http://http://visionmedia.github.com/mocha/) 
* CLI and Browser compatible [Chai](http://http://chaijs.com/) assertion library
* Spies, Stubs and Mocks with shimmed [Sinon](http://sinonjs.org/)
* Rough in support for [Codo](https://github.com/netzpirat/codo) code documentation

## Install dependencies
```bash
$ npm install
```

## Module Example
Below is an example of a well formed AMD module.

```CoffeeScript
# A Contact Model
#
# @author Eric Clifford
#
define ["underscore", "backbone"], (_, Backbone)->
  Contact = Backbone.Model.extend(

    ###
    # Set the model defaults
    ###
    defaults:
      photo: "/images/placeholder.png"
      name: ""
      address: ""
      tel: ""
      email: ""
      type: ""

    ###
    # Verify the validity of model
    ###
    validate: (attrs) ->
      if attrs.photo is ""
        "photo cannot be empty"
  )
  Contact
```

## Running CLI tests
  mocha [options]

## Authors
Eric Clifford
Curtis Steckel

## License 
(The MIT License)

