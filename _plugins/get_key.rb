module GetKeyFilter
    def get_key(object, element)
        object.key(element)
    end
end

Liquid::Template.register_filter(GetKeyFilter)
