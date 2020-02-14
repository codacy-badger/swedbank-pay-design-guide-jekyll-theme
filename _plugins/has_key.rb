module HasKeyFilter
    def has_key(object, element)
        object.key?(element)
    end
end

Liquid::Template.register_filter(HasKeyFilter)
