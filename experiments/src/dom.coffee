define ->
    $ =
        create: (selector) ->
            obj =
                element: document.createElement(selector)
                into: (element) -> 
                    element.appendChild @element
                    Object.create(obj)
                add: (dom) ->
                    @element.appendChild dom.element
            obj
        find: (selector) ->
            element = document.querySelectorAll(selector)[0]
            return null if element is undefined
            return if element.length is 1 then element[0] else element
            
