#
# Terms from RFC 6570 (URI Template) March 2012:
#
#    expression:  The text between '{' and '}', including the enclosing
#       braces, as defined in Section 2.
#
#    expansion:  The string result obtained from a template expression
#       after processing it according to its expression type, list of
#       variable names, and value modifiers, as defined in Section 3.
#
#    template processor:  A program or library that, given a URI Template
#       and a set of variables with values, transforms the template string
#       into a URI reference by parsing the template for expressions and
#       substituting each one with its corresponding expansion.
#
# see http://tools.ietf.org/html/rfc6570
#
# Public: Add uri-template supports with expansion method
#
# Examples
#
# With this json
# { "value": 10,
#   "name": "Test",
#   "query": null,
#   "tested": false,
#   "links": [
#     {
#       "href": "http://local.tester.anti.bug/{term:1}/{term}",
#       "rel": "search",
#       "type": "application/json"
#     },
#     {
#       "href": "http://local.tester.anti.bug/foo{?query,number}",
#       "rel": "another_search",
#       "type": "application/json"
#     },
#     {
#       "href": "http://local.tester.anti.bug/resource/index",
#       "rel": "self",
#       "type": "application/json"
#     }
#   ] }
#
# You can do this
#   resource = Restfolia.at(url).get.link('search').expansion(:term => "dog")
#   resource.get  # => GET url http://local.tester.anti.bug/d/dog
#
module Restfolia::ExpansionSupport

  INVALID_PARAMETER = "parameter must to be a Hash object"
  INVALID_URL       = "Invalid url"

  # Public: Execute expansion
  #
  # json - Hash that contains replacements params
  #
  # Raises ArgumentError if json parameter is not a Hash object.
  # Raises ArgumentError if generated url is invalid.
  def expansion(replacements)
    raise(ArgumentError, INVALID_PARAMETER, caller) unless replacements.is_a?(Hash)

    # accessing hash by symbol or string key
    replacements.inject({}) { |memo,(k,v)| memo[k.to_s] = v; memo }
    expanded_url = URITemplate.new(@url).expand(replacements)

    raise(ArgumentError, INVALID_URL, caller) if (expanded_url =~ URI::regexp).nil?
    Restfolia::EntryPoint.new(expanded_url)
  end

end