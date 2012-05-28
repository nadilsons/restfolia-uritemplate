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
module Restfolia::ExpansionSupport

  INVALID_PARAMETER = "parameter must to be a Hash object"
  INVALID_URL       = "Invalid url"

  def expansion(replacements)
    raise(ArgumentError, INVALID_PARAMETER, caller) unless replacements.is_a?(Hash)

    # accessing hash by symbol or string key
    replacements.inject({}) { |memo,(k,v)| memo[k.to_s] = v; memo }
    expanded_url = URITemplate.new(@url).expand(replacements)

    raise(ArgumentError, INVALID_URL, caller) if (expanded_url =~ URI::regexp).nil?
    Restfolia::EntryPoint.new(expanded_url)
  end

end