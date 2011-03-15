# Yipit

Simple Ruby wrapper for the Yipit [API](http://yipit.com/about/api_overview/). [Yipit](http://yipit.com) features deals aggregated from a number of sources, includng Groupon, LivingSocial, Restaurants.com, and more.

## Under development

    This bitch ain't ready for production yet.  Recognize.

## Installation

    sudo gem install yipit
    
## Usage

You'll need a Yipit [API key](http://yipit.com/account/login/?next=/about/api_key/).

### Instantiate
    require 'Yipit'
    client = Yipit::Client.new(YOUR_API_KEY)
    
Yipit uses a [`Hashie::Mash`](https://github.com/intridea/hashie) for return values, providing a handy hash that supports dot notation:

    deal.title
    => "$100 Gift Certificate, Your Price $40"
    deal.division.name
    => "New York"
    
### Issues
  GitHub issue tracking sucks.  Submit issues to [`Lighthouse`](https://yipit.lighthouseapp.com)

<a name="changelog"></a>
## Changelog

### 0.0.1 - March 14, 2011

* Initial version


## Under the hood
* [`Faraday`](https://github.com/technoweenie/faraday) REST client
* [`Hashie::Mash`](http://github.com/intridea/hashie)  Magic

## How to contribute
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright (c) 2011 [Josh Deeden](http://twitter.com/jdeeden). 
