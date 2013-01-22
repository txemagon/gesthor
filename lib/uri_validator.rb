require 'net/http'

# Thanks Ilya! http://www.igvita.com/2006/09/07/validating-url-in-ruby-on-rails/
# Original credits: http://blog.inquirylabs.com/2006/04/13/simple-uri-validation/
# HTTP Codes: http://www.ruby-doc.org/stdlib/libdoc/net/http/rdoc/classes/Net/HTTPResponse.html

class UriValidator < ActiveModel::EachValidator

  def validate_each(object, attribute, value)

    # If no url is given everything is fine.
    return true if value and value.empty?

    raise(ArgumentError, "A regular expression must be supplied as the :format option of the options hash") unless options[:format].nil? or options[:format].is_a?(Regexp)

    configuration = { :invalid_message => I18n.t('url_invalid_format'), 
                      :unable_to_resolve_message => I18n.t('url_unable_resolve_host'), 
                      :not_responding_message => I18n.t('url_not_responding'), 
                      :format => URI::regexp(%w(http https)) }

    configuration.update(options)
    
    if (value =~ configuration[:format]) != nil
      begin # check header response
        case Net::HTTP.get_response(URI.parse(value))
          when Net::HTTPSuccess then true
          else object.errors.add(attribute, configuration[:not_responding_message]) and false
        end
      rescue # Recover on DNS failures..
        object.errors.add(attribute, configuration[:unable_to_resolve_message]) and false
      end
    else
      object.errors.add(attribute, configuration[:invalid_message]) and false
    end

  end

end


