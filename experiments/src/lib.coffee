define ->
    _ = {}
    _.dom = _.$ = 
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
            _.$.load(if element.length is 1 then element[0] else element)
        load: (element) ->
            return {
                add: (dom) ->
                    element.appendChild dom.element
                css: ->
                    switch arguments.length
                        when 1
                            arg = arguments[0]
                            if typeof(arg) is "object"
                                for k, v of arg
                                    element.style[k] = v
                                return _.$.load(element)
                            else if typeof(arg) is "string"
                                return element.style[arg]
                            else
                                return _.$.load(element)
                        when 2
                            k = arguments[0]
                            v = arguments[1]
                            element.style[k] = v
                            return _.$.load(element)
                        else return _.$.load(element)
                on: (event, fn) ->
                    element.addEventListener(event, fn)
                    return _/_.$.load(element)
                val: ->
                    switch arguments.length
                        when 0
                            return element.value
                        when 1
                            return element.value = arguments[0]
                        else return _.$.load(element)
                html: ->
                    switch arguments.length
                        when 0
                            return element.innerHTML
                        when 1
                            return element.innerHTML = arguments[0]
                        else return _.$.load(element)
                attr:
                    get: (a) ->
                        return element.getAttribute(a)
                    set: (k, v) ->
                        element.setAttribute(k, v)
                        return _.$.load(element)
                    has: (a) ->
                        return element.hasAttribute(a)
                group:
                    add: (klass) ->
                        element.classList.add(klass)
                        return _.$.load(element)
                    remove: (klass) ->
                        element.classList.remove(klass)
                        return _.$.load(element)
                    has: (klass) ->
                        element.classList.contains(klass)
                        return _.$.load(element)
                    toggle: (klass) ->
                        element.classList.toggle(klass)
                        return _.$.load(element)
            }
    
    return _
