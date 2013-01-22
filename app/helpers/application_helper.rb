module ApplicationHelper

  def conditional_link(level, content)
   if level.url.blank?
     content
   else
     link_to content, level.url
   end
  end

  def show_fields(attributes, model)
    output = attributes.inject("") do |output, attr|
       output << (model.send(attr).blank? ? "" : <<-OUTPUT)
         <p>
         <b>#{ t("activerecord.attributes.#{model.class.name.underscore}.#{attr.to_s}").capitalize }:</b>
         #{ model.send(attr) }
         </p>
       OUTPUT
    end
    output.html_safe
  end

end
