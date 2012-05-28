restfolia-uritemplate
======================

Adds support to uri-templates in the dsl [restfolia](https://github.com/rogerleite/restfolia) with
the help of gem [uri_template](https://github.com/hannesg/uri_template)

See more about uri-template in [RFC 6570](http://tools.ietf.org/html/rfc6570)

Example of use
--------------
```js
// GET http://local.service.net/id/1
{
  "value": 10,
  "name": "Test",
  "query": null,
  "tested": false,
  "links": [
    {
      "href": "http://local.service.net/{term:1}/{term}",
      "rel": "search",
      "type": "application/json"
    },
    {
      "href": "http://local.service.net/foo{?query,number}",
      "rel": "another_search",
      "type": "application/json"
    },
    {
      "href": "http://local.service.net/resource/index",
      "rel": "self",
      "type": "application/json"
    }
  ]
}
```

```ruby
# getting a resource
resource = Restfolia.at('http://local.service.net/id/1').get

# example of hypermedia navigation with uri-template
new_resource_ = resource.link('search').expansion(:term => "dog")
search = new_resource.get  # => get to url http://local.service.net/d/dog
```

Copyright
---------
Copyright (c) 2012 Nadilson. See LICENSE.txt for
further details.
