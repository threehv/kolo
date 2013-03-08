# Kolo

Kolo is a really simple gem that collates some of the Javascript and CSS
files that I like to use in my apps.  

That means Bootstrap (responsive) and Knockout.  If you don't like them,
then tough. 

It also includes a few bits and pieces - like my model layer for
Knockout.  

## Installation

Add this line to your application's Gemfile:

    gem 'kolo', git: 'http://github.com/threehv/kolo.git'

And then execute:

    $ bundle

## Usage

Add it to your Rails app.  

Edit application.css and add

*= require bootstrap
*= require bootstrap-overrides

before your require_tree statement.  

Edit your application.js and add

//= require bootstrap
//= require knockout
//= require knockout.mapping
//= require data.access

before your require_tree.  

It expects you to be using the Assets Pipeline and the minifier.  

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
