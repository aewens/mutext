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
            element = if element.length is 1 then element[0] else element
            obj =
                element: element
                add: (dom) ->
                    element.appendChild dom.element
                css: ->
                    switch arguments.length
                        when 1
                            arg = arguments[0]
                            if typeof(arg) is "object"
                                for k, v of arg
                                    element.style[k] = v
                                return obj
                            else if typeof(arg) is "string"
                                return element.style[arg]
                            else
                                return obj
                        when 2
                            k = arguments[0]
                            v = arguments[1]
                            element.style[k] = v
                            return obj
                        else return obj
                attr: ->
                    switch arguments.length
                        when 1
                            return element.getAttribute(arguments[0])
                        when 2
                            k = arguments[0]
                            v = arguments[1]
                            element.setAttribute(k, v)
                            return obj
                        else return obj
                hasAttr: (attr) ->
                    return element.hasAttribute(attr)
                on: (event, fn) ->
                    element.addEventListener(event, fn)
                    return obj
                val: ->
                    switch arguments.length
                        when 0
                            return element.value
                        when 1
                            return element.value = arguments[0]
                        else return obj
                html: ->
                    switch arguments.length
                        when 0
                            return element.innerHTML
                        when 1
                            return element.innerHTML = arguments[0]
                        else return obj
                addClass: ->
                    element.classList.add.apply(null, arguments)
                    return obj
                removeClass: (klass) ->
                    element.classList.remove(klass)
                    return obj
                hasClass: (klass) ->
                    element.classList.contains(klass)
                    return obj
                toggleClass: (klass) ->
                    element.classList.toggle(klass)
                    return obj
    return $
