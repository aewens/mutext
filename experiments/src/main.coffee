require.config
    urlArgs: "nocache=" + (new Date).getTime()
        
require [
    "dom"
], ($) ->
    # Testing Microframework
    _tests = []
    check = (res, expect) -> _tests.push [res is expect, res, expect]
    determ = ->
        passed = 0
        for t in _tests
            if t
                passed = passed + 1
            else
                console.log "#{i}: #{_tests[t][1]} #{_tests[t][2]}"
        console.log "---"
        console.log "#{passed}/#{_tests.length} passed"
