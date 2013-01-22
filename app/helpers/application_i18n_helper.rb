module ApplicationI18nHelper

  # Translates all the model constraints of a model object
  def translate_options_for( collection )
    collection.map do |translation|
      [ t(translation[0].downcase.gsub( /\s/ , "_" ), :default => translation[0]), 
        translation[1] ]
    end
  end
  
  # Gets the translation in a model constraint for a db_value
  def translate_option_for( collection, db_value )
    collection.inject("") do |translation, pair|
       if pair[1] == db_value 
         t(pair[0].downcase.gsub( /\s/ , "_" ), :default => pair[0]) 
       else
         translation
       end
    end
  end
 
    def error_explanation_for(record)
    explanation = ""
    explanation =  <<-ERROR_EXPLANATION if record.errors.any? 
    <div id="error_explanation">
      <h2> 
             #{ record.errors.count } #{t('error', :count => record.errors.count)} #{t('prohibited_from_being_saved', :count => record.errors.count)} #{t("#{record.class.to_s}.gender", :count => 1)} 
      </h2>

      <ul>
       #{ list_error_items_for record.errors.full_messages} 
      </ul>
    </div>

    ERROR_EXPLANATION
    explanation.html_safe
  end
 
  def list_error_items_for (msgs)
    final = ""
   msgs.each do |msg| 
     final << "<li>" << msg << "</li>\n"
   end
    final
  end 

end
